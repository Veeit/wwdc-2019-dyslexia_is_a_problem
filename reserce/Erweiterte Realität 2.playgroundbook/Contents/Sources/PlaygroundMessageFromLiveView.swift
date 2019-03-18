//
//  PlaygroundMessageFromLiveView.swift
//
//  Copyright © 2017,2018 Apple Inc. All rights reserved.
//

import Foundation
import PlaygroundSupport

/// An enumeration of messages that can be sent from the live view.
/// - localizationKey: PlaygroundMessageFromLiveView
public enum PlaygroundMessageFromLiveView: PlaygroundMessage {
    
    case failed(message: String)
    case planeFound(plane: Plane)
    case planeRemoved(plane: Plane)
    case objectPlacedOnPlane(object: PlaceableObject, plane: Plane, position: Point)
    case succeeded

    // MARK: PlaygroundMessage implementation.

    public enum MessageType: String, PlaygroundMessageType {
        case failed
        case planeFound
        case planeRemoved
        case objectPlacedOnPlane
        case succeeded
    }

    public var messageType: MessageType {
        switch self {
        case .failed(message:):
            return .failed
        case .planeFound(plane:):
            return .planeFound
        case .planeRemoved(plane:):
            return .planeRemoved
        case .objectPlacedOnPlane(object:plane:position:):
            return .objectPlacedOnPlane
        case .succeeded:
            return .succeeded
        }
    }

    public init?(messageType: MessageType, encodedPayload: Data?) {
        
        let decoder = JSONDecoder()

        // Since the message type is derived from a string, we may have been
        // passed a payload for a different type of message that has the same
        // name. We therefore guard against this and return nil if decoding fails.
        switch messageType {
            
        case .failed:
            guard
                let encodedPayload = encodedPayload,
                let message = try? decoder.decode(String.self, from: encodedPayload)
                else {
                    return nil
            }
            self = .failed(message: message)
        
        case .planeFound:
            guard
                let encodedPayload = encodedPayload,
                let plane = try? decoder.decode(Plane.self, from: encodedPayload)
                else {
                    return nil
            }
            self = .planeFound(plane: plane)
            
        case .planeRemoved:
            guard
                let encodedPayload = encodedPayload,
                let plane = try? decoder.decode(Plane.self, from: encodedPayload)
                else {
                    return nil
            }
            self = .planeRemoved(plane: plane)

        case .objectPlacedOnPlane:
            guard
                let encodedPayload = encodedPayload,
                let payload = try? decoder.decode(PlaceObjectOnPlanePayload.self, from: encodedPayload)
                else {
                    return nil
            }
            self = .objectPlacedOnPlane(object: payload.object, plane: payload.plane, position: payload.position)
        
        case .succeeded:
            self = .succeeded
        }
    }

    public func encodePayload() -> Data? {
        
        let encoder = JSONEncoder()

        switch self {
            
        case let .failed(message: message):
            return try! encoder.encode(message)
        
        case let .planeFound(plane: plane):
            return try! encoder.encode(plane)
            
        case let .planeRemoved(plane: plane):
            return try! encoder.encode(plane)

        case let .objectPlacedOnPlane(object: object, plane: plane, position: position):
            let payload = PlaceObjectOnPlanePayload(object: object, plane: plane, position: position)
            return try! encoder.encode(payload)
            
        case .succeeded:
            return nil
        }
    }
}
