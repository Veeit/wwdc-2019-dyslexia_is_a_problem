import UIKit

class GridViewCell: UICollectionViewCell {

    var label:UILabel!
    var paddingLeft:CGFloat = 3
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = UIColor.white
        self.clipsToBounds = true
        self.layer.borderWidth = 1
        
        self.label = UILabel(frame: .zero)
        self.label.textAlignment = .center
        self.addSubview(self.label)

    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
    
        label.frame = CGRect(x: paddingLeft, y: 0,
                             width: frame.width - paddingLeft * 2,
                             height: frame.height)

    }
}
