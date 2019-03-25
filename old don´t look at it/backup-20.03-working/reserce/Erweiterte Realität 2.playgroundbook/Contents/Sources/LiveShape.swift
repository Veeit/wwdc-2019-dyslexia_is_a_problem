//
//  LiveShape.swift
//
//  Copyright © 2017,2018 Apple Inc. All rights reserved.
//

import Foundation
import SceneKit

public enum ShapeType: String, Codable {
    case cube
    case pyramid
    case sphere
}

public class LiveShape: VirtualObject {
    
    static let defaultColor = UIColor.lightGray
    
    override var type: VirtualObjectType { return .shape }
    
    override var placeableObject: PlaceableObject {
        let object = super.placeableObject
        object.name = shapeType.rawValue
        return object
    }
    
    override var customAccessibilityDescription: String {
        switch shapeType {
        case .cube:
            return NSLocalizedString("Cube", comment: "Localizable and accessible cube description")
        case .pyramid:
            return NSLocalizedString("Pyramid", comment: "Localizable and accessible pyramid description")
        case .sphere:
            return NSLocalizedString("Sphere", comment: "Localizable and accessible sphere description")
        }
    }
    
    public var shapeType: ShapeType
    
    public var color: UIColor = LiveShape.defaultColor {
        didSet { updateMaterials() }
    }
    
    public var image: UIImage? {
        didSet { updateMaterials() }
    }

    init(type: ShapeType, id: String? = nil) {
        self.shapeType = type
        super.init(title: "Shape", id: id)
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadModel() {
        var node = SCNNode()
        switch shapeType {
        case .cube:
            node = LiveShape.cube()
            node.pivot = SCNMatrix4MakeTranslation(0, -0.05, 0)
        case .pyramid:
            node = LiveShape.pyramid()
        case .sphere:
            node = LiveShape.sphere()
            node.pivot = SCNMatrix4MakeTranslation(0, -0.05, 0)
        }
        addChildNode(node)
        isModelLoaded = true
        updateMaterials()
    }
    
    private func updateMaterials() {
        
        guard
            let node = childNodes.first,
            let geometry = node.geometry
            else { return }
        
        // Set the color of each face.
        for material in geometry.materials {
            material.diffuse.contents = color
        }
        
        guard let image = image else { return }
        
        // Set the image.
        switch shapeType {
        case .cube, .pyramid:
            // Apply the image to all faces.
            for material in geometry.materials {
                material.diffuse.contents = image
            }
        case .sphere:
            // Wrap the image around the sphere.
            geometry.firstMaterial?.diffuse.contents = image
        }
    }
    
    private static func cube() -> SCNNode {
        
        let geometry = SCNBox(width: 0.1, height: 0.1, length: 0.1, chamferRadius: 0.01)
        
        var materials = [SCNMaterial]()
        
        // Faces: facing, right, back, left, top, bottom.
        for _ in 0..<6 {
            let material = SCNMaterial()
            material.diffuse.contents = defaultColor
            material.locksAmbientWithDiffuse = true
            materials.append(material)
        }
        
        geometry.materials = materials
        
        return SCNNode(geometry: geometry)
    }
    
    private static func pyramid() -> SCNNode {
        
        let geometry = SCNPyramid(width: 0.1, height: 0.1, length: 0.1)
        
        var materials = [SCNMaterial]()
        for _ in 0..<5 {
            let material = SCNMaterial()
            material.diffuse.contents = defaultColor
            material.locksAmbientWithDiffuse = true
            materials.append(material)
        }
        
        geometry.materials = materials
        
        return SCNNode(geometry: geometry)
    }
    
    private static func sphere() -> SCNNode {
        
        let geometry = SCNSphere(radius: 0.05)
        
        geometry.isGeodesic = true
        geometry.segmentCount = 96
        geometry.firstMaterial?.diffuse.contents = defaultColor
        geometry.firstMaterial?.locksAmbientWithDiffuse = true
        return SCNNode(geometry: geometry)
    }
    
}

