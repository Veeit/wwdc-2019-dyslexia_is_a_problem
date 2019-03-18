//
//  LiveViewController+ARSCNViewDelegate.swift
//
//  Copyright © 2017,2018 Apple Inc. All rights reserved.
//

import ARKit

extension LiveViewController: ARSCNViewDelegate, ARSessionDelegate {
    
    // MARK: - ARSCNViewDelegate
    
    public func renderer(_ renderer: SCNSceneRenderer, updateAtTime time: TimeInterval) {
        DispatchQueue.main.async {
            if self.showingCameraVision {
                let hitTestViz = HitTestVisualization(sceneView: self.sceneView)
                hitTestViz.render()
            }
            
            self.updateFocusSquare()
            
            for object in self.virtualObjects {
                guard object.isModelLoaded else { continue }
                if let actor = object as? LiveActor {
                    actor.reactToRendering()
                }
            }
        }
    }
    
    public func renderer(_ renderer: SCNSceneRenderer, didAdd node: SCNNode, for anchor: ARAnchor) {
        guard let planeAnchor = anchor as? ARPlaneAnchor else { return }
        DispatchQueue.main.async {
            let surfaceDetectedMessage = NSLocalizedString("SURFACE DETECTED", comment: "SURFACE DETECTED")
            self.statusViewController.cancelScheduledMessage(for: .planeEstimation)
            self.statusViewController.showMessage(surfaceDetectedMessage)
            self.addPlane(node: node, anchor: planeAnchor)
            
            // Once we detect a surface, hide the focusSquare
            self.focusSquare.hide()
        }
    }
    
    public func renderer(_ renderer: SCNSceneRenderer, didUpdate node: SCNNode, for anchor: ARAnchor) {

    }
    
    public func renderer(_ renderer: SCNSceneRenderer, didRemove node: SCNNode, for anchor: ARAnchor) {
        guard let planeAnchor = anchor as? ARPlaneAnchor else { return }
        self.removePlane(anchor: planeAnchor)
    }
    
    public func session(_ session: ARSession, cameraDidChangeTrackingState camera: ARCamera) {
        statusViewController.showTrackingQualityInfo(for: camera.trackingState, autoHide: true)
        
        switch camera.trackingState {
        case .notAvailable, .limited:
            statusViewController.escalateFeedback(for: camera.trackingState, inSeconds: 3.0)
        case .normal:
            statusViewController.cancelScheduledMessage(for: .trackingStateEscalation)
        }
    }
    
    public func session(_ session: ARSession, didFailWithError error: Error) {
        guard error is ARError else { return }
        
        let errorWithInfo = error as NSError
        let messages = [
            errorWithInfo.localizedDescription,
            errorWithInfo.localizedFailureReason,
            errorWithInfo.localizedRecoverySuggestion
        ]
        
        // Use `flatMap(_:)` to remove optional error messages.
        let errorMessage = messages.compactMap({ $0 }).joined(separator: "\n")
        
        DispatchQueue.main.async {
            self.displayErrorMessage(title: NSLocalizedString("AR session encountered an error", comment: "Title of alert shown when the ARSession fails to start properly"), message: errorMessage)
        }
    }
}
