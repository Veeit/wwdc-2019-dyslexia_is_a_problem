import PlaygroundSupport
import UIKit
import Foundation

public let trueColor = UIColor(red: 0.060, green: 0.185, blue: 0.771, alpha: 1.000)
public let falseColor = UIColor.red
public let trueFalse = ["F","T"," "]
public let colorTF = [UIColor.red, UIColor(red: 0.060, green: 0.185, blue: 0.771, alpha: 1.000), UIColor.white]
public let inputName = [" ", "A", "B"]

public extension UIView {
    public func widthHalf() -> CGFloat {
        return frame.size.width/2
    }
    public func widthCard() -> CGFloat {
        return frame.size.width*3/7
    }
}

public func placeMiddleCard(_ view: UIView, _ offsetY: Double, _ widthItem: Double, _ heightItem: Double) -> CGRect{
    return CGRect(x: (view.widthCard().native-widthItem)/2,
                  y:offsetY,
                  width:widthItem,
                  height:heightItem)
}

public func placeMiddleHalf(_ view: UIView, _ offsetY: Double, _ widthItem: Double, _ heightItem: Double) -> CGRect{
    return CGRect(x: (view.widthHalf().native-widthItem)/2,
                  y:offsetY,
                  width:widthItem,
                  height:heightItem)
}

public func centeredAttributedString(_ string: String, fontSize: CGFloat, color: UIColor = UIColor.black) -> NSAttributedString{
    let paragraphStyle = NSMutableParagraphStyle()
    paragraphStyle.alignment = .center
    return NSAttributedString(string: string, attributes: [.paragraphStyle: paragraphStyle,
                                                           .foregroundColor: color,
                                                           .font: UIFont.systemFont(ofSize: fontSize, weight: .bold)])
}
