/* About This File:
 E: this file is part of the WWDC 2019 project created by Veit Progl
 D: Diese Datei ist teil von den WWDC 2019 Project erstellt von Veit Progl
 */

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

public let viewCanvas = canvasView()

@available(iOS 11.0, *)

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
        let viewResultLetter = resultLetterView
        let buttonRecognize = recognizeButton
        
        view.addSubview(viewAR)
        view.addSubview(viewResultLetter)
        view.addSubview(viewCanvas)
        view.addSubview(buttonRecognize)
        
        viewAR.translatesAutoresizingMaskIntoConstraints = false
        viewCanvas.translatesAutoresizingMaskIntoConstraints = false
        viewResultLetter.translatesAutoresizingMaskIntoConstraints = false
        buttonRecognize.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            viewAR.topAnchor   .constraint(equalTo: view.topAnchor, constant: 0),
            viewAR.leftAnchor  .constraint(equalTo: view.leftAnchor, constant: 0),
            viewAR.widthAnchor .constraint(equalToConstant: UIScreen.main.bounds.width),
            viewAR.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height),
            
            viewCanvas.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -150),
            //            viewCanvas.trailingAnchor.constraint(equalTo: view.leftAnchor, constant: 50),
            viewCanvas.leftAnchor  .constraint(equalTo: view.leftAnchor, constant: 50),
            viewCanvas.widthAnchor .constraint(equalToConstant: 300),
            viewCanvas.heightAnchor.constraint(equalToConstant: 300),
            
            viewResultLetter.topAnchor   .constraint(equalTo: view.topAnchor, constant: 50),
            viewResultLetter.leftAnchor  .constraint(equalTo: view.leftAnchor, constant: 100),
            viewResultLetter.widthAnchor .constraint(equalToConstant: 150),
            viewResultLetter.heightAnchor.constraint(equalToConstant: 50),
            
            buttonRecognize.bottomAnchor  .constraint(equalTo: view.bottomAnchor, constant: -450),
            buttonRecognize.leftAnchor    .constraint(equalTo: view.leftAnchor, constant: 50),
            buttonRecognize.widthAnchor   .constraint(equalToConstant: 150),
            buttonRecognize.heightAnchor  .constraint(equalToConstant: 50)
            ])
        
        viewAR.session.run(configuration, options: [])
        viewAR.debugOptions = [ARSCNDebugOptions.showFeaturePoints, ARSCNDebugOptions.showWorldOrigin]
        
        viewCanvas.layer.cornerRadius = 10.0
        viewCanvas.layer.borderColor = UIColor.black.cgColor
        viewCanvas.layer.borderWidth = 5
        viewCanvas.backgroundColor = UIColor(red: 249 / 255, green: 249 / 255, blue: 249 / 255, alpha: 0.7)
        
        self.view = view
    }
    
    //Setup the needed UI
    public let recognizeButton: UIButton = {
        let button  = UIButton()
        button.backgroundColor = .white
        button.setTitleColor(.blue ,for: .normal)
        button.setTitle("recognize Letter", for: .normal)
        button.addTarget(self, action: #selector(recognizeButtonPresst), for: .touchUpInside)
        return button
    }()
    
    let resultLetterView: UILabel = {
        let label = UILabel()
        label.text = "Letter:"
        return label
    }()
    
    // this is needed for runing the ML
    
    // Setup the recognize function
    
    func recognize(_ image: UIImage) {
        recognizer.recognize(image) {
            [weak self] result in
            switch (result) { // check if the succesed
            case .success(let prediction):
                self?.resultLetterView.text = "Letter: \(prediction.letter)" //show the result
                predictionLetter = prediction.letter
            case .error(let message):
                self?.resultLetterView.text = message // show the error message
            }
        }
    }
    
    // Button Function
    @objc func recognizeButtonPresst(sender: UIButton!) {
        let image = viewCanvas.getImage() // store the image in a constant
        var recognizedLetter = checkLetter(image) // call the recognize function
        testLetter(word: "test", letter: recognizedLetter)
        viewCanvas.clear() // Clear the Canvas
    }
    
    func checkLetter(_ image: UIImage) -> String {
        var returnValue = "error"
        recognizer.recognize(image) {
            [weak self] result in
            switch (result) { // check if the succesed
            case .success(let prediction):
                self?.resultLetterView.text = "Letter: \(prediction.letter)" //show the result
                predictionLetter = prediction.letter
                print(prediction.letter)
                returnValue = predictionLetter
            case .error(let message):
                self?.resultLetterView.text = message // show the error message
                returnValue = "error"
            }
        }
        return returnValue
    }
    
    func testLetter(word: String, letter: String) {
        let wordArray = createArray(hangmanWord: word)
        for i in word {
            print(i)
            var stringI = String(i)
            if stringI.uppercased() == letter {
                print("crazy")
                if wordArray[stringI] == false {
                    wordArray[stringI] = true
                } else {
                    print("fround it allrady")
                }
            }
        }
    }
    
}

if #available(iOSApplicationExtension 11.0, *) {
    PlaygroundPage.current.liveView = arViewController()
} else {
    // Fallback on earlier versions
}
