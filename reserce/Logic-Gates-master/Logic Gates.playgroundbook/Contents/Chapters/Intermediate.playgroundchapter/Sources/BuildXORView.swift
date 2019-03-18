import PlaygroundSupport
import UIKit
import Foundation
import CoreGraphics

public class BuildXORView: UIView{
    public var inputState = [Int]()
    public var flipResults = [TrueFalseResultView]()
    
    public override func draw(_ rect: CGRect){
        drawCircuit(frame: rect)
    }
    public func redraw() {
        setNeedsDisplay()
    }
    //The drawing codes are created with the aid of PaintCode
    public func drawValues(frame: CGRect = CGRect(x: 0, y: 0, width: 460, height: 350)) {
        flipResults += [TrueFalseResultView(frame: CGRect(x: frame.minX + 30, y: frame.minY + 15, width: 26, height: 29))]
        flipResults += [TrueFalseResultView(frame: CGRect(x: frame.minX + 30, y: frame.minY + 101, width: 26, height: 29))]
        flipResults += [TrueFalseResultView(frame: CGRect(x: frame.minX + 30, y: frame.minY + 153, width: 26, height: 29))]
        flipResults += [TrueFalseResultView(frame: CGRect(x: frame.minX + 30, y: frame.minY + 239, width: 26, height: 29))]
        flipResults += [TrueFalseResultView(frame: CGRect(x: frame.minX + 160, y: frame.minY + 220, width: 26, height: 29))]
        flipResults += [TrueFalseResultView(frame: CGRect(x: frame.minX + 160, y: frame.minY + 315, width: 26, height: 29))]
        flipResults += [TrueFalseResultView(frame: CGRect(x: frame.minX + 190, y: frame.minY + 72, width: 26, height: 29))]
        flipResults += [TrueFalseResultView(frame: CGRect(x: frame.minX + 190, y: frame.minY + 184, width: 26, height: 29))]
        flipResults += [TrueFalseResultView(frame: CGRect(x: frame.minX + 311, y: frame.minY + 140, width: 26, height: 29))]
        flipResults += [TrueFalseResultView(frame: CGRect(x: frame.minX + 311, y: frame.minY + 253, width: 26, height: 29))]
        flipResults += [TrueFalseResultView(frame: CGRect(x: frame.minX + 431, y: frame.minY + 196, width: 26, height: 29))]

        for fR in flipResults {
            fR.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0)
            fR.fontsize = 30
            self.addSubview(fR)
        }
    }
    
    func drawCircuit(frame: CGRect = CGRect(x: 0, y: 0, width: 460, height: 400)) {
            //// General Declarations
            let context = UIGraphicsGetCurrentContext()!
            
            //// Color Declarations
            let strokeColor = UIColor(red: 0.000, green: 0.000, blue: 0.000, alpha: 1.000)
            let textForeground = UIColor(red: 0.000, green: 0.000, blue: 0.000, alpha: 1.000)
            let color10 = UIColor(red: 0.336, green: 0.691, blue: 0.973, alpha: 1.000)
            
            //// Group 2
            //// Oval Drawing
            let ovalPath = UIBezierPath(ovalIn: CGRect(x: frame.minX + 129, y: frame.minY + 67, width: 12, height: 12))
            color10.setFill()
            ovalPath.fill()
            strokeColor.setStroke()
            ovalPath.lineWidth = 4
            ovalPath.stroke()
            
            
            
            
            //// Rectangle 5 Drawing
            let rectangle5Path = UIBezierPath(rect: CGRect(x: frame.minX + 139, y: frame.minY + 71, width: 25, height: 4))
            UIColor.black.setFill()
            rectangle5Path.fill()
            
            
            //// Rectangle 6 Drawing
            let rectangle6Path = UIBezierPath(rect: CGRect(x: frame.minX + 39, y: frame.minY + 57, width: 28, height: 4))
            UIColor.black.setFill()
            rectangle6Path.fill()
            
            
            //// Rectangle 7 Drawing
            let rectangle7Path = UIBezierPath(rect: CGRect(x: frame.minX + 39, y: frame.minY + 83, width: 28, height: 4))
            UIColor.black.setFill()
            rectangle7Path.fill()
            
            
            //// gate 2
            //// path2 Drawing
            let path2Path = UIBezierPath()
            path2Path.move(to: CGPoint(x: frame.minX + 62.13, y: frame.minY + 43.84))
            path2Path.addLine(to: CGPoint(x: frame.minX + 64.78, y: frame.minY + 51.01))
            path2Path.addCurve(to: CGPoint(x: frame.minX + 68.09, y: frame.minY + 62.96), controlPoint1: CGPoint(x: frame.minX + 66.55, y: frame.minY + 55.79), controlPoint2: CGPoint(x: frame.minX + 67.65, y: frame.minY + 59.77))
            path2Path.addCurve(to: CGPoint(x: frame.minX + 68.73, y: frame.minY + 72.51), controlPoint1: CGPoint(x: frame.minX + 68.53, y: frame.minY + 66.14), controlPoint2: CGPoint(x: frame.minX + 68.73, y: frame.minY + 69.33))
            path2Path.addCurve(to: CGPoint(x: frame.minX + 68.09, y: frame.minY + 82.04), controlPoint1: CGPoint(x: frame.minX + 68.73, y: frame.minY + 75.67), controlPoint2: CGPoint(x: frame.minX + 68.53, y: frame.minY + 78.86))
            path2Path.addCurve(to: CGPoint(x: frame.minX + 64.78, y: frame.minY + 93.99), controlPoint1: CGPoint(x: frame.minX + 67.65, y: frame.minY + 85.23), controlPoint2: CGPoint(x: frame.minX + 66.55, y: frame.minY + 89.21))
            path2Path.addCurve(to: CGPoint(x: frame.minX + 62.13, y: frame.minY + 101.16), controlPoint1: CGPoint(x: frame.minX + 63.01, y: frame.minY + 98.77), controlPoint2: CGPoint(x: frame.minX + 62.13, y: frame.minY + 101.16))
            path2Path.addCurve(to: CGPoint(x: frame.minX + 70.08, y: frame.minY + 101.16), controlPoint1: CGPoint(x: frame.minX + 62.13, y: frame.minY + 101.16), controlPoint2: CGPoint(x: frame.minX + 64.78, y: frame.minY + 101.16))
            path2Path.addCurve(to: CGPoint(x: frame.minX + 82.01, y: frame.minY + 101.16), controlPoint1: CGPoint(x: frame.minX + 75.38, y: frame.minY + 101.16), controlPoint2: CGPoint(x: frame.minX + 79.36, y: frame.minY + 101.16))
            path2Path.addCurve(to: CGPoint(x: frame.minX + 92.11, y: frame.minY + 100.36), controlPoint1: CGPoint(x: frame.minX + 84.64, y: frame.minY + 101.16), controlPoint2: CGPoint(x: frame.minX + 88.01, y: frame.minY + 100.89))
            path2Path.addCurve(to: CGPoint(x: frame.minX + 104.7, y: frame.minY + 96.38), controlPoint1: CGPoint(x: frame.minX + 96.18, y: frame.minY + 99.83), controlPoint2: CGPoint(x: frame.minX + 100.38, y: frame.minY + 98.5))
            path2Path.addCurve(to: CGPoint(x: frame.minX + 116.44, y: frame.minY + 88.44), controlPoint1: CGPoint(x: frame.minX + 108.99, y: frame.minY + 94.26), controlPoint2: CGPoint(x: frame.minX + 112.91, y: frame.minY + 91.63))
            path2Path.addCurve(to: CGPoint(x: frame.minX + 125.06, y: frame.minY + 78.09), controlPoint1: CGPoint(x: frame.minX + 119.98, y: frame.minY + 85.25), controlPoint2: CGPoint(x: frame.minX + 122.85, y: frame.minY + 81.8))
            path2Path.addCurve(to: CGPoint(x: frame.minX + 128.37, y: frame.minY + 72.51), controlPoint1: CGPoint(x: frame.minX + 127.26, y: frame.minY + 74.37), controlPoint2: CGPoint(x: frame.minX + 128.37, y: frame.minY + 72.51))
            path2Path.addCurve(to: CGPoint(x: frame.minX + 125.06, y: frame.minY + 66.94), controlPoint1: CGPoint(x: frame.minX + 128.37, y: frame.minY + 72.51), controlPoint2: CGPoint(x: frame.minX + 127.26, y: frame.minY + 70.65))
            path2Path.addCurve(to: CGPoint(x: frame.minX + 116.44, y: frame.minY + 56.58), controlPoint1: CGPoint(x: frame.minX + 122.85, y: frame.minY + 63.22), controlPoint2: CGPoint(x: frame.minX + 119.98, y: frame.minY + 59.77))
            path2Path.addCurve(to: CGPoint(x: frame.minX + 104.7, y: frame.minY + 48.64), controlPoint1: CGPoint(x: frame.minX + 112.91, y: frame.minY + 53.42), controlPoint2: CGPoint(x: frame.minX + 108.99, y: frame.minY + 50.74))
            path2Path.addCurve(to: CGPoint(x: frame.minX + 92.11, y: frame.minY + 44.66), controlPoint1: CGPoint(x: frame.minX + 100.38, y: frame.minY + 46.52), controlPoint2: CGPoint(x: frame.minX + 96.18, y: frame.minY + 45.19))
            path2Path.addCurve(to: CGPoint(x: frame.minX + 82.01, y: frame.minY + 43.87), controlPoint1: CGPoint(x: frame.minX + 88.03, y: frame.minY + 44.13), controlPoint2: CGPoint(x: frame.minX + 84.66, y: frame.minY + 43.87))
            path2Path.addCurve(to: CGPoint(x: frame.minX + 70.08, y: frame.minY + 43.87), controlPoint1: CGPoint(x: frame.minX + 79.36, y: frame.minY + 43.87), controlPoint2: CGPoint(x: frame.minX + 75.38, y: frame.minY + 43.87))
            path2Path.addLine(to: CGPoint(x: frame.minX + 62.13, y: frame.minY + 43.84))
            path2Path.close()
            color10.setFill()
            path2Path.fill()
            strokeColor.setStroke()
            path2Path.lineWidth = 4
            path2Path.miterLimit = 10.43
            path2Path.lineCapStyle = .square
            path2Path.stroke()
            
            
            
            
            //// Rectangle 11 Drawing
            let rectangle11Path = UIBezierPath(rect: CGRect(x: frame.minX + 160, y: frame.minY + 75, width: 4, height: 52))
            UIColor.black.setFill()
            rectangle11Path.fill()
            
            
            //// caption input 0 Drawing
            let captionInput0Rect = CGRect(x: frame.minX + 4, y: frame.minY + 15, width: 26, height: 29)
            let captionInput0TextContent = inputName[inputState[0]]
            let captionInput0Style = NSMutableParagraphStyle()
            captionInput0Style.alignment = .center
            let captionInput0FontAttributes = [
                .font: UIFont.italicSystemFont(ofSize: 30),
                .foregroundColor: textForeground,
                .paragraphStyle: captionInput0Style,
                ] as [NSAttributedStringKey: Any]
            
            let captionInput0TextHeight: CGFloat = captionInput0TextContent.boundingRect(with: CGSize(width: captionInput0Rect.width, height: CGFloat.infinity), options: .usesLineFragmentOrigin, attributes: captionInput0FontAttributes, context: nil).height
            context.saveGState()
            context.clip(to: captionInput0Rect)
            captionInput0TextContent.draw(in: CGRect(x: captionInput0Rect.minX, y: captionInput0Rect.minY + (captionInput0Rect.height - captionInput0TextHeight) / 2, width: captionInput0Rect.width, height: captionInput0TextHeight), withAttributes: captionInput0FontAttributes)
            context.restoreGState()
            
            
            //// Rectangle 10 Drawing
            let rectangle10Path = UIBezierPath(rect: CGRect(x: frame.minX + 160, y: frame.minY + 157, width: 4, height: 52))
            UIColor.black.setFill()
            rectangle10Path.fill()
            
            
            //// Rectangle 12 Drawing
            let rectangle12Path = UIBezierPath(rect: CGRect(x: frame.minX + 281, y: frame.minY + 144, width: 4, height: 52))
            UIColor.black.setFill()
            rectangle12Path.fill()
            
            
            //// Rectangle 20 Drawing
            let rectangle20Path = UIBezierPath(rect: CGRect(x: frame.minX + 281, y: frame.minY + 226, width: 4, height: 52))
            UIColor.black.setFill()
            rectangle20Path.fill()
            
            
            //// Group
            //// Group 5
            //// Group 6
            //// Oval 3 Drawing
            let oval3Path = UIBezierPath(ovalIn: CGRect(x: frame.minX + 129.5, y: frame.minY + 205.5, width: 12, height: 12))
            color10.setFill()
            oval3Path.fill()
            strokeColor.setStroke()
            oval3Path.lineWidth = 4
            oval3Path.stroke()
            
            
            
            
            //// Rectangle 4 Drawing
            let rectangle4Path = UIBezierPath(rect: CGRect(x: frame.minX + 141, y: frame.minY + 209, width: 23, height: 4))
            UIColor.black.setFill()
            rectangle4Path.fill()
            
            
            //// gate 3
            //// path 3 Drawing
            let path3Path = UIBezierPath()
            path3Path.move(to: CGPoint(x: frame.minX + 62.63, y: frame.minY + 182.34))
            path3Path.addLine(to: CGPoint(x: frame.minX + 65.28, y: frame.minY + 189.51))
            path3Path.addCurve(to: CGPoint(x: frame.minX + 68.59, y: frame.minY + 201.46), controlPoint1: CGPoint(x: frame.minX + 67.05, y: frame.minY + 194.29), controlPoint2: CGPoint(x: frame.minX + 68.15, y: frame.minY + 198.27))
            path3Path.addCurve(to: CGPoint(x: frame.minX + 69.23, y: frame.minY + 211.01), controlPoint1: CGPoint(x: frame.minX + 69.03, y: frame.minY + 204.64), controlPoint2: CGPoint(x: frame.minX + 69.23, y: frame.minY + 207.83))
            path3Path.addCurve(to: CGPoint(x: frame.minX + 68.59, y: frame.minY + 220.54), controlPoint1: CGPoint(x: frame.minX + 69.23, y: frame.minY + 214.17), controlPoint2: CGPoint(x: frame.minX + 69.03, y: frame.minY + 217.36))
            path3Path.addCurve(to: CGPoint(x: frame.minX + 65.28, y: frame.minY + 232.49), controlPoint1: CGPoint(x: frame.minX + 68.15, y: frame.minY + 223.73), controlPoint2: CGPoint(x: frame.minX + 67.05, y: frame.minY + 227.71))
            path3Path.addCurve(to: CGPoint(x: frame.minX + 62.63, y: frame.minY + 239.66), controlPoint1: CGPoint(x: frame.minX + 63.51, y: frame.minY + 237.27), controlPoint2: CGPoint(x: frame.minX + 62.63, y: frame.minY + 239.66))
            path3Path.addCurve(to: CGPoint(x: frame.minX + 70.58, y: frame.minY + 239.66), controlPoint1: CGPoint(x: frame.minX + 62.63, y: frame.minY + 239.66), controlPoint2: CGPoint(x: frame.minX + 65.28, y: frame.minY + 239.66))
            path3Path.addCurve(to: CGPoint(x: frame.minX + 82.51, y: frame.minY + 239.66), controlPoint1: CGPoint(x: frame.minX + 75.88, y: frame.minY + 239.66), controlPoint2: CGPoint(x: frame.minX + 79.86, y: frame.minY + 239.66))
            path3Path.addCurve(to: CGPoint(x: frame.minX + 92.61, y: frame.minY + 238.86), controlPoint1: CGPoint(x: frame.minX + 85.14, y: frame.minY + 239.66), controlPoint2: CGPoint(x: frame.minX + 88.51, y: frame.minY + 239.39))
            path3Path.addCurve(to: CGPoint(x: frame.minX + 105.2, y: frame.minY + 234.88), controlPoint1: CGPoint(x: frame.minX + 96.68, y: frame.minY + 238.33), controlPoint2: CGPoint(x: frame.minX + 100.88, y: frame.minY + 237))
            path3Path.addCurve(to: CGPoint(x: frame.minX + 116.94, y: frame.minY + 226.94), controlPoint1: CGPoint(x: frame.minX + 109.49, y: frame.minY + 232.76), controlPoint2: CGPoint(x: frame.minX + 113.41, y: frame.minY + 230.13))
            path3Path.addCurve(to: CGPoint(x: frame.minX + 125.56, y: frame.minY + 216.59), controlPoint1: CGPoint(x: frame.minX + 120.48, y: frame.minY + 223.75), controlPoint2: CGPoint(x: frame.minX + 123.35, y: frame.minY + 220.3))
            path3Path.addCurve(to: CGPoint(x: frame.minX + 128.87, y: frame.minY + 211.01), controlPoint1: CGPoint(x: frame.minX + 127.76, y: frame.minY + 212.87), controlPoint2: CGPoint(x: frame.minX + 128.87, y: frame.minY + 211.01))
            path3Path.addCurve(to: CGPoint(x: frame.minX + 125.56, y: frame.minY + 205.44), controlPoint1: CGPoint(x: frame.minX + 128.87, y: frame.minY + 211.01), controlPoint2: CGPoint(x: frame.minX + 127.76, y: frame.minY + 209.15))
            path3Path.addCurve(to: CGPoint(x: frame.minX + 116.94, y: frame.minY + 195.08), controlPoint1: CGPoint(x: frame.minX + 123.35, y: frame.minY + 201.72), controlPoint2: CGPoint(x: frame.minX + 120.48, y: frame.minY + 198.27))
            path3Path.addCurve(to: CGPoint(x: frame.minX + 105.2, y: frame.minY + 187.14), controlPoint1: CGPoint(x: frame.minX + 113.41, y: frame.minY + 191.92), controlPoint2: CGPoint(x: frame.minX + 109.49, y: frame.minY + 189.24))
            path3Path.addCurve(to: CGPoint(x: frame.minX + 92.61, y: frame.minY + 183.16), controlPoint1: CGPoint(x: frame.minX + 100.88, y: frame.minY + 185.02), controlPoint2: CGPoint(x: frame.minX + 96.68, y: frame.minY + 183.69))
            path3Path.addCurve(to: CGPoint(x: frame.minX + 82.51, y: frame.minY + 182.37), controlPoint1: CGPoint(x: frame.minX + 88.53, y: frame.minY + 182.63), controlPoint2: CGPoint(x: frame.minX + 85.16, y: frame.minY + 182.37))
            path3Path.addCurve(to: CGPoint(x: frame.minX + 70.58, y: frame.minY + 182.37), controlPoint1: CGPoint(x: frame.minX + 79.86, y: frame.minY + 182.37), controlPoint2: CGPoint(x: frame.minX + 75.88, y: frame.minY + 182.37))
            path3Path.addLine(to: CGPoint(x: frame.minX + 62.63, y: frame.minY + 182.34))
            path3Path.close()
            color10.setFill()
            path3Path.fill()
            strokeColor.setStroke()
            path3Path.lineWidth = 4
            path3Path.miterLimit = 10.43
            path3Path.lineCapStyle = .square
            path3Path.stroke()
            
            
            
            
            
            
            //// Rectangle 8 Drawing
            let rectangle8Path = UIBezierPath(rect: CGRect(x: frame.minX + 39, y: frame.minY + 196, width: 28, height: 4))
            UIColor.black.setFill()
            rectangle8Path.fill()
            
            
            //// Rectangle 9 Drawing
            let rectangle9Path = UIBezierPath(rect: CGRect(x: frame.minX + 39, y: frame.minY + 222, width: 28, height: 4))
            UIColor.black.setFill()
            rectangle9Path.fill()
            
            
            
            
            //// Group 7
            //// Group 11
            //// Group 12
            //// Oval 6 Drawing
            let oval6Path = UIBezierPath(ovalIn: CGRect(x: frame.minX + 250.5, y: frame.minY + 136.5, width: 12, height: 12))
            color10.setFill()
            oval6Path.fill()
            strokeColor.setStroke()
            oval6Path.lineWidth = 4
            oval6Path.stroke()
            
            
            
            
            //// Rectangle 16 Drawing
            let rectangle16Path = UIBezierPath(rect: CGRect(x: frame.minX + 262, y: frame.minY + 140, width: 23, height: 4))
            UIColor.black.setFill()
            rectangle16Path.fill()
            
            
            //// gate 4
            //// path 6 Drawing
            let path6Path = UIBezierPath()
            path6Path.move(to: CGPoint(x: frame.minX + 183.63, y: frame.minY + 113.34))
            path6Path.addLine(to: CGPoint(x: frame.minX + 186.28, y: frame.minY + 120.51))
            path6Path.addCurve(to: CGPoint(x: frame.minX + 189.59, y: frame.minY + 132.46), controlPoint1: CGPoint(x: frame.minX + 188.05, y: frame.minY + 125.29), controlPoint2: CGPoint(x: frame.minX + 189.15, y: frame.minY + 129.27))
            path6Path.addCurve(to: CGPoint(x: frame.minX + 190.23, y: frame.minY + 142.01), controlPoint1: CGPoint(x: frame.minX + 190.03, y: frame.minY + 135.64), controlPoint2: CGPoint(x: frame.minX + 190.23, y: frame.minY + 138.83))
            path6Path.addCurve(to: CGPoint(x: frame.minX + 189.59, y: frame.minY + 151.54), controlPoint1: CGPoint(x: frame.minX + 190.23, y: frame.minY + 145.17), controlPoint2: CGPoint(x: frame.minX + 190.03, y: frame.minY + 148.36))
            path6Path.addCurve(to: CGPoint(x: frame.minX + 186.28, y: frame.minY + 163.49), controlPoint1: CGPoint(x: frame.minX + 189.15, y: frame.minY + 154.73), controlPoint2: CGPoint(x: frame.minX + 188.05, y: frame.minY + 158.71))
            path6Path.addCurve(to: CGPoint(x: frame.minX + 183.63, y: frame.minY + 170.66), controlPoint1: CGPoint(x: frame.minX + 184.51, y: frame.minY + 168.27), controlPoint2: CGPoint(x: frame.minX + 183.63, y: frame.minY + 170.66))
            path6Path.addCurve(to: CGPoint(x: frame.minX + 191.58, y: frame.minY + 170.66), controlPoint1: CGPoint(x: frame.minX + 183.63, y: frame.minY + 170.66), controlPoint2: CGPoint(x: frame.minX + 186.28, y: frame.minY + 170.66))
            path6Path.addCurve(to: CGPoint(x: frame.minX + 203.51, y: frame.minY + 170.66), controlPoint1: CGPoint(x: frame.minX + 196.88, y: frame.minY + 170.66), controlPoint2: CGPoint(x: frame.minX + 200.86, y: frame.minY + 170.66))
            path6Path.addCurve(to: CGPoint(x: frame.minX + 213.61, y: frame.minY + 169.86), controlPoint1: CGPoint(x: frame.minX + 206.14, y: frame.minY + 170.66), controlPoint2: CGPoint(x: frame.minX + 209.51, y: frame.minY + 170.39))
            path6Path.addCurve(to: CGPoint(x: frame.minX + 226.2, y: frame.minY + 165.88), controlPoint1: CGPoint(x: frame.minX + 217.68, y: frame.minY + 169.33), controlPoint2: CGPoint(x: frame.minX + 221.88, y: frame.minY + 168))
            path6Path.addCurve(to: CGPoint(x: frame.minX + 237.94, y: frame.minY + 157.94), controlPoint1: CGPoint(x: frame.minX + 230.49, y: frame.minY + 163.76), controlPoint2: CGPoint(x: frame.minX + 234.41, y: frame.minY + 161.13))
            path6Path.addCurve(to: CGPoint(x: frame.minX + 246.56, y: frame.minY + 147.59), controlPoint1: CGPoint(x: frame.minX + 241.48, y: frame.minY + 154.75), controlPoint2: CGPoint(x: frame.minX + 244.35, y: frame.minY + 151.3))
            path6Path.addCurve(to: CGPoint(x: frame.minX + 249.87, y: frame.minY + 142.01), controlPoint1: CGPoint(x: frame.minX + 248.76, y: frame.minY + 143.87), controlPoint2: CGPoint(x: frame.minX + 249.87, y: frame.minY + 142.01))
            path6Path.addCurve(to: CGPoint(x: frame.minX + 246.56, y: frame.minY + 136.44), controlPoint1: CGPoint(x: frame.minX + 249.87, y: frame.minY + 142.01), controlPoint2: CGPoint(x: frame.minX + 248.76, y: frame.minY + 140.15))
            path6Path.addCurve(to: CGPoint(x: frame.minX + 237.94, y: frame.minY + 126.08), controlPoint1: CGPoint(x: frame.minX + 244.35, y: frame.minY + 132.72), controlPoint2: CGPoint(x: frame.minX + 241.48, y: frame.minY + 129.27))
            path6Path.addCurve(to: CGPoint(x: frame.minX + 226.2, y: frame.minY + 118.14), controlPoint1: CGPoint(x: frame.minX + 234.41, y: frame.minY + 122.92), controlPoint2: CGPoint(x: frame.minX + 230.49, y: frame.minY + 120.24))
            path6Path.addCurve(to: CGPoint(x: frame.minX + 213.61, y: frame.minY + 114.16), controlPoint1: CGPoint(x: frame.minX + 221.88, y: frame.minY + 116.02), controlPoint2: CGPoint(x: frame.minX + 217.68, y: frame.minY + 114.69))
            path6Path.addCurve(to: CGPoint(x: frame.minX + 203.51, y: frame.minY + 113.37), controlPoint1: CGPoint(x: frame.minX + 209.53, y: frame.minY + 113.63), controlPoint2: CGPoint(x: frame.minX + 206.16, y: frame.minY + 113.37))
            path6Path.addCurve(to: CGPoint(x: frame.minX + 191.58, y: frame.minY + 113.37), controlPoint1: CGPoint(x: frame.minX + 200.86, y: frame.minY + 113.37), controlPoint2: CGPoint(x: frame.minX + 196.88, y: frame.minY + 113.37))
            path6Path.addLine(to: CGPoint(x: frame.minX + 183.63, y: frame.minY + 113.34))
            path6Path.close()
            color10.setFill()
            path6Path.fill()
            strokeColor.setStroke()
            path6Path.lineWidth = 4
            path6Path.miterLimit = 10.43
            path6Path.lineCapStyle = .square
            path6Path.stroke()
            
            
            
            
            
            
            //// Rectangle 21 Drawing
            let rectangle21Path = UIBezierPath(rect: CGRect(x: frame.minX + 160, y: frame.minY + 127, width: 28, height: 4))
            UIColor.black.setFill()
            rectangle21Path.fill()
            
            
            //// Rectangle 22 Drawing
            let rectangle22Path = UIBezierPath(rect: CGRect(x: frame.minX + 160, y: frame.minY + 153, width: 28, height: 4))
            UIColor.black.setFill()
            rectangle22Path.fill()
            
            
            
            
            //// Group 3
            //// Group 4
            //// Group 8
            //// Oval 2 Drawing
            let oval2Path = UIBezierPath(ovalIn: CGRect(x: frame.minX + 371.5, y: frame.minY + 205.5, width: 12, height: 12))
            color10.setFill()
            oval2Path.fill()
            strokeColor.setStroke()
            oval2Path.lineWidth = 4
            oval2Path.stroke()
            
            
            
            
            //// Rectangle Drawing
            let rectanglePath = UIBezierPath(rect: CGRect(x: frame.minX + 383, y: frame.minY + 209, width: 23, height: 4))
            UIColor.black.setFill()
            rectanglePath.fill()
            
            
            //// gate
            //// path Drawing
            let pathPath = UIBezierPath()
            pathPath.move(to: CGPoint(x: frame.minX + 304.63, y: frame.minY + 182.34))
            pathPath.addLine(to: CGPoint(x: frame.minX + 307.28, y: frame.minY + 189.51))
            pathPath.addCurve(to: CGPoint(x: frame.minX + 310.59, y: frame.minY + 201.46), controlPoint1: CGPoint(x: frame.minX + 309.05, y: frame.minY + 194.29), controlPoint2: CGPoint(x: frame.minX + 310.15, y: frame.minY + 198.27))
            pathPath.addCurve(to: CGPoint(x: frame.minX + 311.23, y: frame.minY + 211.01), controlPoint1: CGPoint(x: frame.minX + 311.03, y: frame.minY + 204.64), controlPoint2: CGPoint(x: frame.minX + 311.23, y: frame.minY + 207.83))
            pathPath.addCurve(to: CGPoint(x: frame.minX + 310.59, y: frame.minY + 220.54), controlPoint1: CGPoint(x: frame.minX + 311.23, y: frame.minY + 214.17), controlPoint2: CGPoint(x: frame.minX + 311.03, y: frame.minY + 217.36))
            pathPath.addCurve(to: CGPoint(x: frame.minX + 307.28, y: frame.minY + 232.49), controlPoint1: CGPoint(x: frame.minX + 310.15, y: frame.minY + 223.73), controlPoint2: CGPoint(x: frame.minX + 309.05, y: frame.minY + 227.71))
            pathPath.addCurve(to: CGPoint(x: frame.minX + 304.63, y: frame.minY + 239.66), controlPoint1: CGPoint(x: frame.minX + 305.51, y: frame.minY + 237.27), controlPoint2: CGPoint(x: frame.minX + 304.63, y: frame.minY + 239.66))
            pathPath.addCurve(to: CGPoint(x: frame.minX + 312.58, y: frame.minY + 239.66), controlPoint1: CGPoint(x: frame.minX + 304.63, y: frame.minY + 239.66), controlPoint2: CGPoint(x: frame.minX + 307.28, y: frame.minY + 239.66))
            pathPath.addCurve(to: CGPoint(x: frame.minX + 324.51, y: frame.minY + 239.66), controlPoint1: CGPoint(x: frame.minX + 317.88, y: frame.minY + 239.66), controlPoint2: CGPoint(x: frame.minX + 321.86, y: frame.minY + 239.66))
            pathPath.addCurve(to: CGPoint(x: frame.minX + 334.61, y: frame.minY + 238.86), controlPoint1: CGPoint(x: frame.minX + 327.14, y: frame.minY + 239.66), controlPoint2: CGPoint(x: frame.minX + 330.51, y: frame.minY + 239.39))
            pathPath.addCurve(to: CGPoint(x: frame.minX + 347.2, y: frame.minY + 234.88), controlPoint1: CGPoint(x: frame.minX + 338.68, y: frame.minY + 238.33), controlPoint2: CGPoint(x: frame.minX + 342.88, y: frame.minY + 237))
            pathPath.addCurve(to: CGPoint(x: frame.minX + 358.94, y: frame.minY + 226.94), controlPoint1: CGPoint(x: frame.minX + 351.49, y: frame.minY + 232.76), controlPoint2: CGPoint(x: frame.minX + 355.41, y: frame.minY + 230.13))
            pathPath.addCurve(to: CGPoint(x: frame.minX + 367.56, y: frame.minY + 216.59), controlPoint1: CGPoint(x: frame.minX + 362.48, y: frame.minY + 223.75), controlPoint2: CGPoint(x: frame.minX + 365.35, y: frame.minY + 220.3))
            pathPath.addCurve(to: CGPoint(x: frame.minX + 370.87, y: frame.minY + 211.01), controlPoint1: CGPoint(x: frame.minX + 369.76, y: frame.minY + 212.87), controlPoint2: CGPoint(x: frame.minX + 370.87, y: frame.minY + 211.01))
            pathPath.addCurve(to: CGPoint(x: frame.minX + 367.56, y: frame.minY + 205.44), controlPoint1: CGPoint(x: frame.minX + 370.87, y: frame.minY + 211.01), controlPoint2: CGPoint(x: frame.minX + 369.76, y: frame.minY + 209.15))
            pathPath.addCurve(to: CGPoint(x: frame.minX + 358.94, y: frame.minY + 195.08), controlPoint1: CGPoint(x: frame.minX + 365.35, y: frame.minY + 201.72), controlPoint2: CGPoint(x: frame.minX + 362.48, y: frame.minY + 198.27))
            pathPath.addCurve(to: CGPoint(x: frame.minX + 347.2, y: frame.minY + 187.14), controlPoint1: CGPoint(x: frame.minX + 355.41, y: frame.minY + 191.92), controlPoint2: CGPoint(x: frame.minX + 351.49, y: frame.minY + 189.24))
            pathPath.addCurve(to: CGPoint(x: frame.minX + 334.61, y: frame.minY + 183.16), controlPoint1: CGPoint(x: frame.minX + 342.88, y: frame.minY + 185.02), controlPoint2: CGPoint(x: frame.minX + 338.68, y: frame.minY + 183.69))
            pathPath.addCurve(to: CGPoint(x: frame.minX + 324.51, y: frame.minY + 182.37), controlPoint1: CGPoint(x: frame.minX + 330.53, y: frame.minY + 182.63), controlPoint2: CGPoint(x: frame.minX + 327.16, y: frame.minY + 182.37))
            pathPath.addCurve(to: CGPoint(x: frame.minX + 312.58, y: frame.minY + 182.37), controlPoint1: CGPoint(x: frame.minX + 321.86, y: frame.minY + 182.37), controlPoint2: CGPoint(x: frame.minX + 317.88, y: frame.minY + 182.37))
            pathPath.addLine(to: CGPoint(x: frame.minX + 304.63, y: frame.minY + 182.34))
            pathPath.close()
            color10.setFill()
            pathPath.fill()
            strokeColor.setStroke()
            pathPath.lineWidth = 4
            pathPath.miterLimit = 10.43
            pathPath.lineCapStyle = .square
            pathPath.stroke()
            
            
            
            
            
            
            //// Rectangle 2 Drawing
            let rectangle2Path = UIBezierPath(rect: CGRect(x: frame.minX + 281, y: frame.minY + 196, width: 28, height: 4))
            UIColor.black.setFill()
            rectangle2Path.fill()
            
            
            //// Rectangle 3 Drawing
            let rectangle3Path = UIBezierPath(rect: CGRect(x: frame.minX + 281, y: frame.minY + 222, width: 28, height: 4))
            UIColor.black.setFill()
            rectangle3Path.fill()
            
            
            
            
            //// Group 9
            //// Group 10
            //// Group 13
            //// Oval 4 Drawing
            let oval4Path = UIBezierPath(ovalIn: CGRect(x: frame.minX + 250.5, y: frame.minY + 274.5, width: 12, height: 12))
            color10.setFill()
            oval4Path.fill()
            strokeColor.setStroke()
            oval4Path.lineWidth = 4
            oval4Path.stroke()
            
            
            
            
            //// Rectangle 13 Drawing
            let rectangle13Path = UIBezierPath(rect: CGRect(x: frame.minX + 262, y: frame.minY + 278, width: 23, height: 4))
            UIColor.black.setFill()
            rectangle13Path.fill()
            
            
            //// gate 5
            //// path 4 Drawing
            let path4Path = UIBezierPath()
            path4Path.move(to: CGPoint(x: frame.minX + 183.63, y: frame.minY + 251.34))
            path4Path.addLine(to: CGPoint(x: frame.minX + 186.28, y: frame.minY + 258.51))
            path4Path.addCurve(to: CGPoint(x: frame.minX + 189.59, y: frame.minY + 270.46), controlPoint1: CGPoint(x: frame.minX + 188.05, y: frame.minY + 263.29), controlPoint2: CGPoint(x: frame.minX + 189.15, y: frame.minY + 267.27))
            path4Path.addCurve(to: CGPoint(x: frame.minX + 190.23, y: frame.minY + 280.01), controlPoint1: CGPoint(x: frame.minX + 190.03, y: frame.minY + 273.64), controlPoint2: CGPoint(x: frame.minX + 190.23, y: frame.minY + 276.83))
            path4Path.addCurve(to: CGPoint(x: frame.minX + 189.59, y: frame.minY + 289.54), controlPoint1: CGPoint(x: frame.minX + 190.23, y: frame.minY + 283.17), controlPoint2: CGPoint(x: frame.minX + 190.03, y: frame.minY + 286.36))
            path4Path.addCurve(to: CGPoint(x: frame.minX + 186.28, y: frame.minY + 301.49), controlPoint1: CGPoint(x: frame.minX + 189.15, y: frame.minY + 292.73), controlPoint2: CGPoint(x: frame.minX + 188.05, y: frame.minY + 296.71))
            path4Path.addCurve(to: CGPoint(x: frame.minX + 183.63, y: frame.minY + 308.66), controlPoint1: CGPoint(x: frame.minX + 184.51, y: frame.minY + 306.27), controlPoint2: CGPoint(x: frame.minX + 183.63, y: frame.minY + 308.66))
            path4Path.addCurve(to: CGPoint(x: frame.minX + 191.58, y: frame.minY + 308.66), controlPoint1: CGPoint(x: frame.minX + 183.63, y: frame.minY + 308.66), controlPoint2: CGPoint(x: frame.minX + 186.28, y: frame.minY + 308.66))
            path4Path.addCurve(to: CGPoint(x: frame.minX + 203.51, y: frame.minY + 308.66), controlPoint1: CGPoint(x: frame.minX + 196.88, y: frame.minY + 308.66), controlPoint2: CGPoint(x: frame.minX + 200.86, y: frame.minY + 308.66))
            path4Path.addCurve(to: CGPoint(x: frame.minX + 213.61, y: frame.minY + 307.86), controlPoint1: CGPoint(x: frame.minX + 206.14, y: frame.minY + 308.66), controlPoint2: CGPoint(x: frame.minX + 209.51, y: frame.minY + 308.39))
            path4Path.addCurve(to: CGPoint(x: frame.minX + 226.2, y: frame.minY + 303.88), controlPoint1: CGPoint(x: frame.minX + 217.68, y: frame.minY + 307.33), controlPoint2: CGPoint(x: frame.minX + 221.88, y: frame.minY + 306))
            path4Path.addCurve(to: CGPoint(x: frame.minX + 237.94, y: frame.minY + 295.94), controlPoint1: CGPoint(x: frame.minX + 230.49, y: frame.minY + 301.76), controlPoint2: CGPoint(x: frame.minX + 234.41, y: frame.minY + 299.13))
            path4Path.addCurve(to: CGPoint(x: frame.minX + 246.56, y: frame.minY + 285.59), controlPoint1: CGPoint(x: frame.minX + 241.48, y: frame.minY + 292.75), controlPoint2: CGPoint(x: frame.minX + 244.35, y: frame.minY + 289.3))
            path4Path.addCurve(to: CGPoint(x: frame.minX + 249.87, y: frame.minY + 280.01), controlPoint1: CGPoint(x: frame.minX + 248.76, y: frame.minY + 281.87), controlPoint2: CGPoint(x: frame.minX + 249.87, y: frame.minY + 280.01))
            path4Path.addCurve(to: CGPoint(x: frame.minX + 246.56, y: frame.minY + 274.44), controlPoint1: CGPoint(x: frame.minX + 249.87, y: frame.minY + 280.01), controlPoint2: CGPoint(x: frame.minX + 248.76, y: frame.minY + 278.15))
            path4Path.addCurve(to: CGPoint(x: frame.minX + 237.94, y: frame.minY + 264.08), controlPoint1: CGPoint(x: frame.minX + 244.35, y: frame.minY + 270.72), controlPoint2: CGPoint(x: frame.minX + 241.48, y: frame.minY + 267.27))
            path4Path.addCurve(to: CGPoint(x: frame.minX + 226.2, y: frame.minY + 256.14), controlPoint1: CGPoint(x: frame.minX + 234.41, y: frame.minY + 260.92), controlPoint2: CGPoint(x: frame.minX + 230.49, y: frame.minY + 258.24))
            path4Path.addCurve(to: CGPoint(x: frame.minX + 213.61, y: frame.minY + 252.16), controlPoint1: CGPoint(x: frame.minX + 221.88, y: frame.minY + 254.02), controlPoint2: CGPoint(x: frame.minX + 217.68, y: frame.minY + 252.69))
            path4Path.addCurve(to: CGPoint(x: frame.minX + 203.51, y: frame.minY + 251.37), controlPoint1: CGPoint(x: frame.minX + 209.53, y: frame.minY + 251.63), controlPoint2: CGPoint(x: frame.minX + 206.16, y: frame.minY + 251.37))
            path4Path.addCurve(to: CGPoint(x: frame.minX + 191.58, y: frame.minY + 251.37), controlPoint1: CGPoint(x: frame.minX + 200.86, y: frame.minY + 251.37), controlPoint2: CGPoint(x: frame.minX + 196.88, y: frame.minY + 251.37))
            path4Path.addLine(to: CGPoint(x: frame.minX + 183.63, y: frame.minY + 251.34))
            path4Path.close()
            color10.setFill()
            path4Path.fill()
            strokeColor.setStroke()
            path4Path.lineWidth = 4
            path4Path.miterLimit = 10.43
            path4Path.lineCapStyle = .square
            path4Path.stroke()
            
            
            
            
            
            
            //// Rectangle 14 Drawing
            let rectangle14Path = UIBezierPath(rect: CGRect(x: frame.minX + 160, y: frame.minY + 265, width: 28, height: 4))
            UIColor.black.setFill()
            rectangle14Path.fill()
            
            
            //// Rectangle 15 Drawing
            let rectangle15Path = UIBezierPath(rect: CGRect(x: frame.minX + 160, y: frame.minY + 291, width: 28, height: 4))
            UIColor.black.setFill()
            rectangle15Path.fill()
            
            
            
            
            //// caption input 1 Drawing
            let captionInput1Rect = CGRect(x: frame.minX + 4, y: frame.minY + 101, width: 26, height: 29)
            let captionInput1TextContent = inputName[inputState[1]]
            let captionInput1Style = NSMutableParagraphStyle()
            captionInput1Style.alignment = .center
            let captionInput1FontAttributes = [
                .font: UIFont.italicSystemFont(ofSize: 30),
                .foregroundColor: textForeground,
                .paragraphStyle: captionInput1Style,
                ] as [NSAttributedStringKey: Any]
            
            let captionInput1TextHeight: CGFloat = captionInput1TextContent.boundingRect(with: CGSize(width: captionInput1Rect.width, height: CGFloat.infinity), options: .usesLineFragmentOrigin, attributes: captionInput1FontAttributes, context: nil).height
            context.saveGState()
            context.clip(to: captionInput1Rect)
            captionInput1TextContent.draw(in: CGRect(x: captionInput1Rect.minX, y: captionInput1Rect.minY + (captionInput1Rect.height - captionInput1TextHeight) / 2, width: captionInput1Rect.width, height: captionInput1TextHeight), withAttributes: captionInput1FontAttributes)
            context.restoreGState()
            
            
            //// caption z Drawing
            let captionZRect = CGRect(x: frame.minX + 405, y: frame.minY + 196, width: 26, height: 29)
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
            
            
            //// caption input 2 Drawing
            let captionInput2Rect = CGRect(x: frame.minX + 4, y: frame.minY + 153, width: 26, height: 29)
            let captionInput2TextContent = inputName[inputState[2]]
            let captionInput2Style = NSMutableParagraphStyle()
            captionInput2Style.alignment = .center
            let captionInput2FontAttributes = [
                .font: UIFont.italicSystemFont(ofSize: 30),
                .foregroundColor: textForeground,
                .paragraphStyle: captionInput2Style,
                ] as [NSAttributedStringKey: Any]
            
            let captionInput2TextHeight: CGFloat = captionInput2TextContent.boundingRect(with: CGSize(width: captionInput2Rect.width, height: CGFloat.infinity), options: .usesLineFragmentOrigin, attributes: captionInput2FontAttributes, context: nil).height
            context.saveGState()
            context.clip(to: captionInput2Rect)
            captionInput2TextContent.draw(in: CGRect(x: captionInput2Rect.minX, y: captionInput2Rect.minY + (captionInput2Rect.height - captionInput2TextHeight) / 2, width: captionInput2Rect.width, height: captionInput2TextHeight), withAttributes: captionInput2FontAttributes)
            context.restoreGState()
            
            
            //// caption input 3 Drawing
            let captionInput3Rect = CGRect(x: frame.minX + 4, y: frame.minY + 239, width: 26, height: 29)
            let captionInput3TextContent = inputName[inputState[3]]
            let captionInput3Style = NSMutableParagraphStyle()
            captionInput3Style.alignment = .center
            let captionInput3FontAttributes = [
                .font: UIFont.italicSystemFont(ofSize: 30),
                .foregroundColor: textForeground,
                .paragraphStyle: captionInput3Style,
                ] as [NSAttributedStringKey: Any]
            
            let captionInput3TextHeight: CGFloat = captionInput3TextContent.boundingRect(with: CGSize(width: captionInput3Rect.width, height: CGFloat.infinity), options: .usesLineFragmentOrigin, attributes: captionInput3FontAttributes, context: nil).height
            context.saveGState()
            context.clip(to: captionInput3Rect)
            captionInput3TextContent.draw(in: CGRect(x: captionInput3Rect.minX, y: captionInput3Rect.minY + (captionInput3Rect.height - captionInput3TextHeight) / 2, width: captionInput3Rect.width, height: captionInput3TextHeight), withAttributes: captionInput3FontAttributes)
            context.restoreGState()
            
            
            //// caption input 4 Drawing
            let captionInput4Rect = CGRect(x: frame.minX + 134, y: frame.minY + 220, width: 26, height: 29)
            let captionInput4TextContent = inputName[inputState[4]]
            let captionInput4Style = NSMutableParagraphStyle()
            captionInput4Style.alignment = .center
            let captionInput4FontAttributes = [
                .font: UIFont.italicSystemFont(ofSize: 30),
                .foregroundColor: textForeground,
                .paragraphStyle: captionInput4Style,
                ] as [NSAttributedStringKey: Any]
            
            let captionInput4TextHeight: CGFloat = captionInput4TextContent.boundingRect(with: CGSize(width: captionInput4Rect.width, height: CGFloat.infinity), options: .usesLineFragmentOrigin, attributes: captionInput4FontAttributes, context: nil).height
            context.saveGState()
            context.clip(to: captionInput4Rect)
            captionInput4TextContent.draw(in: CGRect(x: captionInput4Rect.minX, y: captionInput4Rect.minY + (captionInput4Rect.height - captionInput4TextHeight) / 2, width: captionInput4Rect.width, height: captionInput4TextHeight), withAttributes: captionInput4FontAttributes)
            context.restoreGState()
            
            
            //// caption input 5 Drawing
            let captionInput5Rect = CGRect(x: frame.minX + 134, y: frame.minY + 315, width: 26, height: 29)
            let captionInput5TextContent = inputName[inputState[5]]
            let captionInput5Style = NSMutableParagraphStyle()
            captionInput5Style.alignment = .center
            let captionInput5FontAttributes = [
                .font: UIFont.italicSystemFont(ofSize: 30),
                .foregroundColor: textForeground,
                .paragraphStyle: captionInput5Style,
                ] as [NSAttributedStringKey: Any]
            
            let captionInput5TextHeight: CGFloat = captionInput5TextContent.boundingRect(with: CGSize(width: captionInput5Rect.width, height: CGFloat.infinity), options: .usesLineFragmentOrigin, attributes: captionInput5FontAttributes, context: nil).height
            context.saveGState()
            context.clip(to: captionInput5Rect)
            captionInput5TextContent.draw(in: CGRect(x: captionInput5Rect.minX, y: captionInput5Rect.minY + (captionInput5Rect.height - captionInput5TextHeight) / 2, width: captionInput5Rect.width, height: captionInput5TextHeight), withAttributes: captionInput5FontAttributes)
            context.restoreGState()
            
            
            //// caption c Drawing
            let captionCRect = CGRect(x: frame.minX + 164, y: frame.minY + 72, width: 26, height: 29)
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
            let captionDRect = CGRect(x: frame.minX + 164, y: frame.minY + 184, width: 26, height: 29)
            let captionDTextContent = "D"
            let captionDStyle = NSMutableParagraphStyle()
            captionDStyle.alignment = .center
            let captionDFontAttributes = [
                .font: UIFont.italicSystemFont(ofSize: 30),
                .foregroundColor: textForeground,
                .paragraphStyle: captionDStyle,
                ] as [NSAttributedStringKey: Any]
            
            let captionDTextHeight: CGFloat = captionDTextContent.boundingRect(with: CGSize(width: captionDRect.width, height: CGFloat.infinity), options: .usesLineFragmentOrigin, attributes: captionDFontAttributes, context: nil).height
            context.saveGState()
            context.clip(to: captionDRect)
            captionDTextContent.draw(in: CGRect(x: captionDRect.minX, y: captionDRect.minY + (captionDRect.height - captionDTextHeight) / 2, width: captionDRect.width, height: captionDTextHeight), withAttributes: captionDFontAttributes)
            context.restoreGState()
            
            
            //// caption x Drawing
            let captionXRect = CGRect(x: frame.minX + 285, y: frame.minY + 140, width: 26, height: 29)
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
            let captionYRect = CGRect(x: frame.minX + 285, y: frame.minY + 253, width: 26, height: 29)
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
        }

}











