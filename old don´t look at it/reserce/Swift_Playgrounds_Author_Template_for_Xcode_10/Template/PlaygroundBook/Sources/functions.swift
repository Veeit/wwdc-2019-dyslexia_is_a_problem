//
//  functions.swift
//  Book_Sources
//
//  Created by Veit Progl on 16.03.19.
//

import Foundation
import UIKit
import Vision

// My helpfull extensions

extension UIView {
    
    /* asImage Function
     - parameters:
     - prob: array of letter and the prediction confidence score
     - output as UIImage
     */
//    public func addConstrainsWithFormat(format: String, views: UIView...) {
//        var viewsDictionary = [String: UIView]()
//        for (index, view) in views.enumerated() {
//            let key = "v\(index)"
//            viewsDictionary[key] = view
//            view.translatesAutoresizingMaskIntoConstraints = false
//        }
//        
//        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: format, options: NSLayoutConstraint.FormatOptions(), metrics: nil, views: viewsDictionary))
//    }
//    
    /* addBackground Function
     - parameters:
     - imageName: name of the image / default canvasBackground.png
     - contentMode: contentMode how the image shoud be scaled / default .scaleAspectFill
     */
    
    public func addBackground(imageName: String = "canvasBackground.png", contentMode: UIView.ContentMode = .scaleAspectFill) {
        // setup the UIImageView
        let backgroundImageView = UIImageView()
        backgroundImageView.image = UIImage(named: imageName)
        backgroundImageView.contentMode = contentMode

        // add this shit to view
        addSubview(backgroundImageView)
        sendSubviewToBack(backgroundImageView)
        
        // setup the shitty constrains :)
        backgroundImageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            backgroundImageView.topAnchor     .constraint(equalTo: topAnchor),
            backgroundImageView.bottomAnchor  .constraint(equalTo: bottomAnchor),
            backgroundImageView.leadingAnchor .constraint(equalTo: leadingAnchor), // left
            backgroundImageView.trailingAnchor.constraint(equalTo: trailingAnchor) // right
        ])
    }
    
    public func addBlur() {
        // setup the UIImageView
        let blurEffect = UIBlurEffect(style: UIBlurEffect.Style.light)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)

        blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
        // add this shit to view
        addSubview(blurEffectView)
        sendSubviewToBack(blurEffectView)
        
        // setup the shitty constrains :)
        blurEffectView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            blurEffectView.topAnchor     .constraint(equalTo: topAnchor),
            blurEffectView.bottomAnchor  .constraint(equalTo: bottomAnchor),
            blurEffectView.leadingAnchor .constraint(equalTo: leadingAnchor), // left
            blurEffectView.trailingAnchor.constraint(equalTo: trailingAnchor) // right
        ])
        
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

extension UIImage {
    
    /*
     public func resize(to newSize: CGSize) -> UIImage {
     UIGraphicsBeginImageContextWithOptions(CGSize(width: newSize.width, height: newSize.height), true, 1.0)
     self.draw(in: CGRect(x: 0, y: 0, width: newSize.width, height: newSize.height))
     let resizedImage = UIGraphicsGetImageFromCurrentImageContext()!
     UIGraphicsEndImageContext()
     
     return resizedImage
     }*/
    
//    public func pixelBuffer(size: CGSize) -> CVPixelBuffer? {
//        var pixelBuffer: CVPixelBuffer? = nil
//
//        let width = Int(size.width)
//        let height = Int(size.height)
//
//        CVPixelBufferCreate(kCFAllocatorDefault, width, height, kCVPixelFormatType_OneComponent8, nil, &pixelBuffer)
//        CVPixelBufferLockBaseAddress(pixelBuffer!, CVPixelBufferLockFlags(rawValue:0))
//
//        let colorspace = CGColorSpaceCreateDeviceGray()
//        let bitmapContext = CGContext(data: CVPixelBufferGetBaseAddress(pixelBuffer!),
//                                      width: width, height: height,
//                                      bitsPerComponent: 8, bytesPerRow: CVPixelBufferGetBytesPerRow(pixelBuffer!),
//                                      space: colorspace, bitmapInfo: 0)!
//        bitmapContext.interpolationQuality = .none
//        bitmapContext.draw(self.cgImage!, in: CGRect(x: 0, y: 0, width: width, height: height))
//
//        return pixelBuffer
//    }
}

// Global Variabels
//
//public enum Result<T> {
//    case success(T)
//    case error(String)
//}
