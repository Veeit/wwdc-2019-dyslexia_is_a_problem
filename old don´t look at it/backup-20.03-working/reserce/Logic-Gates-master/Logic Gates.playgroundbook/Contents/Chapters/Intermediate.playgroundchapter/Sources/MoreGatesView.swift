import PlaygroundSupport
import UIKit
import Foundation
import CoreGraphics

public class MoreGatesView: UIView{
    public var varState = [Int]()
    public override func draw(_ rect: CGRect){
        drawMoreGates(frame: rect)
    }
    public func redraw() {
        setNeedsDisplay()
    }
    //The drawing codes are created with the aid of PaintCode
    func drawMoreGates(frame: CGRect = CGRect(x: 0, y: 0, width: 540, height: 500)) {
        
        //// General Declarations
        let context = UIGraphicsGetCurrentContext()!
        
        //// Color Declarations
        let strokeColor = UIColor(red: 0.000, green: 0.000, blue: 0.000, alpha: 1.000)
        let textForeground = UIColor(red: 0.000, green: 0.000, blue: 0.000, alpha: 1.000)
        let fillColor4 = UIColor(red: 0.000, green: 0.000, blue: 0.000, alpha: 1.000)
        let color9 = UIColor(red: 0.400, green: 0.936, blue: 1.000, alpha: 1.000)
        let color10 = UIColor(red: 0.336, green: 0.691, blue: 0.973, alpha: 1.000)
        let color11 = UIColor(red: 0.625, green: 0.364, blue: 0.963, alpha: 1.000)
        let color12 = UIColor(red: 1.000, green: 0.415, blue: 0.883, alpha: 1.000)
        
        //// Group 2
        //// Oval Drawing
        let ovalPath = UIBezierPath(ovalIn: CGRect(x: frame.minX + 152, y: frame.minY + 237, width: 14, height: 13))
        color10.setFill()
        ovalPath.fill()
        strokeColor.setStroke()
        ovalPath.lineWidth = 4
        ovalPath.stroke()
        
        
        
        
        //// Oval 2 Drawing
        let oval2Path = UIBezierPath(ovalIn: CGRect(x: frame.minX + 149, y: frame.minY + 87, width: 13, height: 14))
        color9.setFill()
        oval2Path.fill()
        strokeColor.setStroke()
        oval2Path.lineWidth = 4
        oval2Path.stroke()
        
        
        //// Oval 3 Drawing
        let oval3Path = UIBezierPath(ovalIn: CGRect(x: frame.minX + 429.5, y: frame.minY + 210.5, width: 13, height: 12))
        color12.setFill()
        oval3Path.fill()
        strokeColor.setStroke()
        oval3Path.lineWidth = 3
        oval3Path.stroke()
        
        
        //// Rectangle Drawing
        let rectanglePath = UIBezierPath(rect: CGRect(x: frame.minX + 186, y: frame.minY + 92, width: 4, height: 61))
        UIColor.black.setFill()
        rectanglePath.fill()
        
        
        //// Rectangle 2 Drawing
        let rectangle2Path = UIBezierPath(rect: CGRect(x: frame.minX + 162, y: frame.minY + 92, width: 27, height: 4))
        UIColor.black.setFill()
        rectangle2Path.fill()
        
        
        //// Rectangle 3 Drawing
        let rectangle3Path = UIBezierPath(rect: CGRect(x: frame.minX + 38, y: frame.minY + 78, width: 41, height: 4))
        UIColor.black.setFill()
        rectangle3Path.fill()
        
        
        //// Rectangle 4 Drawing
        let rectangle4Path = UIBezierPath(rect: CGRect(x: frame.minX + 38, y: frame.minY + 107, width: 41, height: 4))
        UIColor.black.setFill()
        rectangle4Path.fill()
        
        
        //// Rectangle 5 Drawing
        let rectangle5Path = UIBezierPath(rect: CGRect(x: frame.minX + 164, y: frame.minY + 241, width: 26, height: 4))
        UIColor.black.setFill()
        rectangle5Path.fill()
        
        
        //// Rectangle 6 Drawing
        let rectangle6Path = UIBezierPath(rect: CGRect(x: frame.minX + 39, y: frame.minY + 226, width: 41, height: 4))
        UIColor.black.setFill()
        rectangle6Path.fill()
        
        
        //// Rectangle 7 Drawing
        let rectangle7Path = UIBezierPath(rect: CGRect(x: frame.minX + 39, y: frame.minY + 256, width: 41, height: 4))
        UIColor.black.setFill()
        rectangle7Path.fill()
        
        
        //// Rectangle 8 Drawing
        let rectangle8Path = UIBezierPath(rect: CGRect(x: frame.minX + 317, y: frame.minY + 166, width: 4, height: 37))
        UIColor.black.setFill()
        rectangle8Path.fill()
        
        
        //// Group
        //// Bezier 2 Drawing
        let bezier2Path = UIBezierPath()
        bezier2Path.move(to: CGPoint(x: frame.minX + 216.39, y: frame.minY + 195.2))
        bezier2Path.addCurve(to: CGPoint(x: frame.minX + 212.94, y: frame.minY + 200), controlPoint1: CGPoint(x: frame.minX + 213.94, y: frame.minY + 199.43), controlPoint2: CGPoint(x: frame.minX + 212.94, y: frame.minY + 200))
        bezier2Path.addLine(to: CGPoint(x: frame.minX + 207.34, y: frame.minY + 200))
        bezier2Path.addLine(to: CGPoint(x: frame.minX + 210.41, y: frame.minY + 196.1))
        bezier2Path.addCurve(to: CGPoint(x: frame.minX + 219.07, y: frame.minY + 168), controlPoint1: CGPoint(x: frame.minX + 210.41, y: frame.minY + 196.1), controlPoint2: CGPoint(x: frame.minX + 219.07, y: frame.minY + 184.9))
        bezier2Path.addCurve(to: CGPoint(x: frame.minX + 210.41, y: frame.minY + 139.9), controlPoint1: CGPoint(x: frame.minX + 219.07, y: frame.minY + 151.1), controlPoint2: CGPoint(x: frame.minX + 210.41, y: frame.minY + 139.9))
        bezier2Path.addLine(to: CGPoint(x: frame.minX + 207.34, y: frame.minY + 136))
        bezier2Path.addLine(to: CGPoint(x: frame.minX + 212.94, y: frame.minY + 136))
        bezier2Path.addCurve(to: CGPoint(x: frame.minX + 216.34, y: frame.minY + 140.8), controlPoint1: CGPoint(x: frame.minX + 214.14, y: frame.minY + 137.5), controlPoint2: CGPoint(x: frame.minX + 215.12, y: frame.minY + 138.65))
        bezier2Path.addCurve(to: CGPoint(x: frame.minX + 223.67, y: frame.minY + 168), controlPoint1: CGPoint(x: frame.minX + 219.21, y: frame.minY + 145.76), controlPoint2: CGPoint(x: frame.minX + 223.67, y: frame.minY + 155.24))
        bezier2Path.addCurve(to: CGPoint(x: frame.minX + 216.39, y: frame.minY + 195.2), controlPoint1: CGPoint(x: frame.minX + 223.67, y: frame.minY + 180.72), controlPoint2: CGPoint(x: frame.minX + 219.23, y: frame.minY + 190.21))
        bezier2Path.close()
        bezier2Path.usesEvenOddFillRule = true
        fillColor4.setFill()
        bezier2Path.fill()
        
        
        
        
        //// Rectangle 9 Drawing
        let rectangle9Path = UIBezierPath(rect: CGRect(x: frame.minX + 186, y: frame.minY + 149, width: 40, height: 4))
        UIColor.black.setFill()
        rectangle9Path.fill()
        
        
        //// Rectangle 10 Drawing
        let rectangle10Path = UIBezierPath(rect: CGRect(x: frame.minX + 187, y: frame.minY + 181, width: 40, height: 4))
        UIColor.black.setFill()
        rectangle10Path.fill()
        
        
        //// Rectangle 11 Drawing
        let rectangle11Path = UIBezierPath(rect: CGRect(x: frame.minX + 290, y: frame.minY + 166, width: 27, height: 4))
        UIColor.black.setFill()
        rectangle11Path.fill()
        
        
        //// Bezier Drawing
        let bezierPath = UIBezierPath()
        bezierPath.move(to: CGPoint(x: frame.minX + 114.58, y: frame.minY + 60.08))
        bezierPath.addCurve(to: CGPoint(x: frame.minX + 147.35, y: frame.minY + 94.57), controlPoint1: CGPoint(x: frame.minX + 132.85, y: frame.minY + 61.12), controlPoint2: CGPoint(x: frame.minX + 147.35, y: frame.minY + 76.16))
        bezierPath.addCurve(to: CGPoint(x: frame.minX + 114.58, y: frame.minY + 129.01), controlPoint1: CGPoint(x: frame.minX + 147.35, y: frame.minY + 112.98), controlPoint2: CGPoint(x: frame.minX + 132.85, y: frame.minY + 128.02))
        bezierPath.addLine(to: CGPoint(x: frame.minX + 77.96, y: frame.minY + 129.07))
        bezierPath.addCurve(to: CGPoint(x: frame.minX + 77.96, y: frame.minY + 94.57), controlPoint1: CGPoint(x: frame.minX + 77.96, y: frame.minY + 129.07), controlPoint2: CGPoint(x: frame.minX + 77.96, y: frame.minY + 111.82))
        bezierPath.addCurve(to: CGPoint(x: frame.minX + 77.96, y: frame.minY + 60.08), controlPoint1: CGPoint(x: frame.minX + 77.96, y: frame.minY + 77.32), controlPoint2: CGPoint(x: frame.minX + 77.96, y: frame.minY + 60.08))
        bezierPath.addLine(to: CGPoint(x: frame.minX + 114.58, y: frame.minY + 60.08))
        bezierPath.addLine(to: CGPoint(x: frame.minX + 114.58, y: frame.minY + 60.08))
        bezierPath.close()
        color9.setFill()
        bezierPath.fill()
        UIColor.black.setStroke()
        bezierPath.lineWidth = 4
        bezierPath.stroke()
        
        
        //// gate 2
        //// path2 Drawing
        let path2Path = UIBezierPath()
        path2Path.move(to: CGPoint(x: frame.minX + 75.13, y: frame.minY + 209.84))
        path2Path.addLine(to: CGPoint(x: frame.minX + 78.18, y: frame.minY + 218.14))
        path2Path.addCurve(to: CGPoint(x: frame.minX + 81.99, y: frame.minY + 231.96), controlPoint1: CGPoint(x: frame.minX + 80.21, y: frame.minY + 223.66), controlPoint2: CGPoint(x: frame.minX + 81.48, y: frame.minY + 228.27))
        path2Path.addCurve(to: CGPoint(x: frame.minX + 82.73, y: frame.minY + 243.01), controlPoint1: CGPoint(x: frame.minX + 82.5, y: frame.minY + 235.64), controlPoint2: CGPoint(x: frame.minX + 82.73, y: frame.minY + 239.33))
        path2Path.addCurve(to: CGPoint(x: frame.minX + 81.99, y: frame.minY + 254.04), controlPoint1: CGPoint(x: frame.minX + 82.73, y: frame.minY + 246.67), controlPoint2: CGPoint(x: frame.minX + 82.5, y: frame.minY + 250.36))
        path2Path.addCurve(to: CGPoint(x: frame.minX + 78.18, y: frame.minY + 267.86), controlPoint1: CGPoint(x: frame.minX + 81.48, y: frame.minY + 257.73), controlPoint2: CGPoint(x: frame.minX + 80.21, y: frame.minY + 262.34))
        path2Path.addCurve(to: CGPoint(x: frame.minX + 75.13, y: frame.minY + 276.16), controlPoint1: CGPoint(x: frame.minX + 76.15, y: frame.minY + 273.39), controlPoint2: CGPoint(x: frame.minX + 75.13, y: frame.minY + 276.16))
        path2Path.addCurve(to: CGPoint(x: frame.minX + 84.28, y: frame.minY + 276.16), controlPoint1: CGPoint(x: frame.minX + 75.13, y: frame.minY + 276.16), controlPoint2: CGPoint(x: frame.minX + 78.18, y: frame.minY + 276.16))
        path2Path.addCurve(to: CGPoint(x: frame.minX + 98.01, y: frame.minY + 276.16), controlPoint1: CGPoint(x: frame.minX + 90.38, y: frame.minY + 276.16), controlPoint2: CGPoint(x: frame.minX + 94.96, y: frame.minY + 276.16))
        path2Path.addCurve(to: CGPoint(x: frame.minX + 109.63, y: frame.minY + 275.24), controlPoint1: CGPoint(x: frame.minX + 101.04, y: frame.minY + 276.16), controlPoint2: CGPoint(x: frame.minX + 104.92, y: frame.minY + 275.85))
        path2Path.addCurve(to: CGPoint(x: frame.minX + 124.12, y: frame.minY + 270.63), controlPoint1: CGPoint(x: frame.minX + 114.32, y: frame.minY + 274.62), controlPoint2: CGPoint(x: frame.minX + 119.15, y: frame.minY + 273.09))
        path2Path.addCurve(to: CGPoint(x: frame.minX + 137.64, y: frame.minY + 261.44), controlPoint1: CGPoint(x: frame.minX + 129.07, y: frame.minY + 268.17), controlPoint2: CGPoint(x: frame.minX + 133.57, y: frame.minY + 265.13))
        path2Path.addCurve(to: CGPoint(x: frame.minX + 147.56, y: frame.minY + 249.46), controlPoint1: CGPoint(x: frame.minX + 141.71, y: frame.minY + 257.76), controlPoint2: CGPoint(x: frame.minX + 145.01, y: frame.minY + 253.76))
        path2Path.addCurve(to: CGPoint(x: frame.minX + 151.37, y: frame.minY + 243.01), controlPoint1: CGPoint(x: frame.minX + 150.1, y: frame.minY + 245.16), controlPoint2: CGPoint(x: frame.minX + 151.37, y: frame.minY + 243.01))
        path2Path.addCurve(to: CGPoint(x: frame.minX + 147.56, y: frame.minY + 236.56), controlPoint1: CGPoint(x: frame.minX + 151.37, y: frame.minY + 243.01), controlPoint2: CGPoint(x: frame.minX + 150.1, y: frame.minY + 240.86))
        path2Path.addCurve(to: CGPoint(x: frame.minX + 137.64, y: frame.minY + 224.59), controlPoint1: CGPoint(x: frame.minX + 145.01, y: frame.minY + 232.26), controlPoint2: CGPoint(x: frame.minX + 141.71, y: frame.minY + 228.27))
        path2Path.addCurve(to: CGPoint(x: frame.minX + 124.12, y: frame.minY + 215.4), controlPoint1: CGPoint(x: frame.minX + 133.57, y: frame.minY + 220.93), controlPoint2: CGPoint(x: frame.minX + 129.07, y: frame.minY + 217.83))
        path2Path.addCurve(to: CGPoint(x: frame.minX + 109.63, y: frame.minY + 210.79), controlPoint1: CGPoint(x: frame.minX + 119.15, y: frame.minY + 212.94), controlPoint2: CGPoint(x: frame.minX + 114.32, y: frame.minY + 211.41))
        path2Path.addCurve(to: CGPoint(x: frame.minX + 98.01, y: frame.minY + 209.87), controlPoint1: CGPoint(x: frame.minX + 104.94, y: frame.minY + 210.18), controlPoint2: CGPoint(x: frame.minX + 101.06, y: frame.minY + 209.87))
        path2Path.addCurve(to: CGPoint(x: frame.minX + 84.28, y: frame.minY + 209.87), controlPoint1: CGPoint(x: frame.minX + 94.96, y: frame.minY + 209.87), controlPoint2: CGPoint(x: frame.minX + 90.38, y: frame.minY + 209.87))
        path2Path.addLine(to: CGPoint(x: frame.minX + 75.13, y: frame.minY + 209.84))
        path2Path.close()
        color10.setFill()
        path2Path.fill()
        strokeColor.setStroke()
        path2Path.lineWidth = 4
        path2Path.miterLimit = 10.43
        path2Path.lineCapStyle = .square
        path2Path.stroke()
        
        
        
        
        //// gate
        //// path Drawing
        let pathPath = UIBezierPath()
        pathPath.move(to: CGPoint(x: frame.minX + 222.13, y: frame.minY + 134.84))
        pathPath.addLine(to: CGPoint(x: frame.minX + 225.18, y: frame.minY + 143.26))
        pathPath.addCurve(to: CGPoint(x: frame.minX + 228.99, y: frame.minY + 157.29), controlPoint1: CGPoint(x: frame.minX + 227.21, y: frame.minY + 148.87), controlPoint2: CGPoint(x: frame.minX + 228.48, y: frame.minY + 153.55))
        pathPath.addCurve(to: CGPoint(x: frame.minX + 229.73, y: frame.minY + 168.51), controlPoint1: CGPoint(x: frame.minX + 229.5, y: frame.minY + 161.03), controlPoint2: CGPoint(x: frame.minX + 229.73, y: frame.minY + 164.77))
        pathPath.addCurve(to: CGPoint(x: frame.minX + 228.99, y: frame.minY + 179.71), controlPoint1: CGPoint(x: frame.minX + 229.73, y: frame.minY + 172.23), controlPoint2: CGPoint(x: frame.minX + 229.5, y: frame.minY + 175.97))
        pathPath.addCurve(to: CGPoint(x: frame.minX + 225.18, y: frame.minY + 193.74), controlPoint1: CGPoint(x: frame.minX + 228.48, y: frame.minY + 183.45), controlPoint2: CGPoint(x: frame.minX + 227.21, y: frame.minY + 188.13))
        pathPath.addCurve(to: CGPoint(x: frame.minX + 222.13, y: frame.minY + 202.16), controlPoint1: CGPoint(x: frame.minX + 223.15, y: frame.minY + 199.35), controlPoint2: CGPoint(x: frame.minX + 222.13, y: frame.minY + 202.16))
        pathPath.addCurve(to: CGPoint(x: frame.minX + 231.28, y: frame.minY + 202.16), controlPoint1: CGPoint(x: frame.minX + 222.13, y: frame.minY + 202.16), controlPoint2: CGPoint(x: frame.minX + 225.18, y: frame.minY + 202.16))
        pathPath.addCurve(to: CGPoint(x: frame.minX + 245.01, y: frame.minY + 202.16), controlPoint1: CGPoint(x: frame.minX + 237.38, y: frame.minY + 202.16), controlPoint2: CGPoint(x: frame.minX + 241.96, y: frame.minY + 202.16))
        pathPath.addCurve(to: CGPoint(x: frame.minX + 256.63, y: frame.minY + 201.22), controlPoint1: CGPoint(x: frame.minX + 248.04, y: frame.minY + 202.16), controlPoint2: CGPoint(x: frame.minX + 251.92, y: frame.minY + 201.85))
        pathPath.addCurve(to: CGPoint(x: frame.minX + 271.12, y: frame.minY + 196.55), controlPoint1: CGPoint(x: frame.minX + 261.32, y: frame.minY + 200.6), controlPoint2: CGPoint(x: frame.minX + 266.15, y: frame.minY + 199.04))
        pathPath.addCurve(to: CGPoint(x: frame.minX + 284.64, y: frame.minY + 187.22), controlPoint1: CGPoint(x: frame.minX + 276.07, y: frame.minY + 194.05), controlPoint2: CGPoint(x: frame.minX + 280.57, y: frame.minY + 190.96))
        pathPath.addCurve(to: CGPoint(x: frame.minX + 294.56, y: frame.minY + 175.06), controlPoint1: CGPoint(x: frame.minX + 288.71, y: frame.minY + 183.48), controlPoint2: CGPoint(x: frame.minX + 292.01, y: frame.minY + 179.43))
        pathPath.addCurve(to: CGPoint(x: frame.minX + 298.37, y: frame.minY + 168.51), controlPoint1: CGPoint(x: frame.minX + 297.1, y: frame.minY + 170.7), controlPoint2: CGPoint(x: frame.minX + 298.37, y: frame.minY + 168.51))
        pathPath.addCurve(to: CGPoint(x: frame.minX + 294.56, y: frame.minY + 161.97), controlPoint1: CGPoint(x: frame.minX + 298.37, y: frame.minY + 168.51), controlPoint2: CGPoint(x: frame.minX + 297.1, y: frame.minY + 166.33))
        pathPath.addCurve(to: CGPoint(x: frame.minX + 284.64, y: frame.minY + 149.81), controlPoint1: CGPoint(x: frame.minX + 292.01, y: frame.minY + 157.6), controlPoint2: CGPoint(x: frame.minX + 288.71, y: frame.minY + 153.55))
        pathPath.addCurve(to: CGPoint(x: frame.minX + 271.12, y: frame.minY + 140.48), controlPoint1: CGPoint(x: frame.minX + 280.57, y: frame.minY + 146.09), controlPoint2: CGPoint(x: frame.minX + 276.07, y: frame.minY + 142.95))
        pathPath.addCurve(to: CGPoint(x: frame.minX + 256.63, y: frame.minY + 135.81), controlPoint1: CGPoint(x: frame.minX + 266.15, y: frame.minY + 137.99), controlPoint2: CGPoint(x: frame.minX + 261.32, y: frame.minY + 136.43))
        pathPath.addCurve(to: CGPoint(x: frame.minX + 245.01, y: frame.minY + 134.87), controlPoint1: CGPoint(x: frame.minX + 251.94, y: frame.minY + 135.18), controlPoint2: CGPoint(x: frame.minX + 248.06, y: frame.minY + 134.87))
        pathPath.addCurve(to: CGPoint(x: frame.minX + 231.28, y: frame.minY + 134.87), controlPoint1: CGPoint(x: frame.minX + 241.96, y: frame.minY + 134.87), controlPoint2: CGPoint(x: frame.minX + 237.38, y: frame.minY + 134.87))
        pathPath.addLine(to: CGPoint(x: frame.minX + 222.13, y: frame.minY + 134.84))
        pathPath.close()
        color11.setFill()
        pathPath.fill()
        strokeColor.setStroke()
        pathPath.lineWidth = 4
        pathPath.miterLimit = 10.43
        pathPath.lineCapStyle = .square
        pathPath.stroke()
        
        
        
        
        //// Group 3
        //// Bezier 3 Drawing
        let bezier3Path = UIBezierPath()
        bezier3Path.move(to: CGPoint(x: frame.minX + 346.39, y: frame.minY + 244.27))
        bezier3Path.addCurve(to: CGPoint(x: frame.minX + 342.94, y: frame.minY + 249), controlPoint1: CGPoint(x: frame.minX + 343.94, y: frame.minY + 248.44), controlPoint2: CGPoint(x: frame.minX + 342.94, y: frame.minY + 249))
        bezier3Path.addLine(to: CGPoint(x: frame.minX + 337.34, y: frame.minY + 249))
        bezier3Path.addLine(to: CGPoint(x: frame.minX + 340.41, y: frame.minY + 245.16))
        bezier3Path.addCurve(to: CGPoint(x: frame.minX + 349.07, y: frame.minY + 217.5), controlPoint1: CGPoint(x: frame.minX + 340.41, y: frame.minY + 245.16), controlPoint2: CGPoint(x: frame.minX + 349.07, y: frame.minY + 234.14))
        bezier3Path.addCurve(to: CGPoint(x: frame.minX + 340.41, y: frame.minY + 189.84), controlPoint1: CGPoint(x: frame.minX + 349.07, y: frame.minY + 200.86), controlPoint2: CGPoint(x: frame.minX + 340.41, y: frame.minY + 189.84))
        bezier3Path.addLine(to: CGPoint(x: frame.minX + 337.34, y: frame.minY + 186))
        bezier3Path.addLine(to: CGPoint(x: frame.minX + 342.94, y: frame.minY + 186))
        bezier3Path.addCurve(to: CGPoint(x: frame.minX + 346.34, y: frame.minY + 190.72), controlPoint1: CGPoint(x: frame.minX + 344.14, y: frame.minY + 187.48), controlPoint2: CGPoint(x: frame.minX + 345.12, y: frame.minY + 188.61))
        bezier3Path.addCurve(to: CGPoint(x: frame.minX + 353.67, y: frame.minY + 217.5), controlPoint1: CGPoint(x: frame.minX + 349.21, y: frame.minY + 195.61), controlPoint2: CGPoint(x: frame.minX + 353.67, y: frame.minY + 204.94))
        bezier3Path.addCurve(to: CGPoint(x: frame.minX + 346.39, y: frame.minY + 244.27), controlPoint1: CGPoint(x: frame.minX + 353.67, y: frame.minY + 230.02), controlPoint2: CGPoint(x: frame.minX + 349.23, y: frame.minY + 239.36))
        bezier3Path.close()
        bezier3Path.usesEvenOddFillRule = true
        fillColor4.setFill()
        bezier3Path.fill()
        
        
        
        
        //// Rectangle 13 Drawing
        let rectangle13Path = UIBezierPath(rect: CGRect(x: frame.minX + 317, y: frame.minY + 200, width: 40, height: 4))
        UIColor.black.setFill()
        rectangle13Path.fill()
        
        
        //// Rectangle 14 Drawing
        let rectangle14Path = UIBezierPath(rect: CGRect(x: frame.minX + 317, y: frame.minY + 229, width: 40, height: 4))
        UIColor.black.setFill()
        rectangle14Path.fill()
        
        
        //// gate 3
        //// path 3 Drawing
        let path3Path = UIBezierPath()
        path3Path.move(to: CGPoint(x: frame.minX + 351.13, y: frame.minY + 184.84))
        path3Path.addLine(to: CGPoint(x: frame.minX + 354.22, y: frame.minY + 193.14))
        path3Path.addCurve(to: CGPoint(x: frame.minX + 358.08, y: frame.minY + 206.96), controlPoint1: CGPoint(x: frame.minX + 356.28, y: frame.minY + 198.66), controlPoint2: CGPoint(x: frame.minX + 357.57, y: frame.minY + 203.27))
        path3Path.addCurve(to: CGPoint(x: frame.minX + 358.83, y: frame.minY + 218.01), controlPoint1: CGPoint(x: frame.minX + 358.6, y: frame.minY + 210.64), controlPoint2: CGPoint(x: frame.minX + 358.83, y: frame.minY + 214.33))
        path3Path.addCurve(to: CGPoint(x: frame.minX + 358.08, y: frame.minY + 229.04), controlPoint1: CGPoint(x: frame.minX + 358.83, y: frame.minY + 221.67), controlPoint2: CGPoint(x: frame.minX + 358.6, y: frame.minY + 225.36))
        path3Path.addCurve(to: CGPoint(x: frame.minX + 354.22, y: frame.minY + 242.86), controlPoint1: CGPoint(x: frame.minX + 357.57, y: frame.minY + 232.73), controlPoint2: CGPoint(x: frame.minX + 356.28, y: frame.minY + 237.34))
        path3Path.addCurve(to: CGPoint(x: frame.minX + 351.13, y: frame.minY + 251.16), controlPoint1: CGPoint(x: frame.minX + 352.16, y: frame.minY + 248.39), controlPoint2: CGPoint(x: frame.minX + 351.13, y: frame.minY + 251.16))
        path3Path.addCurve(to: CGPoint(x: frame.minX + 360.4, y: frame.minY + 251.16), controlPoint1: CGPoint(x: frame.minX + 351.13, y: frame.minY + 251.16), controlPoint2: CGPoint(x: frame.minX + 354.22, y: frame.minY + 251.16))
        path3Path.addCurve(to: CGPoint(x: frame.minX + 374.31, y: frame.minY + 251.16), controlPoint1: CGPoint(x: frame.minX + 366.58, y: frame.minY + 251.16), controlPoint2: CGPoint(x: frame.minX + 371.22, y: frame.minY + 251.16))
        path3Path.addCurve(to: CGPoint(x: frame.minX + 386.08, y: frame.minY + 250.24), controlPoint1: CGPoint(x: frame.minX + 377.38, y: frame.minY + 251.16), controlPoint2: CGPoint(x: frame.minX + 381.31, y: frame.minY + 250.85))
        path3Path.addCurve(to: CGPoint(x: frame.minX + 400.76, y: frame.minY + 245.63), controlPoint1: CGPoint(x: frame.minX + 390.84, y: frame.minY + 249.62), controlPoint2: CGPoint(x: frame.minX + 395.73, y: frame.minY + 248.09))
        path3Path.addCurve(to: CGPoint(x: frame.minX + 414.46, y: frame.minY + 236.44), controlPoint1: CGPoint(x: frame.minX + 405.78, y: frame.minY + 243.17), controlPoint2: CGPoint(x: frame.minX + 410.34, y: frame.minY + 240.13))
        path3Path.addCurve(to: CGPoint(x: frame.minX + 424.51, y: frame.minY + 224.46), controlPoint1: CGPoint(x: frame.minX + 418.58, y: frame.minY + 232.76), controlPoint2: CGPoint(x: frame.minX + 421.93, y: frame.minY + 228.76))
        path3Path.addCurve(to: CGPoint(x: frame.minX + 428.37, y: frame.minY + 218.01), controlPoint1: CGPoint(x: frame.minX + 427.08, y: frame.minY + 220.16), controlPoint2: CGPoint(x: frame.minX + 428.37, y: frame.minY + 218.01))
        path3Path.addCurve(to: CGPoint(x: frame.minX + 424.51, y: frame.minY + 211.56), controlPoint1: CGPoint(x: frame.minX + 428.37, y: frame.minY + 218.01), controlPoint2: CGPoint(x: frame.minX + 427.08, y: frame.minY + 215.86))
        path3Path.addCurve(to: CGPoint(x: frame.minX + 414.46, y: frame.minY + 199.59), controlPoint1: CGPoint(x: frame.minX + 421.93, y: frame.minY + 207.26), controlPoint2: CGPoint(x: frame.minX + 418.58, y: frame.minY + 203.27))
        path3Path.addCurve(to: CGPoint(x: frame.minX + 400.76, y: frame.minY + 190.4), controlPoint1: CGPoint(x: frame.minX + 410.34, y: frame.minY + 195.93), controlPoint2: CGPoint(x: frame.minX + 405.78, y: frame.minY + 192.83))
        path3Path.addCurve(to: CGPoint(x: frame.minX + 386.08, y: frame.minY + 185.79), controlPoint1: CGPoint(x: frame.minX + 395.73, y: frame.minY + 187.94), controlPoint2: CGPoint(x: frame.minX + 390.84, y: frame.minY + 186.41))
        path3Path.addCurve(to: CGPoint(x: frame.minX + 374.31, y: frame.minY + 184.87), controlPoint1: CGPoint(x: frame.minX + 381.33, y: frame.minY + 185.18), controlPoint2: CGPoint(x: frame.minX + 377.4, y: frame.minY + 184.87))
        path3Path.addCurve(to: CGPoint(x: frame.minX + 360.4, y: frame.minY + 184.87), controlPoint1: CGPoint(x: frame.minX + 371.22, y: frame.minY + 184.87), controlPoint2: CGPoint(x: frame.minX + 366.58, y: frame.minY + 184.87))
        path3Path.addLine(to: CGPoint(x: frame.minX + 351.13, y: frame.minY + 184.84))
        path3Path.close()
        color12.setFill()
        path3Path.fill()
        strokeColor.setStroke()
        path3Path.lineWidth = 4
        path3Path.miterLimit = 10.43
        path3Path.lineCapStyle = .square
        path3Path.stroke()
        
        
        
        
        //// value a Drawing
        let valueARect = CGRect(x: frame.minX + 38, y: frame.minY + 38, width: 38, height: 40)
        let valueATextContent = trueFalse[varState[0]]
        let valueAStyle = NSMutableParagraphStyle()
        valueAStyle.alignment = .center
        let valueAFontAttributes = [
            .font: UIFont.systemFont(ofSize: 30, weight: .bold),
            .foregroundColor: colorTF[varState[0]],
            .paragraphStyle: valueAStyle,
            ] as [NSAttributedStringKey: Any]
        
        let valueATextHeight: CGFloat = valueATextContent.boundingRect(with: CGSize(width: valueARect.width, height: CGFloat.infinity), options: .usesLineFragmentOrigin, attributes: valueAFontAttributes, context: nil).height
        context.saveGState()
        context.clip(to: valueARect)
        valueATextContent.draw(in: CGRect(x: valueARect.minX, y: valueARect.minY + (valueARect.height - valueATextHeight) / 2, width: valueARect.width, height: valueATextHeight), withAttributes: valueAFontAttributes)
        context.restoreGState()
        
        
        //// caption a Drawing
        let captionARect = CGRect(x: frame.minX, y: frame.minY + 38, width: 38, height: 40)
        let captionATextContent = "A"
        let captionAStyle = NSMutableParagraphStyle()
        captionAStyle.alignment = .center
        let captionAFontAttributes = [
            .font: UIFont.italicSystemFont(ofSize: 30),
            .foregroundColor: textForeground,
            .paragraphStyle: captionAStyle,
            ] as [NSAttributedStringKey: Any]
        
        let captionATextHeight: CGFloat = captionATextContent.boundingRect(with: CGSize(width: captionARect.width, height: CGFloat.infinity), options: .usesLineFragmentOrigin, attributes: captionAFontAttributes, context: nil).height
        context.saveGState()
        context.clip(to: captionARect)
        captionATextContent.draw(in: CGRect(x: captionARect.minX, y: captionARect.minY + (captionARect.height - captionATextHeight) / 2, width: captionARect.width, height: captionATextHeight), withAttributes: captionAFontAttributes)
        context.restoreGState()
        
        
        //// caption b Drawing
        let captionBRect = CGRect(x: frame.minX, y: frame.minY + 111, width: 38, height: 40)
        let captionBTextContent = "B"
        let captionBStyle = NSMutableParagraphStyle()
        captionBStyle.alignment = .center
        let captionBFontAttributes = [
            .font: UIFont.systemFont(ofSize: 30, weight: .bold),
            .foregroundColor: strokeColor,
            .paragraphStyle: captionBStyle,
            ] as [NSAttributedStringKey: Any]
        
        let captionBTextHeight: CGFloat = captionBTextContent.boundingRect(with: CGSize(width: captionBRect.width, height: CGFloat.infinity), options: .usesLineFragmentOrigin, attributes: captionBFontAttributes, context: nil).height
        context.saveGState()
        context.clip(to: captionBRect)
        captionBTextContent.draw(in: CGRect(x: captionBRect.minX, y: captionBRect.minY + (captionBRect.height - captionBTextHeight) / 2, width: captionBRect.width, height: captionBTextHeight), withAttributes: captionBFontAttributes)
        context.restoreGState()
        
        
        //// Rectangle 12 Drawing
        let rectangle12Path = UIBezierPath(rect: CGRect(x: frame.minX + 187, y: frame.minY + 185, width: 4, height: 60))
        UIColor.black.setFill()
        rectangle12Path.fill()
        
        
        //// value d Drawing
        let valueDRect = CGRect(x: frame.minX + 39, y: frame.minY + 260, width: 38, height: 40)
        let valueDTextContent = trueFalse[varState[3]]
        let valueDStyle = NSMutableParagraphStyle()
        valueDStyle.alignment = .center
        let valueDFontAttributes = [
            .font: UIFont.systemFont(ofSize: 30, weight: .heavy),
            .foregroundColor: colorTF[varState[3]],
            .paragraphStyle: valueDStyle,
            ] as [NSAttributedStringKey: Any]
        
        let valueDTextHeight: CGFloat = valueDTextContent.boundingRect(with: CGSize(width: valueDRect.width, height: CGFloat.infinity), options: .usesLineFragmentOrigin, attributes: valueDFontAttributes, context: nil).height
        context.saveGState()
        context.clip(to: valueDRect)
        valueDTextContent.draw(in: CGRect(x: valueDRect.minX, y: valueDRect.minY + (valueDRect.height - valueDTextHeight) / 2, width: valueDRect.width, height: valueDTextHeight), withAttributes: valueDFontAttributes)
        context.restoreGState()
        
        
        //// caption c Drawing
        let captionCRect = CGRect(x: frame.minX + 1, y: frame.minY + 187, width: 38, height: 39)
        let captionCTextContent = "C"
        let captionCStyle = NSMutableParagraphStyle()
        captionCStyle.alignment = .center
        let captionCFontAttributes = [
            .font: UIFont.italicSystemFont(ofSize: 30),
            .foregroundColor: textForeground,
            .paragraphStyle: captionCStyle,
            ] as [NSAttributedStringKey: Any]
        
        let captionCTextHeight: CGFloat = captionCTextContent.boundingRect(with: CGSize(width: captionCRect.width, height: CGFloat.infinity), options: .usesLineFragmentOrigin, attributes: captionCFontAttributes, context: nil).height
        context.saveGState()
        context.clip(to: captionCRect)
        captionCTextContent.draw(in: CGRect(x: captionCRect.minX, y: captionCRect.minY + (captionCRect.height - captionCTextHeight) / 2, width: captionCRect.width, height: captionCTextHeight), withAttributes: captionCFontAttributes)
        context.restoreGState()
        
        
        //// caption d Drawing
        let captionDRect = CGRect(x: frame.minX + 1, y: frame.minY + 259, width: 38, height: 40)
        let captionDTextContent = "D"
        let captionDStyle = NSMutableParagraphStyle()
        captionDStyle.alignment = .center
        let captionDFontAttributes = [
            .font: UIFont.systemFont(ofSize: 30, weight: .bold),
            .foregroundColor: textForeground,
            .paragraphStyle: captionDStyle,
            ] as [NSAttributedStringKey: Any]
        
        let captionDTextHeight: CGFloat = captionDTextContent.boundingRect(with: CGSize(width: captionDRect.width, height: CGFloat.infinity), options: .usesLineFragmentOrigin, attributes: captionDFontAttributes, context: nil).height
        context.saveGState()
        context.clip(to: captionDRect)
        captionDTextContent.draw(in: CGRect(x: captionDRect.minX, y: captionDRect.minY + (captionDRect.height - captionDTextHeight) / 2, width: captionDRect.width, height: captionDTextHeight), withAttributes: captionDFontAttributes)
        context.restoreGState()
        
        
        //// caption x Drawing
        let captionXRect = CGRect(x: frame.minX + 190, y: frame.minY + 92, width: 38, height: 40)
        let captionXTextContent = "X"
        let captionXStyle = NSMutableParagraphStyle()
        captionXStyle.alignment = .center
        let captionXFontAttributes = [
            .font: UIFont.italicSystemFont(ofSize: 30),
            .foregroundColor: textForeground,
            .paragraphStyle: captionXStyle,
            ] as [NSAttributedStringKey: Any]
        
        let captionXTextHeight: CGFloat = captionXTextContent.boundingRect(with: CGSize(width: captionXRect.width, height: CGFloat.infinity), options: .usesLineFragmentOrigin, attributes: captionXFontAttributes, context: nil).height
        context.saveGState()
        context.clip(to: captionXRect)
        captionXTextContent.draw(in: CGRect(x: captionXRect.minX, y: captionXRect.minY + (captionXRect.height - captionXTextHeight) / 2, width: captionXRect.width, height: captionXTextHeight), withAttributes: captionXFontAttributes)
        context.restoreGState()
        
        
        //// caption y Drawing
        let captionYRect = CGRect(x: frame.minX + 190, y: frame.minY + 205, width: 38, height: 40)
        let captionYTextContent = "Y"
        let captionYStyle = NSMutableParagraphStyle()
        captionYStyle.alignment = .center
        let captionYFontAttributes = [
            .font: UIFont.italicSystemFont(ofSize: 30),
            .foregroundColor: textForeground,
            .paragraphStyle: captionYStyle,
            ] as [NSAttributedStringKey: Any]
        
        let captionYTextHeight: CGFloat = captionYTextContent.boundingRect(with: CGSize(width: captionYRect.width, height: CGFloat.infinity), options: .usesLineFragmentOrigin, attributes: captionYFontAttributes, context: nil).height
        context.saveGState()
        context.clip(to: captionYRect)
        captionYTextContent.draw(in: CGRect(x: captionYRect.minX, y: captionYRect.minY + (captionYRect.height - captionYTextHeight) / 2, width: captionYRect.width, height: captionYTextHeight), withAttributes: captionYFontAttributes)
        context.restoreGState()
        
        
        //// caption m Drawing
        let captionMRect = CGRect(x: frame.minX + 320, y: frame.minY + 136, width: 38, height: 40)
        let captionMTextContent = "M"
        let captionMStyle = NSMutableParagraphStyle()
        captionMStyle.alignment = .center
        let captionMFontAttributes = [
            .font: UIFont.italicSystemFont(ofSize: 30),
            .foregroundColor: textForeground,
            .paragraphStyle: captionMStyle,
            ] as [NSAttributedStringKey: Any]
        
        let captionMTextHeight: CGFloat = captionMTextContent.boundingRect(with: CGSize(width: captionMRect.width, height: CGFloat.infinity), options: .usesLineFragmentOrigin, attributes: captionMFontAttributes, context: nil).height
        context.saveGState()
        context.clip(to: captionMRect)
        captionMTextContent.draw(in: CGRect(x: captionMRect.minX, y: captionMRect.minY + (captionMRect.height - captionMTextHeight) / 2, width: captionMRect.width, height: captionMTextHeight), withAttributes: captionMFontAttributes)
        context.restoreGState()
        
        
        //// caption n Drawing
        let captionNRect = CGRect(x: frame.minX + 317, y: frame.minY + 259, width: 37, height: 40)
        let captionNTextContent = "N"
        let captionNStyle = NSMutableParagraphStyle()
        captionNStyle.alignment = .center
        let captionNFontAttributes = [
            .font: UIFont.italicSystemFont(ofSize: 30),
            .foregroundColor: textForeground,
            .paragraphStyle: captionNStyle,
            ] as [NSAttributedStringKey: Any]
        
        let captionNTextHeight: CGFloat = captionNTextContent.boundingRect(with: CGSize(width: captionNRect.width, height: CGFloat.infinity), options: .usesLineFragmentOrigin, attributes: captionNFontAttributes, context: nil).height
        context.saveGState()
        context.clip(to: captionNRect)
        captionNTextContent.draw(in: CGRect(x: captionNRect.minX, y: captionNRect.minY + (captionNRect.height - captionNTextHeight) / 2, width: captionNRect.width, height: captionNTextHeight), withAttributes: captionNFontAttributes)
        context.restoreGState()
        
        
        //// outputline z Drawing
        let outputlineZPath = UIBezierPath(rect: CGRect(x: frame.minX + 443, y: frame.minY + 215, width: 27, height: 4))
        UIColor.black.setFill()
        outputlineZPath.fill()
        
        
        //// caption Z Drawing
        let captionZRect = CGRect(x: frame.minX + 466, y: frame.minY + 197, width: 38, height: 40)
        let captionZTextContent = "Z"
        let captionZStyle = NSMutableParagraphStyle()
        captionZStyle.alignment = .center
        let captionZFontAttributes = [
            .font: UIFont.italicSystemFont(ofSize: 30),
            .foregroundColor: textForeground,
            .paragraphStyle: captionZStyle,
            ] as [NSAttributedStringKey: Any]
        
        let captionZTextHeight: CGFloat = captionZTextContent.boundingRect(with: CGSize(width: captionZRect.width, height: CGFloat.infinity), options: .usesLineFragmentOrigin, attributes: captionZFontAttributes, context: nil).height
        context.saveGState()
        context.clip(to: captionZRect)
        captionZTextContent.draw(in: CGRect(x: captionZRect.minX, y: captionZRect.minY + (captionZRect.height - captionZTextHeight) / 2, width: captionZRect.width, height: captionZTextHeight), withAttributes: captionZFontAttributes)
        context.restoreGState()
        
        
        //// value Z Drawing
        let valueZRect = CGRect(x: frame.minX + 504, y: frame.minY + 197, width: 38, height: 40)
        let valueZTextContent = trueFalse[varState[8]]
        let valueZStyle = NSMutableParagraphStyle()
        valueZStyle.alignment = .center
        let valueZFontAttributes = [
            .font: UIFont.systemFont(ofSize: 30, weight: .bold),
            .foregroundColor: colorTF[varState[8]],
            .paragraphStyle: valueZStyle,
            ] as [NSAttributedStringKey: Any]
        
        let valueZTextHeight: CGFloat = valueZTextContent.boundingRect(with: CGSize(width: valueZRect.width, height: CGFloat.infinity), options: .usesLineFragmentOrigin, attributes: valueZFontAttributes, context: nil).height
        context.saveGState()
        context.clip(to: valueZRect)
        valueZTextContent.draw(in: CGRect(x: valueZRect.minX, y: valueZRect.minY + (valueZRect.height - valueZTextHeight) / 2, width: valueZRect.width, height: valueZTextHeight), withAttributes: valueZFontAttributes)
        context.restoreGState()
        
        
        //// value B Drawing
        let valueBRect = CGRect(x: frame.minX + 38, y: frame.minY + 111, width: 41, height: 43)
        let valueBTextContent = trueFalse[varState[1]]
        let valueBStyle = NSMutableParagraphStyle()
        valueBStyle.alignment = .center
        let valueBFontAttributes = [
            .font: UIFont.systemFont(ofSize: 30, weight: .bold),
            .foregroundColor: colorTF[varState[1]],
            .paragraphStyle: valueBStyle,
            ] as [NSAttributedStringKey: Any]
        
        let valueBTextHeight: CGFloat = valueBTextContent.boundingRect(with: CGSize(width: valueBRect.width, height: CGFloat.infinity), options: .usesLineFragmentOrigin, attributes: valueBFontAttributes, context: nil).height
        context.saveGState()
        context.clip(to: valueBRect)
        valueBTextContent.draw(in: CGRect(x: valueBRect.minX, y: valueBRect.minY + (valueBRect.height - valueBTextHeight) / 2, width: valueBRect.width, height: valueBTextHeight), withAttributes: valueBFontAttributes)
        context.restoreGState()
        
        
        //// value C Drawing
        let valueCRect = CGRect(x: frame.minX + 39, y: frame.minY + 183, width: 41, height: 43)
        let valueCTextContent = trueFalse[varState[2]]
        let valueCStyle = NSMutableParagraphStyle()
        valueCStyle.alignment = .center
        let valueCFontAttributes = [
            .font: UIFont.systemFont(ofSize: 30, weight: .bold),
            .foregroundColor: colorTF[varState[2]],
            .paragraphStyle: valueCStyle,
            ] as [NSAttributedStringKey: Any]
        
        let valueCTextHeight: CGFloat = valueCTextContent.boundingRect(with: CGSize(width: valueCRect.width, height: CGFloat.infinity), options: .usesLineFragmentOrigin, attributes: valueCFontAttributes, context: nil).height
        context.saveGState()
        context.clip(to: valueCRect)
        valueCTextContent.draw(in: CGRect(x: valueCRect.minX, y: valueCRect.minY + (valueCRect.height - valueCTextHeight) / 2, width: valueCRect.width, height: valueCTextHeight), withAttributes: valueCFontAttributes)
        context.restoreGState()
        
        
        //// value Y Drawing
        let valueYRect = CGRect(x: frame.minX + 222, y: frame.minY + 205, width: 41, height: 43)
        let valueYTextContent = trueFalse[varState[5]]
        let valueYStyle = NSMutableParagraphStyle()
        valueYStyle.alignment = .center
        let valueYFontAttributes = [
            .font: UIFont.systemFont(ofSize: 30, weight: .bold),
            .foregroundColor: colorTF[varState[5]],
            .paragraphStyle: valueYStyle,
            ] as [NSAttributedStringKey: Any]
        
        let valueYTextHeight: CGFloat = valueYTextContent.boundingRect(with: CGSize(width: valueYRect.width, height: CGFloat.infinity), options: .usesLineFragmentOrigin, attributes: valueYFontAttributes, context: nil).height
        context.saveGState()
        context.clip(to: valueYRect)
        valueYTextContent.draw(in: CGRect(x: valueYRect.minX, y: valueYRect.minY + (valueYRect.height - valueYTextHeight) / 2, width: valueYRect.width, height: valueYTextHeight), withAttributes: valueYFontAttributes)
        context.restoreGState()
        
        
        //// value X Drawing
        let valueXRect = CGRect(x: frame.minX + 225, y: frame.minY + 92, width: 38, height: 40)
        let valueXTextContent = trueFalse[varState[4]]
        let valueXStyle = NSMutableParagraphStyle()
        valueXStyle.alignment = .center
        let valueXFontAttributes = [
            .font: UIFont.systemFont(ofSize: 30, weight: .bold),
            .foregroundColor: colorTF[varState[4]],
            .paragraphStyle: valueXStyle,
            ] as [NSAttributedStringKey: Any]
        
        let valueXTextHeight: CGFloat = valueXTextContent.boundingRect(with: CGSize(width: valueXRect.width, height: CGFloat.infinity), options: .usesLineFragmentOrigin, attributes: valueXFontAttributes, context: nil).height
        context.saveGState()
        context.clip(to: valueXRect)
        valueXTextContent.draw(in: CGRect(x: valueXRect.minX, y: valueXRect.minY + (valueXRect.height - valueXTextHeight) / 2, width: valueXRect.width, height: valueXTextHeight), withAttributes: valueXFontAttributes)
        context.restoreGState()
        
        
        //// value M Drawing
        let valueMRect = CGRect(x: frame.minX + 358, y: frame.minY + 135, width: 38, height: 40)
        let valueMTextContent = trueFalse[varState[6]]
        let valueMStyle = NSMutableParagraphStyle()
        valueMStyle.alignment = .center
        let valueMFontAttributes = [
            .font: UIFont.systemFont(ofSize: 30, weight: .bold),
            .foregroundColor: colorTF[varState[6]],
            .paragraphStyle: valueMStyle,
            ] as [NSAttributedStringKey: Any]
        
        let valueMTextHeight: CGFloat = valueMTextContent.boundingRect(with: CGSize(width: valueMRect.width, height: CGFloat.infinity), options: .usesLineFragmentOrigin, attributes: valueMFontAttributes, context: nil).height
        context.saveGState()
        context.clip(to: valueMRect)
        valueMTextContent.draw(in: CGRect(x: valueMRect.minX, y: valueMRect.minY + (valueMRect.height - valueMTextHeight) / 2, width: valueMRect.width, height: valueMTextHeight), withAttributes: valueMFontAttributes)
        context.restoreGState()
        
        
        //// value N Drawing
        let valueNRect = CGRect(x: frame.minX + 358, y: frame.minY + 259, width: 38, height: 40)
        let valueNTextContent = trueFalse[varState[7]]
        let valueNStyle = NSMutableParagraphStyle()
        valueNStyle.alignment = .center
        let valueNFontAttributes = [
            .font: UIFont.systemFont(ofSize: 30, weight: .bold),
            .foregroundColor: colorTF[varState[7]],
            .paragraphStyle: valueNStyle,
            ] as [NSAttributedStringKey: Any]
        
        let valueNTextHeight: CGFloat = valueNTextContent.boundingRect(with: CGSize(width: valueNRect.width, height: CGFloat.infinity), options: .usesLineFragmentOrigin, attributes: valueNFontAttributes, context: nil).height
        context.saveGState()
        context.clip(to: valueNRect)
        valueNTextContent.draw(in: CGRect(x: valueNRect.minX, y: valueNRect.minY + (valueNRect.height - valueNTextHeight) / 2, width: valueNRect.width, height: valueNTextHeight), withAttributes: valueNFontAttributes)
        context.restoreGState()
        
        
        //// gate caption nand Drawing
        let gateCaptionNandRect = CGRect(x: frame.minX + 65, y: frame.minY + 149, width: 109, height: 22)
        let gateCaptionNandTextContent = "NAND Gate"
        let gateCaptionNandStyle = NSMutableParagraphStyle()
        gateCaptionNandStyle.alignment = .center
        let gateCaptionNandFontAttributes = [
            .font: UIFont.systemFont(ofSize: UIFont.labelFontSize, weight: .bold),
            .foregroundColor: UIColor.black,
            .paragraphStyle: gateCaptionNandStyle,
            ] as [NSAttributedStringKey: Any]
        
        let gateCaptionNandTextHeight: CGFloat = gateCaptionNandTextContent.boundingRect(with: CGSize(width: gateCaptionNandRect.width, height: CGFloat.infinity), options: .usesLineFragmentOrigin, attributes: gateCaptionNandFontAttributes, context: nil).height
        context.saveGState()
        context.clip(to: gateCaptionNandRect)
        gateCaptionNandTextContent.draw(in: CGRect(x: gateCaptionNandRect.minX, y: gateCaptionNandRect.minY + (gateCaptionNandRect.height - gateCaptionNandTextHeight) / 2, width: gateCaptionNandRect.width, height: gateCaptionNandTextHeight), withAttributes: gateCaptionNandFontAttributes)
        context.restoreGState()
        
        
        //// gate caption nor Drawing
        let gateCaptionNorRect = CGRect(x: frame.minX + 65, y: frame.minY + 299, width: 109, height: 22)
        let gateCaptionNorTextContent = "NOR Gate"
        let gateCaptionNorStyle = NSMutableParagraphStyle()
        gateCaptionNorStyle.alignment = .center
        let gateCaptionNorFontAttributes = [
            .font: UIFont.systemFont(ofSize: UIFont.labelFontSize, weight: .bold),
            .foregroundColor: UIColor.black,
            .paragraphStyle: gateCaptionNorStyle,
            ] as [NSAttributedStringKey: Any]
        
        let gateCaptionNorTextHeight: CGFloat = gateCaptionNorTextContent.boundingRect(with: CGSize(width: gateCaptionNorRect.width, height: CGFloat.infinity), options: .usesLineFragmentOrigin, attributes: gateCaptionNorFontAttributes, context: nil).height
        context.saveGState()
        context.clip(to: gateCaptionNorRect)
        gateCaptionNorTextContent.draw(in: CGRect(x: gateCaptionNorRect.minX, y: gateCaptionNorRect.minY + (gateCaptionNorRect.height - gateCaptionNorTextHeight) / 2, width: gateCaptionNorRect.width, height: gateCaptionNorTextHeight), withAttributes: gateCaptionNorFontAttributes)
        context.restoreGState()
        
        
        //// gate caption xor Drawing
        let gateCaptionXorRect = CGRect(x: frame.minX + 204, y: frame.minY + 245, width: 109, height: 22)
        let gateCaptionXorTextContent = "XOR Gate"
        let gateCaptionXorStyle = NSMutableParagraphStyle()
        gateCaptionXorStyle.alignment = .center
        let gateCaptionXorFontAttributes = [
            .font: UIFont.systemFont(ofSize: UIFont.labelFontSize, weight: .bold),
            .foregroundColor: UIColor.black,
            .paragraphStyle: gateCaptionXorStyle,
            ] as [NSAttributedStringKey: Any]
        
        let gateCaptionXorTextHeight: CGFloat = gateCaptionXorTextContent.boundingRect(with: CGSize(width: gateCaptionXorRect.width, height: CGFloat.infinity), options: .usesLineFragmentOrigin, attributes: gateCaptionXorFontAttributes, context: nil).height
        context.saveGState()
        context.clip(to: gateCaptionXorRect)
        gateCaptionXorTextContent.draw(in: CGRect(x: gateCaptionXorRect.minX, y: gateCaptionXorRect.minY + (gateCaptionXorRect.height - gateCaptionXorTextHeight) / 2, width: gateCaptionXorRect.width, height: gateCaptionXorTextHeight), withAttributes: gateCaptionXorFontAttributes)
        context.restoreGState()
        
        
        //// gate caption xnor Drawing
        let gateCaptionXnorRect = CGRect(x: frame.minX + 334, y: frame.minY + 302, width: 109, height: 22)
        let gateCaptionXnorTextContent = "XNOR Gate"
        let gateCaptionXnorStyle = NSMutableParagraphStyle()
        gateCaptionXnorStyle.alignment = .center
        let gateCaptionXnorFontAttributes = [
            .font: UIFont.systemFont(ofSize: UIFont.labelFontSize, weight: .bold),
            .foregroundColor: UIColor.black,
            .paragraphStyle: gateCaptionXnorStyle,
            ] as [NSAttributedStringKey: Any]
        
        let gateCaptionXnorTextHeight: CGFloat = gateCaptionXnorTextContent.boundingRect(with: CGSize(width: gateCaptionXnorRect.width, height: CGFloat.infinity), options: .usesLineFragmentOrigin, attributes: gateCaptionXnorFontAttributes, context: nil).height
        context.saveGState()
        context.clip(to: gateCaptionXnorRect)
        gateCaptionXnorTextContent.draw(in: CGRect(x: gateCaptionXnorRect.minX, y: gateCaptionXnorRect.minY + (gateCaptionXnorRect.height - gateCaptionXnorTextHeight) / 2, width: gateCaptionXnorRect.width, height: gateCaptionXnorTextHeight), withAttributes: gateCaptionXnorFontAttributes)
        context.restoreGState()
    }
    
}











