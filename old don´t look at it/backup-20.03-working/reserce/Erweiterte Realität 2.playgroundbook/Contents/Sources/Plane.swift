//
//  Plane.swift
//
//  Copyright © 2017,2018 Apple Inc. All rights reserved.
//

import Foundation
import PlaygroundSupport

public typealias Character = Actor
public struct Plane: Codable {
    
    public var id: String
    
    public var placedObjects = [PlaceableObject]()
    
    public init(id: String) {
        self.id = id
    }
    
    public func place(character: Character, at position: Point = Point.center) {
        place(object: character, at: position)
    }
    
    public func place(shape: Shape, at position: Point = Point.center) {
        place(object: shape, at: position)
    }
    
    public func place(gem: Gem, at position: Point = Point.center) {
        place(object: gem, at: position)
    }
    
    func place(object: PlaceableObject, at position: Point = Point.center) {
        
        guard let proxy = PlaygroundPage.current.liveView as? PlaygroundRemoteLiveViewProxy else { return }
        
        proxy.send(
            PlaygroundMessageToLiveView.placeObjectOnPlane(object: object, plane: self, position: position).playgroundValue
        )
    }
}

extension Plane: Equatable {
    public static func == (lhs: Plane, rhs: Plane) -> Bool {
        return (lhs.id == rhs.id)
    }
}
