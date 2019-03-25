//
//  InitialPageViewController.swift
//
//  Copyright © 2017,2018 Apple Inc. All rights reserved.
//

import UIKit
import PlaygroundSupport
import ARKit

@objc(InitialPageViewController)
public class InitialPageViewController: UIViewController {

    @IBOutlet weak var byteImageView: UIImageView!
    @IBOutlet weak var byteBackgroundView: UIImageView!
    
    lazy var isARWorldTrackingSupported: Bool = { return ARWorldTrackingConfiguration.isSupported }()
    
    var blurView: UIVisualEffectView?
    
    // MARK: Static
    
    public static func makeFromStoryboard() -> InitialPageViewController {
        let bundle = Bundle(for: InitialPageViewController.self)
        let storyboard = UIStoryboard(name: "Main", bundle: bundle)
        return storyboard.instantiateViewController(withIdentifier: "InitialPageViewController") as! InitialPageViewController
    }
    
    override public func viewDidLoad() {
        super.viewDidLoad()
        
        byteImageView.accessibilityLabel = NSLocalizedString("Byte standing in front of a table with nothing on it, holding an iPad. Using augmented reality, Byte can see a flower vase projected on the table through the iPad.", comment: "Accessibility label for image of byte.")
    }
    
    override public func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        guard isARWorldTrackingSupported else {
            displayUnsupportedMessage()
            return
        }
        
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
    }
    
    @objc func axDescriptionAnnouncement() -> Bool {
        let arSceneViewAXDescription = NSLocalizedString("The screen is displaying a direct camera feed. Augmented Reality will search for planes as you move the iPad around.", comment: "AX notification for placing object")
        UIAccessibility.post(notification: .announcement, argument: arSceneViewAXDescription)
        return true
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
    
    // Shows *all* debug visualizations
    func enableCameraVision() {
        AVCaptureDevice.requestAccess(for: .video) { (granted) in
            if granted {
                DispatchQueue.main.async {
                    self.setupScene()
                    self.send(
                        PlaygroundMessageFromLiveView.succeeded.playgroundValue)
                }
            }
            else {
                self.send(
                    PlaygroundMessageFromLiveView.succeeded.playgroundValue)
            }
        }
    }
    
    func setupScene() {
        guard ARWorldTrackingConfiguration.isSupported else { return }
        
        let arscnView = ARSCNView(frame: view.frame)
        arscnView.session = ARSession()
        arscnView.debugOptions = [ARSCNDebugOptions.showFeaturePoints,
                                  ARSCNDebugOptions.showWorldOrigin,
                                  .showBoundingBoxes,
                                  .showWireframe,
                                  .showSkeletons,
                                  .showPhysicsShapes,
                                  .showCameras]
        view.addSubview(arscnView)
        byteImageView.isHidden = true
        byteBackgroundView.isHidden = true
        
        arscnView.translatesAutoresizingMaskIntoConstraints = false
        // Constraints for new arscnView
        NSLayoutConstraint.activate([
            arscnView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0),
            arscnView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0),
            arscnView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 0),
            arscnView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 0),
            ])
        
        arscnView.session.run(ARWorldTrackingConfiguration(), options: [.resetTracking, .removeExistingAnchors])
        
        // Automatic VoiceOver to notify user screen is now on camera view
        let axScreenDescription = NSLocalizedString("The screen is now displaying a direct camera feed.", comment: "Camera screen description initial page.")
        UIAccessibility.post(notification: .screenChanged, argument: axScreenDescription)
    }
}

extension InitialPageViewController: PlaygroundLiveViewMessageHandler {
    public func receive(_ message: PlaygroundValue) {
        guard let liveViewMessage = PlaygroundMessageToLiveView(playgroundValue: message) else { return }
        
        switch liveViewMessage {
        case .enableCameraVision:
            enableCameraVision()
        default:
            break
        }
    }
}
