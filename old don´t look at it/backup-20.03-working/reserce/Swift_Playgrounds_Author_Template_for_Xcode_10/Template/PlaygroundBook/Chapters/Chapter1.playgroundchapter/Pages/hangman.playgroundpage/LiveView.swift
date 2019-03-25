//#-hidden-code
//
//  See LICENSE folder for this template’s licensing information.
//
//  Abstract:
//  The Swift file containing the source code edited by the user of this playground book.
//

import PlaygroundSupport
import UIKit

//#-end-hidden-code
public let str = "Hello, playground"

print(test)

storkeColorPublic = UIColor(red: 36 / 255, green: 50 / 255, blue: 82 / 255, alpha: 1.0)

class mainViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        let view = UIView()
        view.backgroundColor = .white
        
        let viewCanvas = canvasView()
        view.addSubview(viewCanvas)
        
        // Setup the UI
        viewCanvas.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            viewCanvas.topAnchor.constraint(equalTo: view.topAnchor, constant: 1),
            viewCanvas.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 1),
            viewCanvas.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width),
            viewCanvas.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height)
            ])
        
        view.addBackground()
        view.clipsToBounds = true
        self.view = view
    }
    
}

PlaygroundPage.current.liveView = mainViewController()
