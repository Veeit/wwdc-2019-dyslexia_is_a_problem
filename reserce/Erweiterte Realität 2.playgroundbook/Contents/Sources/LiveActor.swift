//
//  LiveActor.swift
//
//  Copyright © 2017,2018 Apple Inc. All rights reserved.
//

import Foundation
import SceneKit

public enum CharacterName: String, Codable {
    case byte
    case blu
    case hopper
    case expert
    case octet
}

public class LiveActor: VirtualObject, ReactsToRendering {
    
    override var placeableObject: PlaceableObject {
        let object = super.placeableObject
        object.name = characterName.rawValue
        return object
    }
    
    public var characterName: CharacterName
    let tooCloseDistance: Float = 0.5 // in meters

    var bodyNode = SCNNode()
    var focusOfTheHeadNode = SCNNode()
    var animationIsPlaying: Bool = false
    
    override var type: VirtualObjectType { return .actor }
    
    override var customAccessibilityDescription: String {
        switch characterName {
        case .byte:
            return NSLocalizedString("Byte", comment: "Localizable and accessible byte description")
        case .blu:
            return NSLocalizedString("Blu", comment: "Localizable and accessible blu description")
        case .hopper:
            return NSLocalizedString("Hopper", comment: "Localizable and accessible hopper description")
        case .expert:
            return NSLocalizedString("Expert", comment: "Localizable and accessible expert description")
        case .octet:
            return NSLocalizedString("Octet", comment: "Localizable and accessible octet description")
        }
    }
    
    private var assetsPath: String { return "Models.scnassets/\(characterName.rawValue)" }
    
    init(name: CharacterName, id: String? = nil) {
        self.characterName = name
        let localAssetsPath = "Models.scnassets/\(characterName.rawValue)"
        
        super.init(path: localAssetsPath, modelName: "neutral", fileExtension: "scn", id: id)
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadModel() {
        guard let virtualObjectScene = SCNScene(named: "\(modelName).\(fileExtension)", inDirectory: assetsPath) else {
            return
        }
        
        for child in virtualObjectScene.rootNode.childNodes {
            child.movabilityHint = .movable
            bodyNode.addChildNode(child)
        }
        
        // Set a reasonable scale for the chameleon.
        self.addChildNode(bodyNode)
        
        preloadAnimations()
        
        prepareLightSourcesForAmbientLightEstimation()
        isModelLoaded = true
    }
    
    // MARK: - Behavior Protocol Implementations
    
    func reactToRendering() {
        guard isModelLoaded, let pointOfView = viewController?.sceneView.pointOfView?.presentation else {
            return
        }
        
        // Correct the user position such that it is a few centimeters in front of the camera.
        let inFrontOfCameraNode = SCNNode()
        inFrontOfCameraNode.position.z = -0.015
        inFrontOfCameraNode.name = "inFrontOfCameraNode"
        pointOfView.addChildNode(inFrontOfCameraNode)
        let userPosition = inFrontOfCameraNode.worldPosition
        inFrontOfCameraNode.removeFromParentNode()
        
        // Compute distance between the user and the body of the actor
        let selfToUserDistance = (userPosition - bodyNode.worldPosition).length()
        
        
        // If an animation is already playing, let it finish!
        guard !animationIsPlaying else { return }

        if selfToUserDistance < tooCloseDistance {
            triggerTooCloseCounter += 1
            if triggerTooCloseCounter > 100 {
                triggerTooClose()
            }
        } else {
            triggerTooCloseCounter = 0

            // Obtain relative position of the object to the camera and act accordingly.
            let relativePos = relativePositionToHead(pointOfViewPosition: pointOfView.position)
            
            switch relativePos {
            case .inFrontOf:
                triggerTurnLeftCounter = 0
                triggerTurnRightCounter = 0
                triggerBehindCounter = 0
            case .leftOf:
                triggerTurnLeftCounter += 1
                if triggerTurnLeftCounter > 100 {
                    triggerTurnLeftCounter = 0
                    triggerTurnLeft()
                }
            case .rightOf:
                triggerTurnRightCounter += 1
                if triggerTurnRightCounter > 100 {
                    triggerTurnRightCounter = 0
                    triggerTurnRight()
                }
            case .behind:
                triggerTurnLeftCounter = 0
                triggerTurnRightCounter = 0
                triggerBehindCounter += 1
                if triggerBehindCounter > 100 {
                    triggerBehindCounter = 0
                    triggerBehind()
                }
            case .unknown:
                // Can’t tell the relative positions, so do nothing
                break
            }
        }
    }
    
    var turnRightActions = [ActorAction]()
    private func triggerTurnRight() {
        executeActions(actions: turnRightActions)
    }
    
    var turnLeftActions = [ActorAction]()
    private func triggerTurnLeft() {
        executeActions(actions: turnLeftActions)
    }
    
    var tooCloseActions = [ActorAction]()
    private func triggerTooClose() {
        executeActions(actions: tooCloseActions)
    }
    
    var behindActions = [ActorAction]()
    private func triggerBehind() {
        executeActions(actions: behindActions)
    }
    
    private func executeActions(actions: [ActorAction]) {
        for action in actions {
            switch action {
            case .jump:
                jump()
            case .turnLeft:
                turnLeft()
            case .turnRight:
                turnRight()
            }
        }
    }
    
    // MARK: - Animations: Entire Model
    
    var idleAnimation: SCNAnimation?
    var turnLeftAnimation: SCNAnimation?
    var turnRightAnimation: SCNAnimation?
    var jumpAnimation: SCNAnimation?
    
    func preloadAnimations() {
        idleAnimation = animation(named: "Idle01")
        idleAnimation?.repeatCount = -1
        idleAnimation?.isRemovedOnCompletion = false
        idleAnimation?.keyPath = "idle"
        
        turnLeftAnimation = animation(named: "TurnLeft")
        turnLeftAnimation?.repeatCount = 1
        turnLeftAnimation?.isRemovedOnCompletion = true
        turnLeftAnimation?.blendInDuration = 0.3
        turnLeftAnimation?.blendOutDuration = 0.3
        turnLeftAnimation?.keyPath = "turnLeft"
        
        turnRightAnimation = animation(named: "TurnRight")
        turnRightAnimation?.repeatCount = 1
        turnRightAnimation?.isRemovedOnCompletion = true
        turnRightAnimation?.blendInDuration = 0.3
        turnRightAnimation?.blendOutDuration = 0.3
        turnRightAnimation?.keyPath = "turnRight"
        
        jumpAnimation = animation(named: "Jump")
        jumpAnimation?.repeatCount = 1
        jumpAnimation?.isRemovedOnCompletion = true
        jumpAnimation?.blendInDuration = 0.3
        jumpAnimation?.blendOutDuration = 0.3
        jumpAnimation?.keyPath = "jump"
        
        // Start playing idle animation.
        if let anim = idleAnimation {
            self.childNodes[0].addAnimation(anim, forKey: anim.keyPath)
        }
    }
    
    func animation(named animationName: String) -> SCNAnimation? {
        let animScene = SCNScene(named: animationName, inDirectory: assetsPath)
        var animation: SCNAnimation?
        animScene?.rootNode.enumerateChildNodes({ (child, stop) in
            if !child.animationKeys.isEmpty {
                let player = child.animationPlayer(forKey: child.animationKeys[0])
                animation = player?.animation
                stop.initialize(to: true)
            }
        })
        
        return animation
    }
    
    private var currentAnimationString = ""
    
    func turnLeft() {
        if let anim = turnLeftAnimation {
            carryOutAnimation(anim: anim)
            currentAnimationString = NSLocalizedString("Turned left", comment: "Turned left string")
        }
    }
    
    func turnRight() {
        if let anim = turnRightAnimation {
            carryOutAnimation(anim: anim)
            currentAnimationString = NSLocalizedString("Turned right", comment: "Turned right string")
        }
    }
    
    func jump() {
        if let anim = jumpAnimation {
            carryOutAnimation(anim: anim)
            currentAnimationString = NSLocalizedString("Jumped in surprise!", comment: "Jumped string")
        }
    }
    
    private func carryOutAnimation(anim: SCNAnimation) {
        let modelBaseNode = self.childNodes[0]
        modelBaseNode.addAnimation(anim, forKey: anim.keyPath)
        
        animationIsPlaying = true
        SCNTransaction.begin()
        SCNTransaction.animationTimingFunction = CAMediaTimingFunction(name: .linear)
        SCNTransaction.animationDuration = anim.duration
        modelBaseNode.transform = SCNMatrix4Mult(modelBaseNode.presentation.transform, SCNMatrix4MakeRotation(-Float.pi / 4, 0, 1, 0))
        SCNTransaction.completionBlock = {
            // Tell VoiceOver to alert the user a character moved in some way
            let localizableCharacterMovedText = String.localizedStringWithFormat(NSLocalizedString("%@ %@", comment: "AX notification for character moving."), self.characterName.rawValue, self.currentAnimationString)
            UIAccessibility.post(notification: .screenChanged, argument: localizableCharacterMovedText)
            self.animationIsPlaying = false
        }
        SCNTransaction.commit()
    }
    
    private var triggerTooCloseCounter: Int = 0
    private var triggerTurnLeftCounter: Int = 0
    private var triggerTurnRightCounter: Int = 0
    private var triggerBehindCounter: Int = 0
    
    enum RelativeCameraPositionToActor {
        case unknown
        case inFrontOf
        case leftOf
        case rightOf
        case behind
        
        init (cosineAngle: Float) {
            if Float(cos(135.toRadians)) < cosineAngle {
                self = .inFrontOf
            } else if Float(cos(225.toRadians)) < cosineAngle && cosineAngle < Float(cos(315.toRadians)) {
                self = .rightOf
            } else if cosineAngle < Float(cos(45.toRadians)) {
                self = .behind
            } else if Float(cos(45.toRadians)) < cosineAngle && cosineAngle < Float(cos(135.toRadians)) {
                self = .leftOf
            } else {
                fatalError("Unsupported")
            }
        }
    }
    
    /*
                         Facing Left
                     X        X        X
                      X       |       X
                       X      |      X
                        X     |     X
                         X    |    X
                          X   |   X
                           X  |  X
                            X | X
                             X|X
       Facing Back  Z -------BLU------- Z    Facing Front
                             X|X
                            X | X
                           X  |  X
                          X   |   X
                         X    |    X
                        X     |     X
                       X      |      X
                      X       |       X
                     X        X        X
                         Facing Right
     */
    
    private func relativePositionToHead(pointOfViewPosition: SCNVector3) -> RelativeCameraPositionToActor {
        // Compute angle in horizontal plane between camera position and object.
        let cameraPositionLocal = self.convertPosition(pointOfViewPosition, from: nil)
        let bodyAngle = (bodyNode.rotation.y * bodyNode.rotation.w).toDegrees // the euler angle is w and rotation axis is {0,1,0} -y is negative rotation
        let cameraPositionLocalXZ = SCNVector3(cameraPositionLocal.x, 0, cameraPositionLocal.z)
        
        // The camera is always looking at the origin
        let deltaZ = -cameraPositionLocalXZ.z
        let deltaX = -cameraPositionLocalXZ.x
        let cameraAngle = atan2(deltaX, deltaZ).toDegrees
        
        var relativePosition = RelativeCameraPositionToActor.unknown
        
        let characterDirection = facingDirection(angle: bodyAngle)
        let cameraDirection = facingDirection(angle: cameraAngle)
        
        switch (cameraDirection, characterDirection) {
        case (.north, .north),
             (.west, .west),
             (.east, .east),
             (.south, .south):
            relativePosition = .behind
        case (.west, .east),
             (.east, .west),
             (.south, .north),
             (.north, .south):
            relativePosition = .inFrontOf
        case (.north, .east),
             (.south, .west),
             (.east, .south),
             (.west, .north):
            relativePosition = .leftOf
        case (.north, .west),
             (.south, .east),
             (.east, .north),
             (.west, .south):
            relativePosition = .rightOf
        default:
            relativePosition = .unknown
        }
        
        return relativePosition
    }
    
    private enum Direction {
        case north
        case south
        case east
        case west
        case unknown
    }
    
    private func facingDirection(angle: Float) -> Direction {
        if -45 < angle && angle < 45 {
            return .west
        } else if 45 < angle && angle < 135 {
            return .north
        } else if angle < -135 || 135 < angle {
            return .east
        } else if -135 < angle && angle < -45 {
            return .south
        }
        return .unknown
    }
}

