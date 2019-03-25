//
//  ArView.swift
//  Book_Sources
//
//  Created by Veit Progl on 17.03.19.
//

import Foundation

import PlaygroundSupport
import UIKit
import ARKit
import SceneKit

//public

//@available(iOS 11.0, *)
//public typealias Prediction = (letter: String, prob: Double)
//public class LetterRecognizer {
//    // Variabelen
//    public static let inputSize = CGSize(width: 30, height: 30)
//    //public let minDistance = 0.1
//    public let letterMLmodel = LetterClass_image()
//
//    // Function
//
//    /* recognize Function
//     Checks if every this in correct
//     - parameters:
//     - image: the imput image
//     - completion: the output
//     */
//    public func recognize(_ image: UIImage?, completion: (Result<Prediction>) -> ()) {
//        guard let buffer = image?.pixelBuffer(size: LetterRecognizer.inputSize) else {
//            completion(.error("Unable to create buffer!"))
//            return
//        }
//
//        guard let prediction = try? letterMLmodel.prediction(image: buffer) else {
//            completion(.error("Unable to make prediction!"))
//            return
//        }
//        print(prediction.letter)
//        completion(.success(top(prediction.letter)[0]))
//    }
//
//    /* top Function
//     find the top result
//     - parameters:
//     - prob: array of letter and the prediction confidence score
//     - Prediction: the output
//     */
//    public func top(_ prob: [String: Double], _ k: Int = 2) -> [Prediction] {
//        precondition(k <= prob.count)
//        return Array(prob.map { x in (x.key, x.value) }
//            .sorted(by: { a, b -> Bool in a.1 > b.1 })
//            .prefix(through: k - 1))
//    }
//}

public class arViewController: UIViewController, ARSCNViewDelegate, ARSessionDelegate {
    var sceneView: ARSCNView!
    var predictionLetter = ""
    
    func arView() -> ARSCNView {
        let view = ARSCNView()
        return view
    }
    
    let configuration = ARWorldTrackingConfiguration()
    
    override public func viewDidLoad() {
        super.viewDidLoad()
        let view = UIView()
        let viewAR = arView()
        let viewCanvas = canvasView()
        let viewResultLetter = resultLetterView
//        let buttonRecognize = recognizeButton
        
        view.addSubview(viewAR)
        view.addSubview(viewResultLetter)
        view.addSubview(viewCanvas)
//        view.addSubview(buttonRecognize)

        viewAR.translatesAutoresizingMaskIntoConstraints = false
        viewCanvas.translatesAutoresizingMaskIntoConstraints = false
        viewResultLetter.translatesAutoresizingMaskIntoConstraints = false
//        buttonRecognize.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            viewAR.topAnchor   .constraint(equalTo: view.topAnchor, constant: 0),
            viewAR.leftAnchor  .constraint(equalTo: view.leftAnchor, constant: 0),
            viewAR.widthAnchor .constraint(equalToConstant: UIScreen.main.bounds.width),
            viewAR.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height),
            
            viewCanvas.bottomAnchor  .constraint(equalTo: view.bottomAnchor, constant: -150),
//            viewCanvas.trailingAnchor.constraint(equalTo: view.leftAnchor, constant: 50),
            viewCanvas.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 50),
            viewCanvas.widthAnchor .constraint(equalToConstant: 300),
            viewCanvas.heightAnchor.constraint(equalToConstant: 300),
            
            viewResultLetter.topAnchor   .constraint(equalTo: view.topAnchor, constant: 50),
            viewResultLetter.leftAnchor  .constraint(equalTo: view.leftAnchor, constant: 100),
            viewResultLetter.widthAnchor .constraint(equalToConstant: 50),
            viewResultLetter.heightAnchor.constraint(equalToConstant: 50)
            
//            buttonRecognize.bottomAnchor  .constraint(equalTo: view.bottomAnchor, constant: -450),
//            buttonRecognize.trailingAnchor.constraint(equalTo: view.leftAnchor, constant: 50),
//            buttonRecognize.widthAnchor   .constraint(equalToConstant: 50),
//            buttonRecognize.heightAnchor  .constraint(equalToConstant: 50)
        ])
        
        viewAR.session.run(configuration, options: [])
        viewAR.debugOptions = [ARSCNDebugOptions.showFeaturePoints, ARSCNDebugOptions.showWorldOrigin]
        
        viewCanvas.layer.cornerRadius = 10.0
        viewCanvas.layer.borderColor = UIColor.black.cgColor
        viewCanvas.layer.borderWidth = 5
        viewCanvas.backgroundColor = UIColor(red: 249 / 255, green: 249 / 255, blue: 249 / 255, alpha: 0.7)
        
        self.view = view
    }
    let resultLetterView: UILabel = {
        let label = UILabel()
        label.text = "Letter:"
        return label
    }()
    
    // this is needed for runing the ML
    
    //Setup the needed UI
//    let recognizeButton: UIButton = {
//        let button  = UIButton()
//        button.backgroundColor = .white
//        button.setTitleColor(.blue ,for: .normal)
//        button.setTitle("recognize Letter", for: .normal)
////        button.addTarget(self, action: #selector(recognizeButtonPresst), for: .touchUpInside)
//        return button
//    }()
    
//    // Setup the recognize function
//    let recognizer: LetterRecognizer = LetterRecognizer()
//
//    func recognize(_ image: UIImage) {
//        recognizer.recognize(image) {
//            [weak self] result in
//            switch (result) { // check if the succesed
//            case .success(let prediction):
//                self?.resultLetterView.text = "Letter: \(prediction.letter)" //show the result
//                predictionLetter = prediction.letter
//            case .error(let message):
//                self?.resultLetterView.text = message // show the error message
//            }
//        }
//    }
//    // Button Function
//    @objc func recognizeButtonPresst(sender: UIButton!) {
//        let image = viewCanvas.getImage() // store the image in a constant
//        recognize(image) // call the recognize function
//        viewCanvas.clear() // Clear the Canvas
//    }
}

if #available(iOSApplicationExtension 11.0, *) {
    PlaygroundPage.current.liveView = arViewController()
} else {
    // Fallback on earlier versions
}
