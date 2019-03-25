//
//  LivePlane.swift
//
//  Copyright © 2017,2018 Apple Inc. All rights reserved.
//

import Foundation
import ARKit
import PlaygroundSupport

public class LivePlane: SCNNode {
    
    // Visible to the user
    public let id: String
    public var size = CGRect()
    
    internal var anchor: ARPlaneAnchor
    internal var occlusionNode: SCNNode?
    internal let occlusionPlaneVerticalOffset: Float = -0.01  // The occlusion plane should be placed 1 cm below the actual
    // plane to avoid z-fighting etc.
    
    internal var debugVisualization: PlaneDebugVisualization?
    internal var focusSquare: FocusSquare?
    
    init(_ anchor: ARPlaneAnchor, _ showDebugVisualization: Bool) {
        self.anchor = anchor
        self.id = UUID().uuidString
        super.init()
        
        self.showDebugVisualization(showDebugVisualization)
        
        createOcclusionNode()
    }
    
    // MARK: - Initialization
    
    init(_ anchor: ARPlaneAnchor) {
        self.anchor = anchor
        self.id = UUID().uuidString
        super.init()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - PlaygroundValue Inits
    public init(playgroundValue: PlaygroundValue) {
        // TODO: Fill this in with the new messaging stuff (make it codable or w/e)
        fatalError("PlaygroundValue init has not been implemented")
    }
    
    public var playgroundValue: PlaygroundValue {
        // TODO: Fill me in with the new messaging stuff
        return .dictionary([:])
    }
    
    internal func update(_ anchor: ARPlaneAnchor) {
        self.anchor = anchor
        debugVisualization?.update(anchor)
        updateOcclusionNode()
    }
    
    internal func positionForRelativePosition(_ relativePosition: SCNVector3) -> SCNVector3 {
        
        return SCNVector3Make(anchor.center.x + relativePosition.x,
                                      0.0 + relativePosition.y,
                                      anchor.center.z + relativePosition.z)
    }
    
    internal func showDebugVisualization(_ show: Bool) {
        if show {
            if debugVisualization == nil {
                DispatchQueue.global().async {
                    self.debugVisualization = PlaneDebugVisualization(anchor: self.anchor)
                    DispatchQueue.main.async {
                        self.addChildNode(self.debugVisualization!)
                    }
                }
            }
        } else {
            debugVisualization?.removeFromParentNode()
            debugVisualization = nil
        }
    }
    
    internal func updateOcclusionSetting() {
        if occlusionNode == nil {
            createOcclusionNode()
        }
    }
    
    // MARK: Private
    
    private func createOcclusionNode() {
        // Make the occlusion geometry slightly smaller than the plane.
        let occlusionPlane = SCNPlane(width: CGFloat(anchor.extent.x - 0.05), height: CGFloat(anchor.extent.z - 0.05))
        let material = SCNMaterial()
        material.colorBufferWriteMask = []
        material.isDoubleSided = true
        occlusionPlane.materials = [material]
        
        occlusionNode = SCNNode()
        occlusionNode!.geometry = occlusionPlane
        occlusionNode!.transform = SCNMatrix4MakeRotation(-Float.pi / 2.0, 1, 0, 0)
        occlusionNode!.position = SCNVector3Make(anchor.center.x, occlusionPlaneVerticalOffset, anchor.center.z)
        
        self.addChildNode(occlusionNode!)
    }
    
    private func updateOcclusionNode() {
        guard let occlusionNode = occlusionNode, let occlusionPlane = occlusionNode.geometry as? SCNPlane else {
            return
        }
        occlusionPlane.width = CGFloat(anchor.extent.x - 0.05)
        occlusionPlane.height = CGFloat(anchor.extent.z - 0.05)
        
        occlusionNode.position = SCNVector3Make(anchor.center.x, occlusionPlaneVerticalOffset, anchor.center.z)
    }
}

