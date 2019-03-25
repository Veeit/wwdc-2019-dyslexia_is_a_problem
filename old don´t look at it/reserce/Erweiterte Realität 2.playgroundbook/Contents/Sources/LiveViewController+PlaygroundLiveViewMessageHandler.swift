//
//  LiveViewController+PlaygroundLiveViewMessageHandler.swift
//
//  Copyright © 2017,2018 Apple Inc. All rights reserved.
//

import PlaygroundSupport
import UIKit

extension LiveViewController: PlaygroundLiveViewMessageHandler {
    
    public func liveViewMessageConnectionClosed() {
        // Once the user taps "Stop", re-show the focus square
        focusSquare.unhide()
    }
    
    public func liveViewMessageConnectionOpened() {
        // Reset the scene whenever user taps "Run My Code"
        restartExperience()
        
        // Automatic VoiceOver to remind user to move iPad
        let axPlaneDetection = NSLocalizedString("Move the iPad around to detect planes.", comment: "Basic plane detection instructions")
        UIAccessibility.post(notification: .screenChanged, argument: axPlaneDetection)
    }
    
    public func receive(_ message: PlaygroundValue) {
        
        guard let liveViewMessage = PlaygroundMessageToLiveView(playgroundValue: message) else { return }
        
        switch liveViewMessage {
            
        case .enableCameraVision:
            break
        case let .placeObjectOnPlane(object: object, plane: plane, position: position):
            
            guard let livePlane = self.planeWith(id: plane.id) else {
                PBLog("Unable to find plane with id: \(plane.id)")
                return
            }
            
            updateQueue.sync {
                guard let virtualObject = self.getVirtualObject(for: object) else {
                    PBLog("Failed to find or create \(object.name) object with id: \(object.id)")
                    return
                }
                
                self.placeObject(object: virtualObject, on: livePlane, at: position)
            }
            
        case let .setCachedImage(imageID: imageID, image: image):
            
            guard let image = image else {
                PBLog("Nil image passed to live view")
                return
            }
            
            PBLog("setCachedImage id: \(imageID) size: \(image.size)")
            
            ImageCache.shared.add(image, for: imageID)

        case let .setObjectColor(object: object, color: color):
            
            updateQueue.sync {
                guard let shape = self.getVirtualObject(for: object) as? LiveShape else {
                    PBLog("Failed to find or create shape with name: \(object.name) id: \(object.id)")
                    return
                }
                shape.color = color
            }
            
        case let .setObjectImage(object: object, imageID: imageID):
            
            updateQueue.sync {
                guard let shape = self.getVirtualObject(for: object) as? LiveShape else {
                    PBLog("Failed to find or create shape with name: \(object.name) id: \(object.id)")
                    return
                }
                
                guard let image = ImageCache.shared.getImageWith(identifier: imageID) else {
                    PBLog("Failed to find cached image with identifier: \(imageID)")
                    return
                }
                shape.image = image
            }

        case .setActorActions(let actor, let trigger, let actions):
            guard let virtualActor = self.getVirtualObject(for: actor) as? LiveActor else {
                fatalError("Failed to find or create \(actor.name) object with id: \(actor.id) as Actor")
            }
            
            switch trigger {
            case .reactBehind:
                virtualActor.behindActions += actions
            case .reactRight:
                virtualActor.turnRightActions += actions
            case .reactLeft:
                virtualActor.turnLeftActions += actions
            case .reactTooClose:
                virtualActor.tooCloseActions += actions
            }
            
        case .announceObjectPlacement(let objects):
            announceObjectPlacement(objects: objects)
        }
    }
}
