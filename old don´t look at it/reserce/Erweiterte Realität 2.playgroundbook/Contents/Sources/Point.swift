//
//  Point.swift
//
//  Copyright © 2017,2018 Apple Inc. All rights reserved.
//

import Foundation
import SceneKit

/// Specifies a point in the scene with x, y and z coordinates.
/// - localizationKey: Point
public struct Point: Codable {
    
    /// The x coordinate for the point.
    /// - localizationKey: Point.x
    public var x: Int
    
    /// The y coordinate for the point.
    /// - localizationKey: Point.y
    public var y: Int
    
    /// The z coordinate for the point.
    /// - localizationKey: Point.z
    public var z: Int
    
    /// Creates a point with x, y and z coordinates.
    /// - localizationKey: Point(x{Int}:y{Int}:z{Int}:)
    public init(x: Int = 0, y: Int = 0, z: Int = 0) {
        self.x = x
        self.y = y
        self.z = z
    }
    
    /// Creates a point with x and z coordinates.
    /// - localizationKey: Point(x{Int}:z{Int}:)
    public init(x: Int = 0, z: Int = 0) {
        self.x = x
        self.y = 0
        self.z = z
    }
    
    /// Returns a point at the center of the co-ordinate system.
    /// - localizationKey: Point.center
    public static let center = Point(x: 0, y: 0, z: 0)
    
    var vector3: SCNVector3 { return SCNVector3(x, y, z) }
    
    /// Returns a description of the point, used for accessibility.
    public var description: String {
        return String.localizedStringWithFormat(NSLocalizedString("Point with coordinates x:%@, y:%@, z:%@", comment: "Point description, used for accessibility."), String(x), String(y), String(z))
    }
}
