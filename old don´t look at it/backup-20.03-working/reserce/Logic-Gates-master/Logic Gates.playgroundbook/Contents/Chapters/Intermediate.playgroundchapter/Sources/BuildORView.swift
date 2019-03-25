import PlaygroundSupport
import UIKit
import Foundation
import CoreGraphics

public class BuildORView: UIView{
    //public var varState = [Int]()
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
        flipResults += [TrueFalseResultView(frame: CGRect(x: frame.minX + 61, y: frame.minY + 16, width: 38, height: 40))]
        flipResults += [TrueFalseResultView(frame: CGRect(x: frame.minX + 61, y: frame.minY + 89, width: 38, height: 40))]
        flipResults += [TrueFalseResultView(frame: CGRect(x: frame.minX + 61, y: frame.minY + 167, width: 38, height: 40))]
        flipResults += [TrueFalseResultView(frame: CGRect(x: frame.minX + 61, y: frame.minY + 240, width: 38, height: 40))]
        flipResults += [TrueFalseResultView(frame: CGRect(x: frame.minX + 254, y: frame.minY + 70, width: 38, height: 40))]
        flipResults += [TrueFalseResultView(frame: CGRect(x: frame.minX + 254, y: frame.minY + 185, width: 38, height: 40))]
        flipResults += [TrueFalseResultView(frame: CGRect(x: frame.minX + 400, y: frame.minY + 127, width: 38, height: 40))]
        for fR in flipResults {
            fR.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
//            fR.layer.borderWidth = 1
            fR.fontsize = 30
            self.addSubview(fR)
        }
    }
    
    func drawCircuit(frame: CGRect = CGRect(x: 0, y: 0, width: 460, height: 350)) {
        //// General Declarations
        let context = UIGraphicsGetCurrentContext()!
        
        //// Color Declarations
        let strokeColor = UIColor(red: 0.000, green: 0.000, blue: 0.000, alpha: 1.000)
        let textForeground = UIColor(red: 0.000, green: 0.000, blue: 0.000, alpha: 1.000)
        let color9 = UIColor(red: 0.400, green: 0.936, blue: 1.000, alpha: 1.000)
        
        //// Group 2
        //// Oval 2 Drawing
        let oval2Path = UIBezierPath(ovalIn: CGRect(x: frame.minX + 172, y: frame.minY + 65, width: 13, height: 14))
        color9.setFill()
        oval2Path.fill()
        strokeColor.setStroke()
        oval2Path.lineWidth = 4
        oval2Path.stroke()
        
        
        //// Rectangle 2 Drawing
        let rectangle2Path = UIBezierPath(rect: CGRect(x: frame.minX + 185, y: frame.minY + 70, width: 27, height: 4))
        UIColor.black.setFill()
        rectangle2Path.fill()
        
        
        //// Rectangle 3 Drawing
        let rectangle3Path = UIBezierPath(rect: CGRect(x: frame.minX + 61, y: frame.minY + 56, width: 41, height: 4))
        UIColor.black.setFill()
        rectangle3Path.fill()
        
        
        //// Rectangle 4 Drawing
        let rectangle4Path = UIBezierPath(rect: CGRect(x: frame.minX + 61, y: frame.minY + 85, width: 41, height: 4))
        UIColor.black.setFill()
        rectangle4Path.fill()
        
        
        //// Bezier Drawing
        let bezierPath = UIBezierPath()
        bezierPath.move(to: CGPoint(x: frame.minX + 137.58, y: frame.minY + 38.08))
        bezierPath.addCurve(to: CGPoint(x: frame.minX + 170.35, y: frame.minY + 72.57), controlPoint1: CGPoint(x: frame.minX + 155.85, y: frame.minY + 39.12), controlPoint2: CGPoint(x: frame.minX + 170.35, y: frame.minY + 54.16))
        bezierPath.addCurve(to: CGPoint(x: frame.minX + 137.58, y: frame.minY + 107.01), controlPoint1: CGPoint(x: frame.minX + 170.35, y: frame.minY + 90.98), controlPoint2: CGPoint(x: frame.minX + 155.85, y: frame.minY + 106.02))
        bezierPath.addLine(to: CGPoint(x: frame.minX + 100.96, y: frame.minY + 107.07))
        bezierPath.addCurve(to: CGPoint(x: frame.minX + 100.96, y: frame.minY + 72.57), controlPoint1: CGPoint(x: frame.minX + 100.96, y: frame.minY + 107.07), controlPoint2: CGPoint(x: frame.minX + 100.96, y: frame.minY + 89.82))
        bezierPath.addCurve(to: CGPoint(x: frame.minX + 100.96, y: frame.minY + 38.08), controlPoint1: CGPoint(x: frame.minX + 100.96, y: frame.minY + 55.32), controlPoint2: CGPoint(x: frame.minX + 100.96, y: frame.minY + 38.08))
        bezierPath.addLine(to: CGPoint(x: frame.minX + 137.58, y: frame.minY + 38.08))
        bezierPath.addLine(to: CGPoint(x: frame.minX + 137.58, y: frame.minY + 38.08))
        bezierPath.close()
        color9.setFill()
        bezierPath.fill()
        UIColor.black.setStroke()
        bezierPath.lineWidth = 4
        bezierPath.stroke()
        
        
        
        
        //// Group
        //// Oval Drawing
        let ovalPath = UIBezierPath(ovalIn: CGRect(x: frame.minX + 172, y: frame.minY + 216, width: 13, height: 14))
        color9.setFill()
        ovalPath.fill()
        strokeColor.setStroke()
        ovalPath.lineWidth = 4
        ovalPath.stroke()
        
        
        //// Rectangle Drawing
        let rectanglePath = UIBezierPath(rect: CGRect(x: frame.minX + 185, y: frame.minY + 221, width: 27, height: 4))
        UIColor.black.setFill()
        rectanglePath.fill()
        
        
        //// Rectangle 5 Drawing
        let rectangle5Path = UIBezierPath(rect: CGRect(x: frame.minX + 61, y: frame.minY + 207, width: 41, height: 4))
        UIColor.black.setFill()
        rectangle5Path.fill()
        
        
        //// Rectangle 6 Drawing
        let rectangle6Path = UIBezierPath(rect: CGRect(x: frame.minX + 61, y: frame.minY + 236, width: 41, height: 4))
        UIColor.black.setFill()
        rectangle6Path.fill()
        
        
        //// Bezier 2 Drawing
        let bezier2Path = UIBezierPath()
        bezier2Path.move(to: CGPoint(x: frame.minX + 137.58, y: frame.minY + 189.08))
        bezier2Path.addCurve(to: CGPoint(x: frame.minX + 170.35, y: frame.minY + 223.57), controlPoint1: CGPoint(x: frame.minX + 155.85, y: frame.minY + 190.12), controlPoint2: CGPoint(x: frame.minX + 170.35, y: frame.minY + 205.16))
        bezier2Path.addCurve(to: CGPoint(x: frame.minX + 137.58, y: frame.minY + 258.01), controlPoint1: CGPoint(x: frame.minX + 170.35, y: frame.minY + 241.98), controlPoint2: CGPoint(x: frame.minX + 155.85, y: frame.minY + 257.02))
        bezier2Path.addLine(to: CGPoint(x: frame.minX + 100.96, y: frame.minY + 258.07))
        bezier2Path.addCurve(to: CGPoint(x: frame.minX + 100.96, y: frame.minY + 223.57), controlPoint1: CGPoint(x: frame.minX + 100.96, y: frame.minY + 258.07), controlPoint2: CGPoint(x: frame.minX + 100.96, y: frame.minY + 240.82))
        bezier2Path.addCurve(to: CGPoint(x: frame.minX + 100.96, y: frame.minY + 189.08), controlPoint1: CGPoint(x: frame.minX + 100.96, y: frame.minY + 206.32), controlPoint2: CGPoint(x: frame.minX + 100.96, y: frame.minY + 189.08))
        bezier2Path.addLine(to: CGPoint(x: frame.minX + 137.58, y: frame.minY + 189.08))
        bezier2Path.addLine(to: CGPoint(x: frame.minX + 137.58, y: frame.minY + 189.08))
        bezier2Path.close()
        color9.setFill()
        bezier2Path.fill()
        UIColor.black.setStroke()
        bezier2Path.lineWidth = 4
        bezier2Path.stroke()
        
        
        
        
        //// Group 3
        //// Oval 3 Drawing
        let oval3Path = UIBezierPath(ovalIn: CGRect(x: frame.minX + 323, y: frame.minY + 140, width: 13, height: 14))
        color9.setFill()
        oval3Path.fill()
        strokeColor.setStroke()
        oval3Path.lineWidth = 4
        oval3Path.stroke()
        
        
        //// Rectangle 7 Drawing
        let rectangle7Path = UIBezierPath(rect: CGRect(x: frame.minX + 336, y: frame.minY + 145, width: 27, height: 4))
        UIColor.black.setFill()
        rectangle7Path.fill()
        
        
        //// Rectangle 8 Drawing
        let rectangle8Path = UIBezierPath(rect: CGRect(x: frame.minX + 212, y: frame.minY + 131, width: 41, height: 4))
        UIColor.black.setFill()
        rectangle8Path.fill()
        
        
        //// Rectangle 9 Drawing
        let rectangle9Path = UIBezierPath(rect: CGRect(x: frame.minX + 212, y: frame.minY + 160, width: 41, height: 4))
        UIColor.black.setFill()
        rectangle9Path.fill()
        
        
        //// Bezier 3 Drawing
        let bezier3Path = UIBezierPath()
        bezier3Path.move(to: CGPoint(x: frame.minX + 288.58, y: frame.minY + 113.08))
        bezier3Path.addCurve(to: CGPoint(x: frame.minX + 321.35, y: frame.minY + 147.57), controlPoint1: CGPoint(x: frame.minX + 306.85, y: frame.minY + 114.12), controlPoint2: CGPoint(x: frame.minX + 321.35, y: frame.minY + 129.16))
        bezier3Path.addCurve(to: CGPoint(x: frame.minX + 288.58, y: frame.minY + 182.01), controlPoint1: CGPoint(x: frame.minX + 321.35, y: frame.minY + 165.98), controlPoint2: CGPoint(x: frame.minX + 306.85, y: frame.minY + 181.02))
        bezier3Path.addLine(to: CGPoint(x: frame.minX + 251.96, y: frame.minY + 182.07))
        bezier3Path.addCurve(to: CGPoint(x: frame.minX + 251.96, y: frame.minY + 147.57), controlPoint1: CGPoint(x: frame.minX + 251.96, y: frame.minY + 182.07), controlPoint2: CGPoint(x: frame.minX + 251.96, y: frame.minY + 164.82))
        bezier3Path.addCurve(to: CGPoint(x: frame.minX + 251.96, y: frame.minY + 113.08), controlPoint1: CGPoint(x: frame.minX + 251.96, y: frame.minY + 130.32), controlPoint2: CGPoint(x: frame.minX + 251.96, y: frame.minY + 113.08))
        bezier3Path.addLine(to: CGPoint(x: frame.minX + 288.58, y: frame.minY + 113.08))
        bezier3Path.addLine(to: CGPoint(x: frame.minX + 288.58, y: frame.minY + 113.08))
        bezier3Path.close()
        color9.setFill()
        bezier3Path.fill()
        UIColor.black.setStroke()
        bezier3Path.lineWidth = 4
        bezier3Path.stroke()
        
        
        
        
        //// Rectangle 10 Drawing
        let rectangle10Path = UIBezierPath(rect: CGRect(x: frame.minX + 212, y: frame.minY + 70, width: 4, height: 61))
        UIColor.black.setFill()
        rectangle10Path.fill()
        
        
        //// Rectangle 11 Drawing
        let rectangle11Path = UIBezierPath(rect: CGRect(x: frame.minX + 212, y: frame.minY + 164, width: 4, height: 61))
        UIColor.black.setFill()
        rectangle11Path.fill()
        
        
        //// caption input 1 Drawing
        let captionInput1Rect = CGRect(x: frame.minX + 23, y: frame.minY + 16, width: 38, height: 40)
        let captionInput1TextContent = inputName[inputState[0]]
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
        
        
        //// caption input 2 Drawing
        let captionInput2Rect = CGRect(x: frame.minX + 23, y: frame.minY + 89, width: 38, height: 40)
        let captionInput2TextContent = inputName[inputState[1]]
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
        let captionInput3Rect = CGRect(x: frame.minX + 23, y: frame.minY + 167, width: 38, height: 40)
        let captionInput3TextContent = inputName[inputState[2]]
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
        let captionInput4Rect = CGRect(x: frame.minX + 23, y: frame.minY + 240, width: 38, height: 40)
        let captionInput4TextContent = inputName[inputState[3]]
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
        
        
        //// caption x Drawing
        let captionXRect = CGRect(x: frame.minX + 216, y: frame.minY + 70, width: 38, height: 40)
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
        let captionYRect = CGRect(x: frame.minX + 216, y: frame.minY + 185, width: 38, height: 40)
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
        
        
        //// caption z Drawing
        let captionZRect = CGRect(x: frame.minX + 362, y: frame.minY + 127, width: 38, height: 40)
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
    }

}











