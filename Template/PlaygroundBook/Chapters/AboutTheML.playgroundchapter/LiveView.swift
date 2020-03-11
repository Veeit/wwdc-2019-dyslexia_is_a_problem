import PlaygroundSupport
import UIKit

class mainViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        let view = UIView()
        view.backgroundColor = .white
        
//        let viewCanvas = canvasView()
//        view.addSubview(viewCanvas)
//
//        // Setup the UI
//        viewCanvas.translatesAutoresizingMaskIntoConstraints = false
//        NSLayoutConstraint.activate([
//            viewCanvas.topAnchor.constraint(equalTo: view.topAnchor, constant: 1),
//            viewCanvas.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 1),
//            viewCanvas.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width),
//            viewCanvas.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height)
//        ])
//
//        view.addBackground()
        self.view = view
    }
    
}

PlaygroundPage.current.liveView = mainViewController()
