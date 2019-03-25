////
////  ArView.swift
////  Book_Sources
////
////  Created by Veit Progl on 17.03.19.
////
//
//import Foundation
//
//import PlaygroundSupport
//import UIKit
//import ARKit
//import SceneKit
//
//public var fontName = "SedgwickAveDisplay-Regular"
//public var textColor = UIColor(red: CGFloat(0.0/255.0), green: CGFloat(0.0/255.0), blue: CGFloat(100.0/255.0), alpha: CGFloat(0.5))
//public var textHeight: Float = 0.02
//public var textWidth: Float = 0.02
//public var textLength: Float = 0.02
//
//@available(iOS 11.0, *)
//public class arViewController: UIViewController, ARSCNViewDelegate, ARSessionDelegate {
//    var sceneView: ARSCNView!
//    override public func viewDidLoad() {
//        
//        sceneView = ARSCNView(frame:CGRect(x: 0.0, y: 0.0, width: 500.0, height: 600.0))
//        // Set the view's delegate
//        sceneView.delegate = self
//        
//        sceneView.session.delegate = self
//        
//        sceneView.autoenablesDefaultLighting = true
//        addTapGestureToSceneView()
//        
//        self.view = sceneView
//    }
//    
//    override public func viewWillAppear(_ animated: Bool) {
//        super.viewWillAppear(animated)
//        
//        // plane detection and session Config
//        let config = ARWorldTrackingConfiguration()
//        config.planeDetection = .horizontal
//        config.isLightEstimationEnabled = true
//        
//        sceneView.session.run(config)
//        sceneView.debugOptions = [ARSCNDebugOptions.showFeaturePoints]
//    }
//    
//    public func renderer(_ renderer: SCNSceneRenderer, didAdd node: SCNNode, for anchor: ARAnchor) {
//        
//        guard let planeAnchor = anchor as? ARPlaneAnchor else { return }
//        
//        let width = CGFloat(planeAnchor.extent.x)
//        let height = CGFloat(planeAnchor.extent.z)
//        let plane = SCNPlane(width: width, height: height)
//        
//        plane.materials.first?.diffuse.contents = UIColor(red: CGFloat(0.0/255.0), green: CGFloat(0.0/255.0), blue: CGFloat(100.0/255.0), alpha: CGFloat(0.5))
//        
//        let planeNode = SCNNode(geometry: plane)
//        
//        let x = CGFloat(planeAnchor.center.x)
//        let y = CGFloat(planeAnchor.center.y)
//        let z = CGFloat(planeAnchor.center.z)
//        planeNode.position = SCNVector3(x,y,z)
//        planeNode.eulerAngles.x = -.pi / 2
//        planeNode.name = "plane"
//        node.addChildNode(planeNode)
//    }
//    
//    public func addTapGestureToSceneView() {
//        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(arViewController.addTextToSceneView(withGestureRecognizer:)))
//        sceneView.addGestureRecognizer(tapGestureRecognizer)
//    }
//    
//    @objc func addTextToSceneView(withGestureRecognizer recognizer: UIGestureRecognizer) {
//        let tapLocation = recognizer.location(in: sceneView)
//        let hitTestResults = sceneView.hitTest(tapLocation, types: .existingPlaneUsingExtent)
//        
//        guard let hitTestResult = hitTestResults.first else { return }
//        let translation = SCNMatrix4(hitTestResult.worldTransform)
//        let vector = SCNVector3Make(translation.m41-0.08, translation.m42-0.2, translation.m43)
//        let rotate = simd_float4x4(SCNMatrix4MakeRotation(sceneView.session.currentFrame!.camera.eulerAngles.y, 0, 1, 0))
//        let rotateTransform = simd_mul(hitTestResult.worldTransform, rotate)
//        
//        //Fonts
//        let cfUrlSedgwickAveDisplay = Bundle.main.url(forResource: fontName, withExtension: "ttf")! as CFURL
//        CTFontManagerRegisterFontsForURL(cfUrlSedgwickAveDisplay, CTFontManagerScope.process, nil)
//        let fontSedgwickAveDisplay = UIFont(name: fontName, size:  14.0)
//        
//        // Create the 3D text
//        let text = SCNText(string: "test", extrusionDepth: 2)
//        text.font = fontSedgwickAveDisplay
//        
//        let material = SCNMaterial()
//        material.diffuse.contents  = textColor
//        text.materials = [material]
//        
//        // Set the cordinats
//        let node = SCNNode()
//        node.transform = SCNMatrix4(rotateTransform)
//        node.scale = SCNVector3(x: textLength, y: textHeight, z: textWidth)
//        node.geometry = text
//        node.position = vector
//        
//        sceneView.scene.rootNode.enumerateChildNodes { (node, _) in
//            if node.name == "plane" {
//                node.removeFromParentNode()
//            }
//        }
//        
//        sceneView.scene.rootNode.addChildNode(node)
//    }
//    
//    public func renderer(_ renderer: SCNSceneRenderer, didUpdate node: SCNNode, for anchor: ARAnchor) {
//        guard let planeAnchor = anchor as?  ARPlaneAnchor,
//            let planeNode = node.childNodes.first,
//            let plane = planeNode.geometry as? SCNPlane
//            else { return }
//        
//        let width = CGFloat(planeAnchor.extent.x)
//        let height = CGFloat(planeAnchor.extent.z)
//        plane.width = width
//        plane.height = height
//        
//        let x = CGFloat(planeAnchor.center.x)
//        let y = CGFloat(planeAnchor.center.y)
//        let z = CGFloat(planeAnchor.center.z)
//        planeNode.position = SCNVector3(x, y-0.05, z)
//    }
//    
//}
