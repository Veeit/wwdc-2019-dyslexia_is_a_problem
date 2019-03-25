//
//  PlaceableObject.swift
//
//  Copyright © 2017,2018 Apple Inc. All rights reserved.
//

import Foundation

public class PlaceableObject: Codable, Hashable {
    public var hashValue: Int {
        return id.data(using: String.Encoding.utf8)!.hashValue
    }
    
    public static func ==(lhs: PlaceableObject, rhs: PlaceableObject) -> Bool {
        return lhs.id == rhs.id
    }
    
    var type = VirtualObjectType.unknown
    var id: String
    var name = String()
    
    public var position = Point.center
    
    init() {
        self.id = UUID().uuidString
    }
}

