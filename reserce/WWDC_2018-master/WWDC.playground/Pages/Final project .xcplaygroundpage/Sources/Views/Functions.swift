import UIKit
import Vision

public typealias Prediction = (letter: String, prob: Double)

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
    func recognize(_ image: UIImage?, completion: (Result<Prediction>) -> ()) {
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
    func top(_ prob: [String: Double], _ k: Int = 2) -> [Prediction] {
        precondition(k <= prob.count)
        return Array(prob.map { x in (x.key, x.value) }
            .sorted(by: { a, b -> Bool in a.1 > b.1 })
            .prefix(through: k - 1))
    }
}


// Extensions

extension UIView {
    
    /* asImage Function
     - parameters:
     - prob: array of letter and the prediction confidence score
     - output as UIImage
     */
    public func addConstrainsWithFormat(format: String, views: UIView...) {
        var viewsDictionary = [String: UIView]()
        for (index, view) in views.enumerated() {
            let key = "v\(index)"
            viewsDictionary[key] = view
            view.translatesAutoresizingMaskIntoConstraints = false
        }
        
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: format, options: NSLayoutConstraint.FormatOptions(), metrics: nil, views: viewsDictionary))
    }
}

extension UIBezierPath {
    
    // Disaster, needs to be refactored
    public func scaleForRect(_ rect: CGRect, offset: CGFloat) {
        let size: CGFloat
        let greaterWidth = self.bounds.width > self.bounds.height
        if greaterWidth {
            size = self.bounds.width
        } else {
            size = self.bounds.height
        }
        let factor = (rect.width - 2 * offset) / size
        scaleAroundCenter(factor: factor, offset: offset)
        let newSize = bounds.size
        
        let diff: CGPoint
        if greaterWidth {
            let diffY = ((rect.width - 2 * offset) - newSize.height) / 2
            diff = CGPoint(x: 0, y: diffY)
        } else {
            let diffX = ((rect.width - 2 * offset) - newSize.width) / 2
            diff = CGPoint(x: diffX, y: 0)
        }
        let translateTransform = CGAffineTransform(translationX: diff.x, y: diff.y)
        self.apply(translateTransform)
    }
    
    public func scaleAroundCenter(factor: CGFloat, offset: CGFloat) {
        let scaleTransform = CGAffineTransform(scaleX: factor, y: factor)
        self.apply(scaleTransform)
        
        let diff = CGPoint(
            x: offset - bounds.origin.x,
            y: offset - bounds.origin.y)
        
        let translateTransform = CGAffineTransform(translationX: diff.x, y: diff.y)
        self.apply(translateTransform)
    }
}

extension CGRect {
    
    var center: CGPoint {
        return CGPoint(x: self.midX, y: self.midY)
    }
}

extension UIImage {
    
    /*
    public func resize(to newSize: CGSize) -> UIImage {
        UIGraphicsBeginImageContextWithOptions(CGSize(width: newSize.width, height: newSize.height), true, 1.0)
        self.draw(in: CGRect(x: 0, y: 0, width: newSize.width, height: newSize.height))
        let resizedImage = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        
        return resizedImage
    }*/
    
    public func pixelBuffer(size: CGSize) -> CVPixelBuffer? {
        var pixelBuffer: CVPixelBuffer? = nil
        
        let width = Int(size.width)
        let height = Int(size.height)
        
        CVPixelBufferCreate(kCFAllocatorDefault, width, height, kCVPixelFormatType_OneComponent8, nil, &pixelBuffer)
        CVPixelBufferLockBaseAddress(pixelBuffer!, CVPixelBufferLockFlags(rawValue:0))
        
        let colorspace = CGColorSpaceCreateDeviceGray()
        let bitmapContext = CGContext(data: CVPixelBufferGetBaseAddress(pixelBuffer!),
                                      width: width, height: height,
                                      bitsPerComponent: 8, bytesPerRow: CVPixelBufferGetBytesPerRow(pixelBuffer!),
                                      space: colorspace, bitmapInfo: 0)!
        bitmapContext.interpolationQuality = .none
        bitmapContext.draw(self.cgImage!, in: CGRect(x: 0, y: 0, width: width, height: height))
        
        return pixelBuffer
    }
}

// Global Variabels

public enum Result<T> {
    case success(T)
    case error(String)
}



