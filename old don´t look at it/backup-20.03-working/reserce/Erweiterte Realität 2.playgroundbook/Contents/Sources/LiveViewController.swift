//
//  LiveViewController.swift
//
//  Copyright © 2017,2018 Apple Inc. All rights reserved.
//

import ARKit
import SceneKit
import UIKit
import PlaygroundSupport

@objc(LiveViewController)
public class LiveViewController: UIViewController, PlaygroundLiveViewSafeAreaContainer {
    
    // MARK: - UI elements
    @IBOutlet var sceneView: VirtualObjectARView!
    
    var blurView: UIVisualEffectView?
    
    let gridScale = 0.1
    
    // Use average of recent virtual object distances to avoid rapid changes in object scale.
    var recentVirtualObjectDistances = [CGFloat]()
    
    @IBOutlet weak var statusViewControllerContainerView: UIView!
    /// The view controller that displays the status and "restart experience" UI.
    lazy var statusViewController: StatusViewController = {
        return children.lazy.compactMap({ $0 as? StatusViewController }).first!
    }()
    
    // MARK: - AR Config
    
    var session: ARSession {
        return sceneView.session
    }
    
    var sessionConfiguration = ARWorldTrackingConfiguration()
    
    var screenCenter: CGPoint {
        let bounds = sceneView.bounds
        return CGPoint(x: bounds.midX, y: bounds.midY)
    }
    
    var planes = [ARPlaneAnchor: LivePlane]()
    var showingCameraVision = false
    
    var focusSquare = FocusSquare()
    
    let updateQueue = DispatchQueue(label: "com.apple.playgrounds.augmentedreality.serialSceneKitQueue")
    // MARK: - Virtual Objects
    
    // Virtual objects that have been created.
    var virtualObjects = [VirtualObject]()
    
    // MARK: - Convenience Booleans
    
    /// Marks if the AR experience is available for restart.
    var isRestartAvailable = true
    
    lazy var isARWorldTrackingSupported: Bool = { return ARWorldTrackingConfiguration.isSupported }()

    // MARK: Static
    
    public static func makeFromStoryboard() -> LiveViewController {
        let bundle = Bundle(for: LiveViewController.self)
        let storyboard = UIStoryboard(name: "Main", bundle: bundle)
        return storyboard.instantiateViewController(withIdentifier: "LiveViewController") as! LiveViewController
    }
    
    // MARK: View Controller Lifecycle
    
    override public func viewDidLoad() {
        super.viewDidLoad()
        
        Process.setIsLive()
        
        setupScene()
        
        // Constrain statusViewController containing view to LayoutGuide
        NSLayoutConstraint.activate([
            statusViewControllerContainerView.topAnchor.constraint(equalTo: liveViewSafeAreaGuide.topAnchor, constant: 0)
            ])
    }
    
    override public func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        guard isARWorldTrackingSupported else {
            displayUnsupportedMessage()
            return
        }
        
        resetTracking()
        
        // Set up action to describe view at any time
        view.isAccessibilityElement = true
        let newAction = UIAccessibilityCustomAction(name: NSLocalizedString("Describe Scene", comment:"AX custom action to describe scene"), target: self, selector: #selector(axDescriptionAnnouncement))
        view.accessibilityCustomActions = [newAction]
        
        UIAccessibility.post(notification: .announcement, argument: view)
    }
    
    override public func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        // Don’t show the message again
        guard isARWorldTrackingSupported else { return }
        
        session.pause()
    }
    
    private func displayUnsupportedMessage() {
        // This device does not support AR world tracking.
        let title = NSLocalizedString("This challenge is not supported on this device.", comment: "Title for unsupported iPad alert.")
        let message = NSLocalizedString("Augmented reality requires an iPad Pro or iPad (5th generation) running iOS 11.", comment: "Message for augmented reality not supported.")
        let buttonTitle = NSLocalizedString("OK", comment: "OK button title for unsupported iPad alert.")
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        blurBackground()
        alertController.addAction(UIAlertAction(title: buttonTitle, style: .default, handler: { action in
            self.unblurBackground()
        }))
        self.present(alertController, animated: true, completion: nil)
    }
    
    // MARK: Background Blur
    
    private func blurBackground() {
        let blurEffectView = UIVisualEffectView()
        blurEffectView.frame = view.bounds
        blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        view.addSubview(blurEffectView)
        
        UIView.animate(withDuration: 0.5) {
            blurEffectView.effect = UIBlurEffect(style: .light)
        }
        
        blurView = blurEffectView
    }
    
    private func unblurBackground() {
        guard let blurEffectView = blurView else { return }
        
        UIView.animate(withDuration: 0.5, animations: {
            blurEffectView.effect = nil
        }, completion: { (complete: Bool) in
            blurEffectView.removeFromSuperview()
            self.blurView = nil
        })
    }
    
    // MARK: AR Session
    
    /// Creates a new AR configuration to run on the `session`.
    func resetTracking() {
        let configuration = ARWorldTrackingConfiguration()
        configuration.planeDetection = .horizontal
        session.run(configuration, options: [.resetTracking, .removeExistingAnchors])
        
        statusViewController.scheduleMessage(NSLocalizedString("FIND A SURFACE TO PLACE AN OBJECT", comment: "Look for surface status string"), inSeconds: 7.5, messageType: .planeEstimation)
    }
    
    func restartExperience() {
        statusViewController.cancelAllScheduledMessages()
        virtualObjects.removeAll()
        focusSquare.unhide()
        resetTracking()
    }

    // MARK: AR Scene
    
    func setupScene() {
        // set up sceneView
        sceneView.delegate = self
        sceneView.session.delegate = self
        sceneView.automaticallyUpdatesLighting = false
        sceneView.scene.rootNode.addChildNode(focusSquare)
        
        // Ambient light brightens any 3D shapes added to the scene, especially if they have an image applied.
        let ambientLightNode = SCNNode()
        ambientLightNode.light = SCNLight()
        ambientLightNode.light?.type = .ambient
        ambientLightNode.light?.intensity = 500
        sceneView.scene.rootNode.addChildNode(ambientLightNode)

        // Omnidirectional point light enhances any 3D shapes and gives them a sense of depth.
        let omniLightNode = SCNNode()
        omniLightNode.light = SCNLight()
        omniLightNode.light?.type = .omni
        omniLightNode.light?.color = UIColor.white
        omniLightNode.light?.intensity = 500
        sceneView.scene.rootNode.addChildNode(omniLightNode)
        
        // Hook up status view controller callback(s).
        statusViewController.restartExperienceHandler = { [unowned self] in
            self.restartExperience()
        }
    }
    
    @objc func axDescriptionAnnouncement() -> Bool {
        let planeCount = planes.count
        var characterCount = 0
        var objectCount = 0
        var arSceneViewAXDescription = ""
        
        for obj in virtualObjects {
            if obj is LiveActor {
                characterCount += 1
            } else {
                objectCount += 1
            }
        }
        
        if planeCount == 0 && objectCount == 0 && characterCount == 0 {
            arSceneViewAXDescription = NSLocalizedString("The screen is displaying a direct camera feed. Augmented Reality will search for planes as you move the iPad around.", comment: "AX notification for placing object")
        } else if planeCount > 0 && objectCount == 0 && characterCount == 0 {
            let format = NSLocalizedString("sd:chapter1.page3.hintMessage", comment: "AX description {number of planes found}")
            arSceneViewAXDescription = String.localizedStringWithFormat(format, planeCount)
        } else if planeCount > 0 && objectCount > 0 && characterCount == 0 {
            let format = NSLocalizedString("sd:LiveViewController.axDescription.objectsOnly", comment: "AX description {number of planes found} {number of objects placed}")
            arSceneViewAXDescription = String.localizedStringWithFormat(format, planeCount, objectCount)
        } else if planeCount > 0 && objectCount == 0 && characterCount > 0 {
            let format = NSLocalizedString("sd:LiveViewController.axDescription.charactersOnly", comment: "AX description {number of planes found} {number of characters placed}")
            arSceneViewAXDescription = String.localizedStringWithFormat(format, planeCount, characterCount)
        } else {
            let format = NSLocalizedString("sd:LiveViewController.axDescription.objectsAndCharacters", comment: "AX description {number of planes found} {number of objects placed} {number of characters placed}")
            arSceneViewAXDescription = String.localizedStringWithFormat(format, planeCount, objectCount, characterCount)
        }
         UIAccessibility.post(notification: .announcement, argument: arSceneViewAXDescription)
        return true
    }
    
    // MARK: - Focus Square
    
    func updateFocusSquare() {
        // We should always have a valid world position unless the sceen is just being initialized.
        guard let (worldPosition, planeAnchor, _) = sceneView.worldPosition(fromScreenPosition: screenCenter, objectPosition: focusSquare.lastPosition) else {
            updateQueue.async {
                self.focusSquare.state = .initializing
                self.sceneView.pointOfView?.addChildNode(self.focusSquare)
            }
            return
        }
        
        updateQueue.async {
            self.sceneView.scene.rootNode.addChildNode(self.focusSquare)
            let camera = self.session.currentFrame?.camera
            
            if let planeAnchor = planeAnchor {
                self.focusSquare.state = .planeDetected(anchorPosition: worldPosition, planeAnchor: planeAnchor, camera: camera)
            } else {
                self.focusSquare.state = .featuresDetected(anchorPosition: worldPosition, camera: camera)
            }
        }
        statusViewController.cancelScheduledMessage(for: .focusSquare)
    }
    
    // MARK: - Object Placement in Scene
    
    func updateVirtualObjectPosition(object: VirtualObject, _ pos: SCNVector3, _ filterPosition: Bool) {
        guard !virtualObjects.isEmpty else {
            PBLog("No objects exist.")
            return
        }
        
        // We only want to deal with objects that have actually been placed in the scene.
        let placedObjects = virtualObjects.filter{$0.hasBeenPlaced}
        
        guard !placedObjects.isEmpty else {
            PBLog("No objects have been placed in the scene.")
            return
        }
        
        guard let cameraTransform = session.currentFrame?.camera.transform else {
            return
        }
        
        let cameraWorldPos = SCNVector3.positionFromTransform(cameraTransform)
        var cameraToPosition = pos - cameraWorldPos
        
        // Limit the distance of the object from the camera to a maximum of 10 meters.
        cameraToPosition.setMaximumLength(10)
        
        // Compute the average distance of the object from the camera over the last ten
        // updates. If filterPosition is true, compute a new position for the object
        // with this average. Notice that the distance is applied to the vector from
        // the camera to the content, so it only affects the percieved distance of the
        // object - the averaging does _not_ make the content "lag".
        let hitTestResultDistance = CGFloat(cameraToPosition.length())
        
        recentVirtualObjectDistances.append(hitTestResultDistance)
        recentVirtualObjectDistances.keepLast(10)
        
        if filterPosition {
            let averageDistance = recentVirtualObjectDistances.average!
            
            cameraToPosition.setLength(Float(averageDistance))
            let averagedDistancePos = cameraWorldPos + cameraToPosition
            
            for object in placedObjects {
                object.position = averagedDistancePos
            }
        } else {
            for object in placedObjects {
                object.position = cameraWorldPos + cameraToPosition
            }
        }
    }
    
    // So VoiceOver reads all objects at once, instead of interrupting previous VoiceOver notifications
    public func announceObjectPlacement(objects: [PlaceableObject]) {
        // Return if we don’t have any objects to speak about
        guard let firstObject = objects.first else { return }
        
        // Add the first object to an initial string to try and group as many words together for localization ease
        var initialObjectPlacementText = String.localizedStringWithFormat(NSLocalizedString("You placed a %@ at %@,", comment: "AX notification for placing object"), firstObject.name, firstObject.position.description)
        
        // Add the rest of the objects and their positions to the string VoiceOver will speak
        for object in objects {
            // Avoid adding the same first object twice
            guard object != objects.first else { continue }
            
            let nextObjectPlacementText = String.localizedStringWithFormat(NSLocalizedString("A %@ at %@,", comment: "AX notification for placing object"), object.name, object.position.description)
            
            initialObjectPlacementText += nextObjectPlacementText
        }
        
        // Tell VoiceOver to alert the user objects have been placed
        UIAccessibility.post(notification: .screenChanged, argument: initialObjectPlacementText)
    }
    
    // MARK: - Object Placement on Plane
    
    func placeObject(object: VirtualObject, on plane: LivePlane, at gridPosition: Point = Point.center) {

        let position = SCNVector3(Double(gridPosition.x) * gridScale, Double(gridPosition.y) * gridScale, Double(gridPosition.z) * gridScale)
    
        placeObject(object: object, on: plane, at: position, completion: {
            self.send(
                PlaygroundMessageFromLiveView.objectPlacedOnPlane(object: object.placeableObject,
                                                                  plane: Plane(id: plane.id),
                                                                  position: gridPosition).playgroundValue
            )
        })
    }
    
    func placeObject(object: VirtualObject, on plane: LivePlane, at relativePosition: SCNVector3 = SCNVector3Make(0, 0, 0), completion: (() -> Void)? = nil) {
        guard let cameraTransform = self.session.currentFrame?.camera.transform else { return }
        
        guard let scnView = sceneView else { return }
        
        object.viewController = self
        
        DispatchQueue.global(qos: .userInitiated).sync {
            
            object.loadModel()
            
            scnView.prepare([object], completionHandler: { _ in
            
                guard var cameraRotationY: Float = self.session.currentFrame?.camera.eulerAngles.y else { return }
                cameraRotationY = self.calculateFinalCameraYRotation(rotation: cameraRotationY)
                object.rotation.y = cameraRotationY
                self.recentVirtualObjectDistances.removeAll()

                let cameraWorldPos = SCNVector3.positionFromTransform(cameraTransform)
                let cameraToPosition = SCNVector3Zero - cameraWorldPos
                
                // Set the position of the object relative to the center of the plane i.e. relative to the plane’s anchor position.
                // Note: The center of a plane may be offset from the the plane’s anchor position
                // and may change as the plane is updated and its extent changes.
                object.relativePosition = relativePosition
                object.position = cameraWorldPos + cameraToPosition +  plane.positionForRelativePosition(relativePosition)
                
                plane.addChildNode(object)
                
                object.hasBeenPlaced = true
        
                completion?()
            })
        }
    }
    
    private func calculateFinalCameraYRotation(rotation: Float) -> Float {
        var cameraRotationY = rotation
        // Clamps the camera rotation angle so it’s always directly facing one of the plane axes
        // -45 to +45
        if -.pi / 2.0 < cameraRotationY && cameraRotationY < .pi / 2.0 {
            cameraRotationY = .pi
        }
            // +45 to 135
        else if .pi / 2.0 < cameraRotationY && cameraRotationY < 3.0 * .pi / 4.0 {
            cameraRotationY = -.pi / 2.0
        }
            // Greater than 135 OR less than -135
        else if cameraRotationY < -3.0 * .pi / 4.0 || 3.0 * .pi / 4.0 < cameraRotationY {
            cameraRotationY = 0.0
        }
            // -135 to -45
        else if -3.0 * .pi / 4.0 < cameraRotationY && cameraRotationY < -.pi / 2.0 {
            cameraRotationY = .pi / 2.0
        }
        
        return cameraRotationY
    }
    
    // MARK: - Planes
    
    func addPlane(node: SCNNode, anchor: ARPlaneAnchor) {
        updateQueue.async {
            let plane = LivePlane(anchor, true)
            self.planes[anchor] = plane
            node.addChildNode(plane)

            DispatchQueue.main.async {
                // Tell VoiceOver to alert the user a plane was found
                let axPlaneFoundText = NSLocalizedString("You found a plane!", comment: "Found plane AX notification")
                UIAccessibility.post(notification: .screenChanged, argument: axPlaneFoundText)
                self.send(
                    PlaygroundMessageFromLiveView.planeFound(plane: Plane(id: plane.id)).playgroundValue
                )
            }
        }
    }
    
    func removePlane(anchor: ARPlaneAnchor) {
        updateQueue.async {
            if let plane = self.planes.removeValue(forKey: anchor) {
                DispatchQueue.main.async {
                    self.send(
                        PlaygroundMessageFromLiveView.planeRemoved(plane: Plane(id: plane.id)).playgroundValue
                    )
                }
                plane.removeFromParentNode()
            }
        }
    }
    
    func planeWith(id: String) -> LivePlane? {
        let foundPlanes = planes.values.filter( {$0.id == id} )
        return foundPlanes.count > 0 ? foundPlanes[0] : nil
    }
    
    // MARK: - Virtual Objects
    
    func createVirtualObject(from object: PlaceableObject) -> VirtualObject? {
        var virtualObject: VirtualObject? = nil
        
        switch object.type {
        case .actor:
            if let characterName = CharacterName(rawValue: object.name) {
                virtualObject = LiveActor(name: characterName, id: object.id)
            }
        case .gem:
            virtualObject = LiveGem(id: object.id)
        case .shape:
            if let shapeType = ShapeType(rawValue: object.name) {
                virtualObject = LiveShape(type: shapeType, id: object.id)
            }
        case .unknown:
            break
        }
        
        if let virtualObject = virtualObject {
            virtualObjects.append(virtualObject)
        }
        
        return virtualObject
    }
    
    func getVirtualObject(for object: PlaceableObject) -> VirtualObject? {
        let matchingObjects = virtualObjects.filter( {$0.id == object.id} )
        
        if matchingObjects.count > 0 {
            return matchingObjects.first
        } else {
            return createVirtualObject(from: object)
        }
    }
    
    func removeVirtualObjects() {
        updateQueue.async {
            for virtualObject in self.virtualObjects {
                virtualObject.removeFromParentNode()
            }
            self.virtualObjects.removeAll()
        }
    }
    
    // MARK: - Error handling
    
    func displayErrorMessage(title: String, message: String) {
        // Blur the background.
        blurBackground()
        
        // Present an alert informing about the error that has occurred.
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let restartAction = UIAlertAction(title: NSLocalizedString("Restart Session", comment: "Restart session button title"), style: .default) { _ in
            alertController.dismiss(animated: true, completion: nil)
            self.unblurBackground()
            self.restartExperience()
        }
        let okayAction = UIAlertAction(title: NSLocalizedString("OK", comment: "OK button title"), style: .default, handler: nil)
        alertController.addAction(restartAction)
        alertController.addAction(okayAction)
        present(alertController, animated: true, completion: nil)
    }
}
