//
//  test.swift
//  Book_Sources
//
//  Created by Veit Progl on 16.03.19.
//

import Foundation
import UIKit

public var test = "test"
public var storkeColorPublic = UIColor(red: 36 / 255, green: 50 / 255, blue: 82 / 255, alpha: 1.0)
public protocol canvasDelegate: class {
    func canvas(_ canvas: canvasView, didChangeInput image: UIImage)
}

public typealias Move = (start: CGPoint, end: CGPoint)

public class canvasView: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = UIColor(white: 1, alpha: 0)
        //backgroundColor = UIColor(patternImage: UIImage(named: "wirtingbackground.png")!)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var strokeWidth = 10.0 {didSet {setNeedsDisplay()}}
    var strokeColor:UIColor = storkeColorPublic {didSet {setNeedsDisplay()}}
    var moves:[Move] = []
    var lastPoint: CGPoint?
    var drawing = false
    let offset: CGFloat = 25.0
    
    weak var delegate: canvasDelegate?
    override public func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        drawing = true
        lastPoint = touches.first?.location(in: self)
    }
    
    override public func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let lastPoint = lastPoint, let newPoint = touches.first?.location(in: self) else { return }
        moves.append(Move(start: lastPoint, end: newPoint))
        self.lastPoint = newPoint
        setNeedsDisplay()
    }
    
    override public func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        drawing = false
//        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0, execute: {
//            if drawing == false {
//                self.recognizeButtonPresst()
//            }
//        })
    }
    
    override public func draw(_ rect: CGRect) {
        super.draw(rect)
        
        let drawPath = UIBezierPath()
        drawPath.lineCapStyle = .round
        moves.forEach{(start, end) in
            drawPath.move(to: start)
            drawPath.addLine(to: end)
        }
        drawPath.lineWidth = CGFloat(strokeWidth)
        strokeColor.set()
        drawPath.stroke()
    }
    
    public func clear() {
        moves = [] // clear moves
        lastPoint = nil // clear lastPoint
        setNeedsDisplay()
    }
    
    /* getImage Function
     the the drawn image
     - output: the image as UIImage
     */
    public func getImage() -> UIImage {
        let drawPath = UIBezierPath()
        moves.forEach { (start, end) in
            drawPath.move(to: end)
            drawPath.addLine(to: start)
        }
        
        drawPath.scaleForRect(bounds, offset: offset)
        
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = drawPath.cgPath
        shapeLayer.strokeColor = UIColor.white.cgColor
        shapeLayer.lineWidth = 14.0
        
        let imageLayer = CALayer()
        imageLayer.backgroundColor = UIColor.black.cgColor
        imageLayer.addSublayer(shapeLayer)
        imageLayer.frame = frame
        imageLayer.bounds = bounds
        let renderer = UIGraphicsImageRenderer(bounds: imageLayer.bounds)
        return renderer.image { rendererContext in imageLayer.render(in: rendererContext.cgContext)}
    }
}

public func smallCanvas() -> UIView {
    let view = UIView()
    let viewCanvas = canvasView()
    view.addSubview(viewCanvas)
    viewCanvas.translatesAutoresizingMaskIntoConstraints = false
    
    NSLayoutConstraint.activate([
        viewCanvas.topAnchor.constraint(equalTo: view.topAnchor, constant: 1),
        viewCanvas.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 1),
        viewCanvas.widthAnchor.constraint(equalToConstant: 300),
        viewCanvas.heightAnchor.constraint(equalToConstant: 300)
        ])
    
    viewCanvas.layer.cornerRadius = 10.0
    view      .layer.cornerRadius = 10.0
    
    view.addBlur()
    
    return view
}
