import PlaygroundSupport
import UIKit

public protocol canvasDelegate: class {
    func canvas(_ canvas: canvasView, didChangeInput image: UIImage)
}

public typealias Move = (start: CGPoint, end: CGPoint)

public class canvasView: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .black // backgorund color of the canvas
    }
    
    public required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // Drawing Variables
    
    var strokeWidth = 10.0 {didSet {setNeedsDisplay()}}
    var strokeColor:UIColor = .white {didSet {setNeedsDisplay()}}
    var moves:[Move] = []
    var lastPoint: CGPoint?
    var drawing = false
    let offset: CGFloat = 25.0
    
    weak var delegate: canvasDelegate?
    
    // touch View Functions
    
    override public func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        drawing = true // set Drawing to True
        lastPoint = touches.first?.location(in: self) // store touched location in variable
    }
    
    override public func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let lastPoint = lastPoint, let newPoint = touches.first?.location(in: self) else { return }
        moves.append(Move(start: lastPoint, end: newPoint)) // Append move to array
        self.lastPoint = newPoint //save new Point in LastPoint
        setNeedsDisplay()
    }
    
    override public func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        drawing = false // set Drawing to False
    }
    
    /* draw Function
     draw the drawn lines
     */
    override public func draw(_ rect: CGRect) {
        super.draw(rect)
        
        let drawPath = UIBezierPath()
        drawPath.lineCapStyle = .round // the line style
        moves.forEach{(start, end) in
            drawPath.move(to: start) // go to the start point
            drawPath.addLine(to: end) // draw a line to the end point
        }
        drawPath.lineWidth = CGFloat(strokeWidth)
        strokeColor.set()
        drawPath.stroke()
    }
    
    /* clear Function
     clear the canvas
     */
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
