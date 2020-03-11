//
// LetterClass_image.swift
//
// This file was automatically generated and should not be edited.
//

/*
 This is part of the CoreML data model for recognize the letter
 */

import CoreML


/// Model Prediction Input Type
@available(macOS 10.13, iOS 11.0, tvOS 11.0, watchOS 4.0, *)
public class LetterClass_imageInput : MLFeatureProvider {
    
    /// Grayscale image 30x30 of hand written letter as grayscale (kCVPixelFormatType_OneComponent8) image buffer, 30 pixels wide by 30 pixels high
    public var image: CVPixelBuffer
    
    public var featureNames: Set<String>{
        get {
            return ["image"]
        }
    }
    
    public func featureValue(for featureName: String) -> MLFeatureValue? {
        if (featureName == "image") {
            return MLFeatureValue(pixelBuffer: image)
        }
        return nil
    }
    
    public init(image: CVPixelBuffer) {
        self.image = image
    }
}


/// Model Prediction Output Type
@available(macOS 10.13, iOS 11.0, tvOS 11.0, watchOS 4.0, *)
public class LetterClass_imageOutput : MLFeatureProvider {
    
    /// Predicted letter as dictionary of strings to doubles
    public let letter: [String : Double]
    
    /// classLabel as string value
    public let classLabel: String
    
    public var featureNames: Set<String> {
        get {
            return ["letter", "classLabel"]
        }
    }
    
    public func featureValue(for featureName: String) -> MLFeatureValue? {
        if (featureName == "letter") {
            return try! MLFeatureValue(dictionary: letter as [NSObject : NSNumber])
        }
        if (featureName == "classLabel") {
            return MLFeatureValue(string: classLabel)
        }
        return nil
    }
    
    public init(letter: [String : Double], classLabel: String) {
        self.letter = letter
        self.classLabel = classLabel
    }
}


/// Class for model loading and prediction
@available(macOS 10.13, iOS 11.0, tvOS 11.0, watchOS 4.0, *)
public class LetterClass_image {
    public var model: MLModel
    
    /**
     Construct a model with explicit path to mlmodel file
     - parameters:
     - url: the file url of the model
     - throws: an NSError object that describes the problem
     */
    public init(contentsOf url: URL) throws {
        self.model = try MLModel(contentsOf: url)
    }
    
    /// Construct a model that automatically loads the model from the app's bundle
    public convenience init() {
        let bundle = Bundle(for: LetterClass_image.self)
        let assetPath = bundle.url(forResource: "LetterClass_image", withExtension:"mlmodelc")
        try! self.init(contentsOf: assetPath!)
    }
    
    /**
     Make a prediction using the structured interface
     - parameters:
     - input: the input to the prediction as LetterClass_imageInput
     - throws: an NSError object that describes the problem
     - returns: the result of the prediction as LetterClass_imageOutput
     */
    public func prediction(input: LetterClass_imageInput) throws -> LetterClass_imageOutput {
        let outFeatures = try model.prediction(from: input)
        let result = LetterClass_imageOutput(letter: outFeatures.featureValue(for: "letter")!.dictionaryValue as! [String : Double], classLabel: outFeatures.featureValue(for: "classLabel")!.stringValue)
        return result
    }
    
    /**
     Make a prediction using the convenience interface
     - parameters:
     - image: Grayscale image 30x30 of hand written letter as grayscale (kCVPixelFormatType_OneComponent8) image buffer, 30 pixels wide by 30 pixels high
     - throws: an NSError object that describes the problem
     - returns: the result of the prediction as LetterClass_imageOutput
     */
    public func prediction(image: CVPixelBuffer) throws -> LetterClass_imageOutput {
        let input_ = LetterClass_imageInput(image: image)
        return try self.prediction(input: input_)
    }
}
