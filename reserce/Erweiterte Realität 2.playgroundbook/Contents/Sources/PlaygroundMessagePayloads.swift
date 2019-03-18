//
//  PlaygroundMessagePayloads.swift
//
//  Copyright © 2017,2018 Apple Inc. All rights reserved.
//

import UIKit

protocol PlaygroundMessagePayload: Codable {
}

struct CodableColor: Codable {
    var red: CGFloat = 0.0
    var green: CGFloat = 0.0
    var blue: CGFloat = 0.0
    var alpha: CGFloat = 0.0
    
    var color: UIColor {
        return UIColor(red: red, green: green, blue: blue, alpha: alpha)
    }
    
    init(_ color: UIColor) {
        color.getRed(&red, green: &green, blue: &blue, alpha: &alpha)
    }
}

struct PlaceObjectOnPlanePayload: PlaygroundMessagePayload {
    var object: PlaceableObject
    var plane: Plane
    var position: Point
}

struct ObjectColorPayload: PlaygroundMessagePayload {
    var object: PlaceableObject
    var color: CodableColor
}

struct ObjectImagePayload: PlaygroundMessagePayload {
    var object: PlaceableObject
    var imageID: Int
}

struct CachedImagePayload: PlaygroundMessagePayload {
    var imageID: Int
    var imageData: Data
}

struct ActorActionsPayload: PlaygroundMessagePayload {
    var actor: PlaceableObject
    var trigger: Trigger
    var actions: [ActorAction]
}

struct ObjectsPlacedPayload: PlaygroundMessagePayload {
    var objects: [PlaceableObject]
}
