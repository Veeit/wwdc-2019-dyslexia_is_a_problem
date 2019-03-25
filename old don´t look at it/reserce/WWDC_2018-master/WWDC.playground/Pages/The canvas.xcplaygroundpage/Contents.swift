/*:
 Now I will show you how the canvas works!
 
I hope you understand the code, most of it is self explaining,
 but I added some commets to help you.
 
 this page is in swift 4 buggy sorry I need to fix this later :D 
 */


//: First I imported two frameworks:

import PlaygroundSupport
import UIKit

//: Than I created a delegate:

protocol canvasDelegate: class {
    func canvas(_ canvas: canvasView, didChangeInput image: UIImage)
}

//: Afterwards I created a typealias for the start and end point of each move:

typealias Move = (start: CGPoint, end: CGPoint)

//: Next I created the canvas:

class canvasView: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        // Now let us change the background color! You can set the background color to every color you want:
        
        backgroundColor = /*#-editable-code the background color*/.black/*#-end-editable-code*/
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
// Then I had to create some variables. If you want to, you can change them. Play with it!
    
    var strokeWidth = /*#-editable-code the background color*/10.0/*#-end-editable-code*/ {didSet {setNeedsDisplay()}}
    var strokeColor:UIColor = /*#-editable-code the line color*/.white/*#-end-editable-code*/ {didSet {setNeedsDisplay()}}
    var moves:[Move] = []
    var lastPoint: CGPoint?
    var drawing = false
    let offset: CGFloat = /*#-editable-code the offset*/25.0/*#-end-editable-code*/
    
    weak var delegate: canvasDelegate?
    
    /*
     Now I changed the function to track the beginning of each touch:
     */
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        drawing = true // set Drawing to True
        lastPoint = touches.first?.location(in: self) // store touched location in variable
    }
    /*
     Afterwards I also changed the function, which tracks the move itself:
     */
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let lastPoint = lastPoint, let newPoint = touches.first?.location(in: self) else { return }
        moves.append(Move(start: lastPoint, end: newPoint)) // Append move to array
        self.lastPoint = newPoint //save new Point in LastPoint
        setNeedsDisplay()
    }
    
    /*
     And also the end of the touch:
     */
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        // Set Drawing to False!
        drawing = false
    }
    
    /*
     Additionally I overwrote the draw-function!
     Let the magic begin and the lines be drawn.
     */
    override func draw(_ rect: CGRect) {
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
    
}
/*:
 And this is all what you need for creating a canvas! Swift is amazing. 👍🏻
 */

//#-hidden-code
class mainViewController: UIViewController {
    override public func viewDidLoad() {
        let view = UIView()
        view.backgroundColor = .white //Set the background Colro of the view
        
        // Load the Views
        let viewCanvas = canvasView()
        view.addSubview(viewCanvas) // add the canvas
        
        // Setup the UI
        view.addConstrainsWithFormat(format: "V:|-[v0]-|", views: viewCanvas) // set the height
        view.addConstrainsWithFormat(format: "H:|-[v0]-|", views: viewCanvas) // set the width
        
        self.view = view
    }
    
}

extension UIView {
    
    /* asImage Function
     - parameters:
     - prob: array of letter and the prediction confidence score
     - output as UIImage
     */
     func addConstrainsWithFormat(format: String, views: UIView...) {
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
    func scaleForRect(_ rect: CGRect, offset: CGFloat) {
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
    
    func scaleAroundCenter(factor: CGFloat, offset: CGFloat) {
        let scaleTransform = CGAffineTransform(scaleX: factor, y: factor)
        self.apply(scaleTransform)
        
        let diff = CGPoint(
            x: offset - bounds.origin.x,
            y: offset - bounds.origin.y)
        
        let translateTransform = CGAffineTransform(translationX: diff.x, y: diff.y)
        self.apply(translateTransform)
    }
}

PlaygroundPage.current.liveView = mainViewController()
//#-end-hidden-code
