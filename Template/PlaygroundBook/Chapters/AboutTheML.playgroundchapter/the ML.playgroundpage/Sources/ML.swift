/* About This File:
 E: this file is part of the WWDC 2019 project created by Veit Progl
 D: Diese Datei ist teil von den WWDC 2019 Project erstellt von Veit Progl
 
 This file contrains the Letter Recognizer Class, the class is used to conect the canvasView
 with the LetterClass_image.mlmodel.
 
 */
import Foundation
import PlaygroundSupport
import UIKit
import ARKit
import SceneKit

public typealias Prediction = (letter: String, prob: Double)
@available(iOSApplicationExtension 11.0, *)
public class LetterRecognizer {
    // Variabelen
    public static let inputSize = CGSize(width: 30, height: 30)
    //public let minDistance = 0.1
    public let letterMLmodel = LetterClass_image()
    
    // Function
    
    /* recognize Function
     Checks if every this in correct
     - parameters:
     - image: the imput image
     - completion: the output
     */
    public func recognize(_ image: UIImage?, completion: (Result<Prediction>) -> ()) {
        guard let buffer = image?.pixelBuffer(size: LetterRecognizer.inputSize) else {
            completion(.error("Unable to create buffer!"))
            return
        }
        
        guard let prediction = try? letterMLmodel.prediction(image: buffer) else {
            completion(.error("Unable to make prediction!"))
            return
        }
        print(prediction.letter)
        completion(.success(top(prediction.letter)[0]))
    }
    
    /* top Function
     find the top result
     - parameters:
     - prob: array of letter and the prediction confidence score
     - Prediction: the output
     */
    public func top(_ prob: [String: Double], _ k: Int = 2) -> [Prediction] {
        precondition(k <= prob.count)
        return Array(prob.map { x in (x.key, x.value) }
            .sorted(by: { a, b -> Bool in a.1 > b.1 })
            .prefix(through: k - 1))
    }
}

@available(iOSApplicationExtension 11.0, *)
public let recognizer: LetterRecognizer = LetterRecognizer()
