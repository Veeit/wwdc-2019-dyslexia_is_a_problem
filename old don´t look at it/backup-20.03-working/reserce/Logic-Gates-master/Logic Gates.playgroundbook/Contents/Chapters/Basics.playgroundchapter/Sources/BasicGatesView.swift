import PlaygroundSupport
import UIKit
import Foundation
import CoreGraphics

public class BasicGatesView: UIView{
    public var varState = [Int]()
    public override func draw(_ rect: CGRect){
        drawBasicGates(frame: rect)
    }
    public func redraw() {
        setNeedsDisplay()
    }
    //The drawing codes are created with the aid of PaintCode
    func drawBasicGates(frame: CGRect = CGRect(x: 0, y: 0, width: 400, height: 500)) {
        //// General Declarations
        let context = UIGraphicsGetCurrentContext()!
        
        //// Color Declarations
        let strokeColor = UIColor(red: 0.000, green: 0.000, blue: 0.000, alpha: 1.000)
        let fillColor3 = UIColor(red: 1.000, green: 0.584, blue: 0.207, alpha: 1.000)
        let fillColor4 = UIColor(red: 0.000, green: 0.000, blue: 0.000, alpha: 1.000)
        let color2 = UIColor(red: 0.846, green: 0.986, blue: 0.260, alpha: 1.000)
        let color4 = UIColor(red: 0.994, green: 0.818, blue: 0.173, alpha: 1.000)
        
        //// ANDGateGroup
        //// and gate
        //// Bezier Drawing
        let bezierPath = UIBezierPath()
        bezierPath.move(to: CGPoint(x: frame.minX + 204.54, y: frame.minY + 45))
        bezierPath.addCurve(to: CGPoint(x: frame.minX + 245.6, y: frame.minY + 88), controlPoint1: CGPoint(x: frame.minX + 227.43, y: frame.minY + 46.3), controlPoint2: CGPoint(x: frame.minX + 245.6, y: frame.minY + 65.05))
        bezierPath.addCurve(to: CGPoint(x: frame.minX + 204.54, y: frame.minY + 130.94), controlPoint1: CGPoint(x: frame.minX + 245.6, y: frame.minY + 110.95), controlPoint2: CGPoint(x: frame.minX + 227.43, y: frame.minY + 129.7))
        bezierPath.addLine(to: CGPoint(x: frame.minX + 158.65, y: frame.minY + 131))
        bezierPath.addCurve(to: CGPoint(x: frame.minX + 158.65, y: frame.minY + 88), controlPoint1: CGPoint(x: frame.minX + 158.65, y: frame.minY + 131), controlPoint2: CGPoint(x: frame.minX + 158.65, y: frame.minY + 109.5))
        bezierPath.addCurve(to: CGPoint(x: frame.minX + 158.65, y: frame.minY + 45), controlPoint1: CGPoint(x: frame.minX + 158.65, y: frame.minY + 66.5), controlPoint2: CGPoint(x: frame.minX + 158.65, y: frame.minY + 45))
        bezierPath.addLine(to: CGPoint(x: frame.minX + 204.54, y: frame.minY + 45))
        bezierPath.addLine(to: CGPoint(x: frame.minX + 204.54, y: frame.minY + 45))
        bezierPath.close()
        fillColor3.setFill()
        bezierPath.fill()
        UIColor.black.setStroke()
        bezierPath.lineWidth = 4
        bezierPath.stroke()
        
        
        //// input line 1_1 Drawing
        let inputLine1_1Path = UIBezierPath(rect: CGRect(x: frame.minX + 120, y: frame.minY + 62, width: 39, height: 4))
        UIColor.black.setFill()
        inputLine1_1Path.fill()
        
        
        //// output line 1 Drawing
        let outputLine1Path = UIBezierPath(rect: CGRect(x: frame.minX + 246, y: frame.minY + 86, width: 36, height: 4))
        UIColor.black.setFill()
        outputLine1Path.fill()
        
        
        //// input line 1_2 Drawing
        let inputLine1_2Path = UIBezierPath(rect: CGRect(x: frame.minX + 120, y: frame.minY + 110, width: 39, height: 4))
        UIColor.black.setFill()
        inputLine1_2Path.fill()
        
        
        //// gate caption 1 Drawing
        let gateCaption1Rect = CGRect(x: frame.minX + 161, y: frame.minY + 145, width: 83, height: 22)
        let gateCaption1TextContent = "AND Gate"
        let gateCaption1Style = NSMutableParagraphStyle()
        gateCaption1Style.alignment = .center
        let gateCaption1FontAttributes = [
            .font: UIFont.systemFont(ofSize: UIFont.labelFontSize, weight: .bold),
            .foregroundColor: UIColor.black,
            .paragraphStyle: gateCaption1Style,
            ] as [NSAttributedStringKey: Any]
        
        let gateCaption1TextHeight: CGFloat = gateCaption1TextContent.boundingRect(with: CGSize(width: gateCaption1Rect.width, height: CGFloat.infinity), options: .usesLineFragmentOrigin, attributes: gateCaption1FontAttributes, context: nil).height
        context.saveGState()
        context.clip(to: gateCaption1Rect)
        gateCaption1TextContent.draw(in: CGRect(x: gateCaption1Rect.minX, y: gateCaption1Rect.minY + (gateCaption1Rect.height - gateCaption1TextHeight) / 2, width: gateCaption1Rect.width, height: gateCaption1TextHeight), withAttributes: gateCaption1FontAttributes)
        context.restoreGState()
        
        
        
        
        //// input symbol 1_1 Drawing
        let inputSymbol1_1Rect = CGRect(x: frame.minX + 38, y: frame.minY + 42, width: 41, height: 43)
        let inputSymbol1_1TextContent = "🖋"
        let inputSymbol1_1Style = NSMutableParagraphStyle()
        inputSymbol1_1Style.alignment = .left
        let inputSymbol1_1FontAttributes = [
            .font: UIFont.systemFont(ofSize: 30),
            .foregroundColor: UIColor.black,
            .paragraphStyle: inputSymbol1_1Style,
            ] as [NSAttributedStringKey: Any]
        
        let inputSymbol1_1TextHeight: CGFloat = inputSymbol1_1TextContent.boundingRect(with: CGSize(width: inputSymbol1_1Rect.width, height: CGFloat.infinity), options: .usesLineFragmentOrigin, attributes: inputSymbol1_1FontAttributes, context: nil).height
        context.saveGState()
        context.clip(to: inputSymbol1_1Rect)
        inputSymbol1_1TextContent.draw(in: CGRect(x: inputSymbol1_1Rect.minX, y: inputSymbol1_1Rect.minY + (inputSymbol1_1Rect.height - inputSymbol1_1TextHeight) / 2, width: inputSymbol1_1Rect.width, height: inputSymbol1_1TextHeight), withAttributes: inputSymbol1_1FontAttributes)
        context.restoreGState()
        
        
        //// input symbol 1_2 Drawing
        let inputSymbol1_2Rect = CGRect(x: frame.minX + 38, y: frame.minY + 90, width: 41, height: 43)
        let inputSymbol1_2TextContent = "📄"
        let inputSymbol1_2Style = NSMutableParagraphStyle()
        inputSymbol1_2Style.alignment = .left
        let inputSymbol1_2FontAttributes = [
            .font: UIFont.systemFont(ofSize: 30),
            .foregroundColor: UIColor.black,
            .paragraphStyle: inputSymbol1_2Style,
            ] as [NSAttributedStringKey: Any]
        
        let inputSymbol1_2TextHeight: CGFloat = inputSymbol1_2TextContent.boundingRect(with: CGSize(width: inputSymbol1_2Rect.width, height: CGFloat.infinity), options: .usesLineFragmentOrigin, attributes: inputSymbol1_2FontAttributes, context: nil).height
        context.saveGState()
        context.clip(to: inputSymbol1_2Rect)
        inputSymbol1_2TextContent.draw(in: CGRect(x: inputSymbol1_2Rect.minX, y: inputSymbol1_2Rect.minY + (inputSymbol1_2Rect.height - inputSymbol1_2TextHeight) / 2, width: inputSymbol1_2Rect.width, height: inputSymbol1_2TextHeight), withAttributes: inputSymbol1_2FontAttributes)
        context.restoreGState()
        
        
        //// output symbol 1 Drawing
        let outputSymbol1Rect = CGRect(x: frame.minX + 297, y: frame.minY + 66, width: 41, height: 43)
        let outputSymbol1TextContent = "📝"
        let outputSymbol1Style = NSMutableParagraphStyle()
        outputSymbol1Style.alignment = .left
        let outputSymbol1FontAttributes = [
            .font: UIFont.systemFont(ofSize: 30),
            .foregroundColor: UIColor.black,
            .paragraphStyle: outputSymbol1Style,
            ] as [NSAttributedStringKey: Any]
        
        let outputSymbol1TextHeight: CGFloat = outputSymbol1TextContent.boundingRect(with: CGSize(width: outputSymbol1Rect.width, height: CGFloat.infinity), options: .usesLineFragmentOrigin, attributes: outputSymbol1FontAttributes, context: nil).height
        context.saveGState()
        context.clip(to: outputSymbol1Rect)
        outputSymbol1TextContent.draw(in: CGRect(x: outputSymbol1Rect.minX, y: outputSymbol1Rect.minY + (outputSymbol1Rect.height - outputSymbol1TextHeight) / 2, width: outputSymbol1Rect.width, height: outputSymbol1TextHeight), withAttributes: outputSymbol1FontAttributes)
        context.restoreGState()
        
        
        //// input 1_1 Drawing
        let input1_1Rect = CGRect(x: frame.minX + 79, y: frame.minY + 42, width: 41, height: 43)
        let input1_1TextContent = trueFalse[varState[0]]
        let input1_1Style = NSMutableParagraphStyle()
        input1_1Style.alignment = .center
        let input1_1FontAttributes = [
            .font: UIFont.systemFont(ofSize: 30, weight: .heavy),
            .foregroundColor: colorTF[varState[0]],
            .paragraphStyle: input1_1Style,
            ] as [NSAttributedStringKey: Any]
        
        let input1_1TextHeight: CGFloat = input1_1TextContent.boundingRect(with: CGSize(width: input1_1Rect.width, height: CGFloat.infinity), options: .usesLineFragmentOrigin, attributes: input1_1FontAttributes, context: nil).height
        context.saveGState()
        context.clip(to: input1_1Rect)
        input1_1TextContent.draw(in: CGRect(x: input1_1Rect.minX, y: input1_1Rect.minY + (input1_1Rect.height - input1_1TextHeight) / 2, width: input1_1Rect.width, height: input1_1TextHeight), withAttributes: input1_1FontAttributes)
        context.restoreGState()
        
        
        //// input 1_2 Drawing
        let input1_2Rect = CGRect(x: frame.minX + 79, y: frame.minY + 90, width: 41, height: 43)
        let input1_2TextContent = trueFalse[varState[1]]
        let input1_2Style = NSMutableParagraphStyle()
        input1_2Style.alignment = .center
        let input1_2FontAttributes = [
            .font: UIFont.systemFont(ofSize: 30, weight: .heavy),
            .foregroundColor: colorTF[varState[1]],
            .paragraphStyle: input1_2Style,
            ] as [NSAttributedStringKey: Any]
        
        let input1_2TextHeight: CGFloat = input1_2TextContent.boundingRect(with: CGSize(width: input1_2Rect.width, height: CGFloat.infinity), options: .usesLineFragmentOrigin, attributes: input1_2FontAttributes, context: nil).height
        context.saveGState()
        context.clip(to: input1_2Rect)
        input1_2TextContent.draw(in: CGRect(x: input1_2Rect.minX, y: input1_2Rect.minY + (input1_2Rect.height - input1_2TextHeight) / 2, width: input1_2Rect.width, height: input1_2TextHeight), withAttributes: input1_2FontAttributes)
        context.restoreGState()
        
        
        //// output 1 Drawing
        let output1Rect = CGRect(x: frame.minX + 338, y: frame.minY + 66, width: 41, height: 43)
        let output1TextContent = trueFalse[varState[5]]
        let output1Style = NSMutableParagraphStyle()
        output1Style.alignment = .center
        let output1FontAttributes = [
            .font: UIFont.systemFont(ofSize: 30, weight: .heavy),
            .foregroundColor: colorTF[varState[5]],
            .paragraphStyle: output1Style,
            ] as [NSAttributedStringKey: Any]
        
        let output1TextHeight: CGFloat = output1TextContent.boundingRect(with: CGSize(width: output1Rect.width, height: CGFloat.infinity), options: .usesLineFragmentOrigin, attributes: output1FontAttributes, context: nil).height
        context.saveGState()
        context.clip(to: output1Rect)
        output1TextContent.draw(in: CGRect(x: output1Rect.minX, y: output1Rect.minY + (output1Rect.height - output1TextHeight) / 2, width: output1Rect.width, height: output1TextHeight), withAttributes: output1FontAttributes)
        context.restoreGState()
        
        
        
        
        //// ORGateGroup
        //// OR gate
        //// gate 2
        //// path2 Drawing
        let path2Path = UIBezierPath()
        path2Path.move(to: CGPoint(x: frame.minX + 154.13, y: frame.minY + 189.84))
        path2Path.addLine(to: CGPoint(x: frame.minX + 157.82, y: frame.minY + 199.89))
        path2Path.addCurve(to: CGPoint(x: frame.minX + 162.43, y: frame.minY + 216.63), controlPoint1: CGPoint(x: frame.minX + 160.28, y: frame.minY + 206.58), controlPoint2: CGPoint(x: frame.minX + 161.82, y: frame.minY + 212.16))
        path2Path.addCurve(to: CGPoint(x: frame.minX + 163.33, y: frame.minY + 230.02), controlPoint1: CGPoint(x: frame.minX + 163.05, y: frame.minY + 221.09), controlPoint2: CGPoint(x: frame.minX + 163.33, y: frame.minY + 225.55))
        path2Path.addCurve(to: CGPoint(x: frame.minX + 162.43, y: frame.minY + 243.37), controlPoint1: CGPoint(x: frame.minX + 163.33, y: frame.minY + 234.45), controlPoint2: CGPoint(x: frame.minX + 163.05, y: frame.minY + 238.91))
        path2Path.addCurve(to: CGPoint(x: frame.minX + 157.82, y: frame.minY + 260.11), controlPoint1: CGPoint(x: frame.minX + 161.82, y: frame.minY + 247.84), controlPoint2: CGPoint(x: frame.minX + 160.28, y: frame.minY + 253.42))
        path2Path.addCurve(to: CGPoint(x: frame.minX + 154.13, y: frame.minY + 270.16), controlPoint1: CGPoint(x: frame.minX + 155.36, y: frame.minY + 266.81), controlPoint2: CGPoint(x: frame.minX + 154.13, y: frame.minY + 270.16))
        path2Path.addCurve(to: CGPoint(x: frame.minX + 165.2, y: frame.minY + 270.16), controlPoint1: CGPoint(x: frame.minX + 154.13, y: frame.minY + 270.16), controlPoint2: CGPoint(x: frame.minX + 157.82, y: frame.minY + 270.16))
        path2Path.addCurve(to: CGPoint(x: frame.minX + 181.81, y: frame.minY + 270.16), controlPoint1: CGPoint(x: frame.minX + 172.58, y: frame.minY + 270.16), controlPoint2: CGPoint(x: frame.minX + 178.12, y: frame.minY + 270.16))
        path2Path.addCurve(to: CGPoint(x: frame.minX + 195.87, y: frame.minY + 269.04), controlPoint1: CGPoint(x: frame.minX + 185.47, y: frame.minY + 270.16), controlPoint2: CGPoint(x: frame.minX + 190.17, y: frame.minY + 269.79))
        path2Path.addCurve(to: CGPoint(x: frame.minX + 213.4, y: frame.minY + 263.46), controlPoint1: CGPoint(x: frame.minX + 201.55, y: frame.minY + 268.3), controlPoint2: CGPoint(x: frame.minX + 207.39, y: frame.minY + 266.44))
        path2Path.addCurve(to: CGPoint(x: frame.minX + 229.76, y: frame.minY + 252.34), controlPoint1: CGPoint(x: frame.minX + 219.39, y: frame.minY + 260.49), controlPoint2: CGPoint(x: frame.minX + 224.84, y: frame.minY + 256.8))
        path2Path.addCurve(to: CGPoint(x: frame.minX + 241.76, y: frame.minY + 237.83), controlPoint1: CGPoint(x: frame.minX + 234.68, y: frame.minY + 247.87), controlPoint2: CGPoint(x: frame.minX + 238.68, y: frame.minY + 243.04))
        path2Path.addCurve(to: CGPoint(x: frame.minX + 246.37, y: frame.minY + 230.02), controlPoint1: CGPoint(x: frame.minX + 244.83, y: frame.minY + 232.62), controlPoint2: CGPoint(x: frame.minX + 246.37, y: frame.minY + 230.02))
        path2Path.addCurve(to: CGPoint(x: frame.minX + 241.76, y: frame.minY + 222.21), controlPoint1: CGPoint(x: frame.minX + 246.37, y: frame.minY + 230.02), controlPoint2: CGPoint(x: frame.minX + 244.83, y: frame.minY + 227.41))
        path2Path.addCurve(to: CGPoint(x: frame.minX + 229.76, y: frame.minY + 207.7), controlPoint1: CGPoint(x: frame.minX + 238.68, y: frame.minY + 217), controlPoint2: CGPoint(x: frame.minX + 234.68, y: frame.minY + 212.16))
        path2Path.addCurve(to: CGPoint(x: frame.minX + 213.4, y: frame.minY + 196.57), controlPoint1: CGPoint(x: frame.minX + 224.84, y: frame.minY + 203.27), controlPoint2: CGPoint(x: frame.minX + 219.39, y: frame.minY + 199.51))
        path2Path.addCurve(to: CGPoint(x: frame.minX + 195.87, y: frame.minY + 190.99), controlPoint1: CGPoint(x: frame.minX + 207.39, y: frame.minY + 193.6), controlPoint2: CGPoint(x: frame.minX + 201.55, y: frame.minY + 191.74))
        path2Path.addCurve(to: CGPoint(x: frame.minX + 181.81, y: frame.minY + 189.88), controlPoint1: CGPoint(x: frame.minX + 190.2, y: frame.minY + 190.25), controlPoint2: CGPoint(x: frame.minX + 185.5, y: frame.minY + 189.88))
        path2Path.addCurve(to: CGPoint(x: frame.minX + 165.2, y: frame.minY + 189.88), controlPoint1: CGPoint(x: frame.minX + 178.12, y: frame.minY + 189.88), controlPoint2: CGPoint(x: frame.minX + 172.58, y: frame.minY + 189.88))
        path2Path.addLine(to: CGPoint(x: frame.minX + 154.13, y: frame.minY + 189.84))
        path2Path.close()
        color4.setFill()
        path2Path.fill()
        strokeColor.setStroke()
        path2Path.lineWidth = 4
        path2Path.miterLimit = 10.43
        path2Path.lineCapStyle = .square
        path2Path.stroke()
        
        
        
        
        //// input line 2_1 Drawing
        let inputLine2_1Path = UIBezierPath(rect: CGRect(x: frame.minX + 120, y: frame.minY + 204, width: 39, height: 4))
        UIColor.black.setFill()
        inputLine2_1Path.fill()
        
        
        //// input line 2_2 Drawing
        let inputLine2_2Path = UIBezierPath(rect: CGRect(x: frame.minX + 120, y: frame.minY + 252, width: 39, height: 4))
        UIColor.black.setFill()
        inputLine2_2Path.fill()
        
        
        //// output line 2 Drawing
        let outputLine2Path = UIBezierPath(rect: CGRect(x: frame.minX + 246, y: frame.minY + 228, width: 36, height: 4))
        UIColor.black.setFill()
        outputLine2Path.fill()
        
        
        //// gate caption 2 Drawing
        let gateCaption2Rect = CGRect(x: frame.minX + 167, y: frame.minY + 288, width: 67, height: 22)
        let gateCaption2TextContent = "OR Gate"
        let gateCaption2Style = NSMutableParagraphStyle()
        gateCaption2Style.alignment = .center
        let gateCaption2FontAttributes = [
            .font: UIFont.systemFont(ofSize: UIFont.labelFontSize, weight: .bold),
            .foregroundColor: UIColor.black,
            .paragraphStyle: gateCaption2Style,
            ] as [NSAttributedStringKey: Any]
        
        let gateCaption2TextHeight: CGFloat = gateCaption2TextContent.boundingRect(with: CGSize(width: gateCaption2Rect.width, height: CGFloat.infinity), options: .usesLineFragmentOrigin, attributes: gateCaption2FontAttributes, context: nil).height
        context.saveGState()
        context.clip(to: gateCaption2Rect)
        gateCaption2TextContent.draw(in: CGRect(x: gateCaption2Rect.minX, y: gateCaption2Rect.minY + (gateCaption2Rect.height - gateCaption2TextHeight) / 2, width: gateCaption2Rect.width, height: gateCaption2TextHeight), withAttributes: gateCaption2FontAttributes)
        context.restoreGState()
        
        
        
        
        //// imput symbol 2_1 Drawing
        let imputSymbol2_1Rect = CGRect(x: frame.minX + 38, y: frame.minY + 184, width: 41, height: 43)
        let imputSymbol2_1TextContent = "🍨"
        let imputSymbol2_1Style = NSMutableParagraphStyle()
        imputSymbol2_1Style.alignment = .left
        let imputSymbol2_1FontAttributes = [
            .font: UIFont.systemFont(ofSize: 30),
            .foregroundColor: UIColor.black,
            .paragraphStyle: imputSymbol2_1Style,
            ] as [NSAttributedStringKey: Any]
        
        let imputSymbol2_1TextHeight: CGFloat = imputSymbol2_1TextContent.boundingRect(with: CGSize(width: imputSymbol2_1Rect.width, height: CGFloat.infinity), options: .usesLineFragmentOrigin, attributes: imputSymbol2_1FontAttributes, context: nil).height
        context.saveGState()
        context.clip(to: imputSymbol2_1Rect)
        imputSymbol2_1TextContent.draw(in: CGRect(x: imputSymbol2_1Rect.minX, y: imputSymbol2_1Rect.minY + (imputSymbol2_1Rect.height - imputSymbol2_1TextHeight) / 2, width: imputSymbol2_1Rect.width, height: imputSymbol2_1TextHeight), withAttributes: imputSymbol2_1FontAttributes)
        context.restoreGState()
        
        
        //// input symbol 2_2 Drawing
        let inputSymbol2_2Rect = CGRect(x: frame.minX + 38, y: frame.minY + 232, width: 41, height: 43)
        let inputSymbol2_2TextContent = "🍦"
        let inputSymbol2_2Style = NSMutableParagraphStyle()
        inputSymbol2_2Style.alignment = .left
        let inputSymbol2_2FontAttributes = [
            .font: UIFont.systemFont(ofSize: 30),
            .foregroundColor: UIColor.black,
            .paragraphStyle: inputSymbol2_2Style,
            ] as [NSAttributedStringKey: Any]
        
        let inputSymbol2_2TextHeight: CGFloat = inputSymbol2_2TextContent.boundingRect(with: CGSize(width: inputSymbol2_2Rect.width, height: CGFloat.infinity), options: .usesLineFragmentOrigin, attributes: inputSymbol2_2FontAttributes, context: nil).height
        context.saveGState()
        context.clip(to: inputSymbol2_2Rect)
        inputSymbol2_2TextContent.draw(in: CGRect(x: inputSymbol2_2Rect.minX, y: inputSymbol2_2Rect.minY + (inputSymbol2_2Rect.height - inputSymbol2_2TextHeight) / 2, width: inputSymbol2_2Rect.width, height: inputSymbol2_2TextHeight), withAttributes: inputSymbol2_2FontAttributes)
        context.restoreGState()
        
        
        //// output symbol 2 Drawing
        let outputSymbol2Rect = CGRect(x: frame.minX + 297, y: frame.minY + 208, width: 41, height: 43)
        let outputSymbol2TextContent = "😍"
        let outputSymbol2Style = NSMutableParagraphStyle()
        outputSymbol2Style.alignment = .left
        let outputSymbol2FontAttributes = [
            .font: UIFont.systemFont(ofSize: 30),
            .foregroundColor: UIColor.black,
            .paragraphStyle: outputSymbol2Style,
            ] as [NSAttributedStringKey: Any]
        
        let outputSymbol2TextHeight: CGFloat = outputSymbol2TextContent.boundingRect(with: CGSize(width: outputSymbol2Rect.width, height: CGFloat.infinity), options: .usesLineFragmentOrigin, attributes: outputSymbol2FontAttributes, context: nil).height
        context.saveGState()
        context.clip(to: outputSymbol2Rect)
        outputSymbol2TextContent.draw(in: CGRect(x: outputSymbol2Rect.minX, y: outputSymbol2Rect.minY + (outputSymbol2Rect.height - outputSymbol2TextHeight) / 2, width: outputSymbol2Rect.width, height: outputSymbol2TextHeight), withAttributes: outputSymbol2FontAttributes)
        context.restoreGState()
        
        
        //// input2_1 Drawing
        let input2_1Rect = CGRect(x: frame.minX + 79, y: frame.minY + 184, width: 41, height: 43)
        let input2_1TextContent = trueFalse[varState[2]]
        let input2_1Style = NSMutableParagraphStyle()
        input2_1Style.alignment = .center
        let input2_1FontAttributes = [
            .font: UIFont.systemFont(ofSize: 30, weight: .heavy),
            .foregroundColor: colorTF[varState[2]],
            .paragraphStyle: input2_1Style,
            ] as [NSAttributedStringKey: Any]
        
        let input2_1TextHeight: CGFloat = input2_1TextContent.boundingRect(with: CGSize(width: input2_1Rect.width, height: CGFloat.infinity), options: .usesLineFragmentOrigin, attributes: input2_1FontAttributes, context: nil).height
        context.saveGState()
        context.clip(to: input2_1Rect)
        input2_1TextContent.draw(in: CGRect(x: input2_1Rect.minX, y: input2_1Rect.minY + (input2_1Rect.height - input2_1TextHeight) / 2, width: input2_1Rect.width, height: input2_1TextHeight), withAttributes: input2_1FontAttributes)
        context.restoreGState()
        
        
        //// input2_2 Drawing
        let input2_2Rect = CGRect(x: frame.minX + 79, y: frame.minY + 232, width: 41, height: 43)
        let input2_2TextContent = trueFalse[varState[3]]
        let input2_2Style = NSMutableParagraphStyle()
        input2_2Style.alignment = .center
        let input2_2FontAttributes = [
            .font: UIFont.systemFont(ofSize: 30, weight: .heavy),
            .foregroundColor: colorTF[varState[3]],
            .paragraphStyle: input2_2Style,
            ] as [NSAttributedStringKey: Any]
        
        let input2_2TextHeight: CGFloat = input2_2TextContent.boundingRect(with: CGSize(width: input2_2Rect.width, height: CGFloat.infinity), options: .usesLineFragmentOrigin, attributes: input2_2FontAttributes, context: nil).height
        context.saveGState()
        context.clip(to: input2_2Rect)
        input2_2TextContent.draw(in: CGRect(x: input2_2Rect.minX, y: input2_2Rect.minY + (input2_2Rect.height - input2_2TextHeight) / 2, width: input2_2Rect.width, height: input2_2TextHeight), withAttributes: input2_2FontAttributes)
        context.restoreGState()
        
        
        //// Output2 Drawing
        let output2Rect = CGRect(x: frame.minX + 338, y: frame.minY + 208, width: 41, height: 43)
        let output2TextContent = trueFalse[varState[6]]
        let output2Style = NSMutableParagraphStyle()
        output2Style.alignment = .center
        let output2FontAttributes = [
            .font: UIFont.systemFont(ofSize: 30, weight: .heavy),
            .foregroundColor: colorTF[varState[6]],
            .paragraphStyle: output2Style,
            ] as [NSAttributedStringKey: Any]
        
        let output2TextHeight: CGFloat = output2TextContent.boundingRect(with: CGSize(width: output2Rect.width, height: CGFloat.infinity), options: .usesLineFragmentOrigin, attributes: output2FontAttributes, context: nil).height
        context.saveGState()
        context.clip(to: output2Rect)
        output2TextContent.draw(in: CGRect(x: output2Rect.minX, y: output2Rect.minY + (output2Rect.height - output2TextHeight) / 2, width: output2Rect.width, height: output2TextHeight), withAttributes: output2FontAttributes)
        context.restoreGState()
        
        
        
        
        //// NOTGateGroup
        //// NOT Gate
        //// Gate 3
        //// triangle3
        //// path4961 Drawing
        let path4961Path = UIBezierPath()
        path4961Path.move(to: CGPoint(x: frame.minX + 161.35, y: frame.minY + 329.66))
        path4961Path.addCurve(to: CGPoint(x: frame.minX + 161.35, y: frame.minY + 422.18), controlPoint1: CGPoint(x: frame.minX + 161.35, y: frame.minY + 422.18), controlPoint2: CGPoint(x: frame.minX + 161.35, y: frame.minY + 422.18))
        path4961Path.addLine(to: CGPoint(x: frame.minX + 239.28, y: frame.minY + 380.36))
        path4961Path.addLine(to: CGPoint(x: frame.minX + 161.35, y: frame.minY + 329.66))
        path4961Path.close()
        fillColor3.setFill()
        path4961Path.fill()
        
        
        //// g4963
        //// path4965 Drawing
        let path4965Path = UIBezierPath()
        path4965Path.move(to: CGPoint(x: frame.minX + 161.35, y: frame.minY + 329.66))
        path4965Path.addCurve(to: CGPoint(x: frame.minX + 161.35, y: frame.minY + 422.18), controlPoint1: CGPoint(x: frame.minX + 161.35, y: frame.minY + 422.18), controlPoint2: CGPoint(x: frame.minX + 161.35, y: frame.minY + 422.18))
        path4965Path.addLine(to: CGPoint(x: frame.minX + 239.28, y: frame.minY + 380.36))
        path4965Path.addLine(to: CGPoint(x: frame.minX + 161.35, y: frame.minY + 329.66))
        path4965Path.close()
        color2.setFill()
        path4965Path.fill()
        UIColor.black.setStroke()
        path4965Path.lineWidth = 0.5
        path4965Path.miterLimit = 4
        path4965Path.stroke()
        
        
        //// path4967 Drawing
        let path4967Path = UIBezierPath()
        path4967Path.move(to: CGPoint(x: frame.minX + 158.9, y: frame.minY + 329.66))
        path4967Path.addCurve(to: CGPoint(x: frame.minX + 158.9, y: frame.minY + 413.12), controlPoint1: CGPoint(x: frame.minX + 158.9, y: frame.minY + 357.48), controlPoint2: CGPoint(x: frame.minX + 158.9, y: frame.minY + 385.3))
        path4967Path.addCurve(to: CGPoint(x: frame.minX + 158.9, y: frame.minY + 422.18), controlPoint1: CGPoint(x: frame.minX + 158.9, y: frame.minY + 416.14), controlPoint2: CGPoint(x: frame.minX + 158.9, y: frame.minY + 419.16))
        path4967Path.addCurve(to: CGPoint(x: frame.minX + 162.58, y: frame.minY + 424.44), controlPoint1: CGPoint(x: frame.minX + 158.9, y: frame.minY + 424.26), controlPoint2: CGPoint(x: frame.minX + 160.95, y: frame.minY + 425.31))
        path4967Path.addCurve(to: CGPoint(x: frame.minX + 205.44, y: frame.minY + 401.44), controlPoint1: CGPoint(x: frame.minX + 176.86, y: frame.minY + 416.78), controlPoint2: CGPoint(x: frame.minX + 191.15, y: frame.minY + 409.11))
        path4967Path.addCurve(to: CGPoint(x: frame.minX + 240.51, y: frame.minY + 382.62), controlPoint1: CGPoint(x: frame.minX + 217.13, y: frame.minY + 395.17), controlPoint2: CGPoint(x: frame.minX + 228.82, y: frame.minY + 388.89))
        path4967Path.addCurve(to: CGPoint(x: frame.minX + 240.51, y: frame.minY + 378.09), controlPoint1: CGPoint(x: frame.minX + 242.2, y: frame.minY + 381.71), controlPoint2: CGPoint(x: frame.minX + 241.99, y: frame.minY + 379.06))
        path4967Path.addCurve(to: CGPoint(x: frame.minX + 200.35, y: frame.minY + 351.97), controlPoint1: CGPoint(x: frame.minX + 227.12, y: frame.minY + 369.38), controlPoint2: CGPoint(x: frame.minX + 213.74, y: frame.minY + 360.68))
        path4967Path.addCurve(to: CGPoint(x: frame.minX + 162.58, y: frame.minY + 327.4), controlPoint1: CGPoint(x: frame.minX + 187.76, y: frame.minY + 343.78), controlPoint2: CGPoint(x: frame.minX + 175.17, y: frame.minY + 335.59))
        path4967Path.addCurve(to: CGPoint(x: frame.minX + 160.11, y: frame.minY + 331.93), controlPoint1: CGPoint(x: frame.minX + 159.88, y: frame.minY + 325.64), controlPoint2: CGPoint(x: frame.minX + 157.42, y: frame.minY + 330.18))
        path4967Path.addCurve(to: CGPoint(x: frame.minX + 200.27, y: frame.minY + 358.05), controlPoint1: CGPoint(x: frame.minX + 173.5, y: frame.minY + 340.63), controlPoint2: CGPoint(x: frame.minX + 186.89, y: frame.minY + 349.34))
        path4967Path.addCurve(to: CGPoint(x: frame.minX + 238.04, y: frame.minY + 382.62), controlPoint1: CGPoint(x: frame.minX + 212.86, y: frame.minY + 366.24), controlPoint2: CGPoint(x: frame.minX + 225.45, y: frame.minY + 374.43))
        path4967Path.addCurve(to: CGPoint(x: frame.minX + 238.04, y: frame.minY + 378.09), controlPoint1: CGPoint(x: frame.minX + 238.04, y: frame.minY + 381.11), controlPoint2: CGPoint(x: frame.minX + 238.04, y: frame.minY + 379.6))
        path4967Path.addCurve(to: CGPoint(x: frame.minX + 195.19, y: frame.minY + 401.09), controlPoint1: CGPoint(x: frame.minX + 223.76, y: frame.minY + 385.76), controlPoint2: CGPoint(x: frame.minX + 209.47, y: frame.minY + 393.42))
        path4967Path.addCurve(to: CGPoint(x: frame.minX + 160.11, y: frame.minY + 419.91), controlPoint1: CGPoint(x: frame.minX + 183.5, y: frame.minY + 407.37), controlPoint2: CGPoint(x: frame.minX + 171.81, y: frame.minY + 413.64))
        path4967Path.addCurve(to: CGPoint(x: frame.minX + 163.79, y: frame.minY + 422.18), controlPoint1: CGPoint(x: frame.minX + 161.34, y: frame.minY + 420.67), controlPoint2: CGPoint(x: frame.minX + 162.56, y: frame.minY + 421.42))
        path4967Path.addCurve(to: CGPoint(x: frame.minX + 163.79, y: frame.minY + 407.68), controlPoint1: CGPoint(x: frame.minX + 163.79, y: frame.minY + 417.35), controlPoint2: CGPoint(x: frame.minX + 163.79, y: frame.minY + 412.52))
        path4967Path.addCurve(to: CGPoint(x: frame.minX + 163.79, y: frame.minY + 329.66), controlPoint1: CGPoint(x: frame.minX + 163.79, y: frame.minY + 381.68), controlPoint2: CGPoint(x: frame.minX + 163.79, y: frame.minY + 355.67))
        path4967Path.addCurve(to: CGPoint(x: frame.minX + 158.9, y: frame.minY + 329.66), controlPoint1: CGPoint(x: frame.minX + 163.79, y: frame.minY + 326.28), controlPoint2: CGPoint(x: frame.minX + 158.9, y: frame.minY + 326.28))
        path4967Path.close()
        fillColor4.setFill()
        path4967Path.fill()
        
        
        
        
        
        
        //// circle3 Drawing
        let circle3Path = UIBezierPath(ovalIn: CGRect(x: frame.minX + 238.88, y: frame.minY + 374.76, width: 13.39, height: 12.36))
        color2.setFill()
        circle3Path.fill()
        strokeColor.setStroke()
        circle3Path.lineWidth = 4
        circle3Path.stroke()
        
        
        
        
        //// Input Line 3 Drawing
        let inputLine3Path = UIBezierPath(rect: CGRect(x: frame.minX + 120, y: frame.minY + 379, width: 39, height: 4))
        UIColor.black.setFill()
        inputLine3Path.fill()
        
        
        //// Output Line 3 Drawing
        let outputLine3Path = UIBezierPath(rect: CGRect(x: frame.minX + 252, y: frame.minY + 379, width: 30, height: 4))
        UIColor.black.setFill()
        outputLine3Path.fill()
        
        
        //// Gate Caption 3 Drawing
        let gateCaption3Rect = CGRect(x: frame.minX + 161, y: frame.minY + 439, width: 83, height: 22)
        let gateCaption3TextContent = "NOT Gate"
        let gateCaption3Style = NSMutableParagraphStyle()
        gateCaption3Style.alignment = .center
        let gateCaption3FontAttributes = [
            .font: UIFont.systemFont(ofSize: UIFont.labelFontSize, weight: .bold),
            .foregroundColor: UIColor.black,
            .paragraphStyle: gateCaption3Style,
            ] as [NSAttributedStringKey: Any]
        
        let gateCaption3TextHeight: CGFloat = gateCaption3TextContent.boundingRect(with: CGSize(width: gateCaption3Rect.width, height: CGFloat.infinity), options: .usesLineFragmentOrigin, attributes: gateCaption3FontAttributes, context: nil).height
        context.saveGState()
        context.clip(to: gateCaption3Rect)
        gateCaption3TextContent.draw(in: CGRect(x: gateCaption3Rect.minX, y: gateCaption3Rect.minY + (gateCaption3Rect.height - gateCaption3TextHeight) / 2, width: gateCaption3Rect.width, height: gateCaption3TextHeight), withAttributes: gateCaption3FontAttributes)
        context.restoreGState()
        
        
        
        
        //// Input Symbol 3 Drawing
        let inputSymbol3Rect = CGRect(x: frame.minX + 38, y: frame.minY + 359, width: 41, height: 43)
        let inputSymbol3TextContent = "👍"
        let inputSymbol3Style = NSMutableParagraphStyle()
        inputSymbol3Style.alignment = .left
        let inputSymbol3FontAttributes = [
            .font: UIFont.systemFont(ofSize: 30),
            .foregroundColor: UIColor.black,
            .paragraphStyle: inputSymbol3Style,
            ] as [NSAttributedStringKey: Any]
        
        let inputSymbol3TextHeight: CGFloat = inputSymbol3TextContent.boundingRect(with: CGSize(width: inputSymbol3Rect.width, height: CGFloat.infinity), options: .usesLineFragmentOrigin, attributes: inputSymbol3FontAttributes, context: nil).height
        context.saveGState()
        context.clip(to: inputSymbol3Rect)
        inputSymbol3TextContent.draw(in: CGRect(x: inputSymbol3Rect.minX, y: inputSymbol3Rect.minY + (inputSymbol3Rect.height - inputSymbol3TextHeight) / 2, width: inputSymbol3Rect.width, height: inputSymbol3TextHeight), withAttributes: inputSymbol3FontAttributes)
        context.restoreGState()
        
        
        //// Output Symbol 3 Drawing
        let outputSymbol3Rect = CGRect(x: frame.minX + 297, y: frame.minY + 359, width: 41, height: 43)
        let outputSymbol3TextContent = " 👎"
        let outputSymbol3Style = NSMutableParagraphStyle()
        outputSymbol3Style.alignment = .left
        let outputSymbol3FontAttributes = [
            .font: UIFont.systemFont(ofSize: 30),
            .foregroundColor: UIColor.black,
            .paragraphStyle: outputSymbol3Style,
            ] as [NSAttributedStringKey: Any]
        
        let outputSymbol3TextHeight: CGFloat = outputSymbol3TextContent.boundingRect(with: CGSize(width: outputSymbol3Rect.width, height: CGFloat.infinity), options: .usesLineFragmentOrigin, attributes: outputSymbol3FontAttributes, context: nil).height
        context.saveGState()
        context.clip(to: outputSymbol3Rect)
        outputSymbol3TextContent.draw(in: CGRect(x: outputSymbol3Rect.minX, y: outputSymbol3Rect.minY + (outputSymbol3Rect.height - outputSymbol3TextHeight) / 2, width: outputSymbol3Rect.width, height: outputSymbol3TextHeight), withAttributes: outputSymbol3FontAttributes)
        context.restoreGState()
        
        
        //// Input3 Drawing
        let input3Rect = CGRect(x: frame.minX + 79, y: frame.minY + 359, width: 41, height: 43)
        let input3TextContent = trueFalse[varState[4]]
        let input3Style = NSMutableParagraphStyle()
        input3Style.alignment = .center
        let input3FontAttributes = [
            .font: UIFont.systemFont(ofSize: 30, weight: .heavy),
            .foregroundColor: colorTF[varState[4]],
            .paragraphStyle: input3Style,
            ] as [NSAttributedStringKey: Any]
        
        let input3TextHeight: CGFloat = input3TextContent.boundingRect(with: CGSize(width: input3Rect.width, height: CGFloat.infinity), options: .usesLineFragmentOrigin, attributes: input3FontAttributes, context: nil).height
        context.saveGState()
        context.clip(to: input3Rect)
        input3TextContent.draw(in: CGRect(x: input3Rect.minX, y: input3Rect.minY + (input3Rect.height - input3TextHeight) / 2, width: input3Rect.width, height: input3TextHeight), withAttributes: input3FontAttributes)
        context.restoreGState()
        
        
        //// Output3 Drawing
        let output3Rect = CGRect(x: frame.minX + 338, y: frame.minY + 359, width: 41, height: 43)
        let output3TextContent = trueFalse[varState[7]]
        let output3Style = NSMutableParagraphStyle()
        output3Style.alignment = .center
        let output3FontAttributes = [
            .font: UIFont.systemFont(ofSize: 30, weight: .heavy),
            .foregroundColor: colorTF[varState[7]],
            .paragraphStyle: output3Style,
            ] as [NSAttributedStringKey: Any]
        
        let output3TextHeight: CGFloat = output3TextContent.boundingRect(with: CGSize(width: output3Rect.width, height: CGFloat.infinity), options: .usesLineFragmentOrigin, attributes: output3FontAttributes, context: nil).height
        context.saveGState()
        context.clip(to: output3Rect)
        output3TextContent.draw(in: CGRect(x: output3Rect.minX, y: output3Rect.minY + (output3Rect.height - output3TextHeight) / 2, width: output3Rect.width, height: output3TextHeight), withAttributes: output3FontAttributes)
        context.restoreGState()
    }
    
}











