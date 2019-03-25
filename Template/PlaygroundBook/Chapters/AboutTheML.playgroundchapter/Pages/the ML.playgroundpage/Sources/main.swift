/* About This File:
 E: this file is part of the WWDC 2019 project created by Veit Progl
 D: Diese Datei ist teil von den WWDC 2019 Project erstellt von Veit Progl
 */

import PlaygroundSupport
import UIKit

public let str = "Hello, playground"
var predictionLetter = ""
let viewCanvas = canvasView()

@available(iOS 11.0, *)
public class mainViewController: UIViewController {
    override public func viewDidLoad() {
        super.viewDidLoad()
        let view = UIView()
        view.backgroundColor = .white
        view.addBackground(imageName: "Blackboard.png")
        
        view.addSubview(viewCanvas)
        
        view.addSubview(resultLetterView)
        view.addSubview(recognizeButton)
        
        // Setup the UI
        viewCanvas.translatesAutoresizingMaskIntoConstraints = false
        resultLetterView.translatesAutoresizingMaskIntoConstraints = false
        recognizeButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            viewCanvas.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            viewCanvas.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            viewCanvas.widthAnchor  .constraint(equalToConstant: 400),
            viewCanvas.heightAnchor .constraint(equalToConstant: 400),
            
            recognizeButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -150),
            recognizeButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            recognizeButton.widthAnchor.constraint(equalToConstant: 150),
            recognizeButton.heightAnchor.constraint(equalToConstant: 50),
            
            resultLetterView.bottomAnchor.constraint(equalTo: viewCanvas.topAnchor, constant: -50),
            resultLetterView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            resultLetterView.widthAnchor.constraint(equalToConstant: 90),
            resultLetterView.heightAnchor.constraint(equalToConstant: 30)
            ])
        
//        view.addBackground()
        viewCanvas.layer.borderColor = UIColor.black.cgColor
        viewCanvas.layer.borderWidth = 5
        viewCanvas.backgroundColor = UIColor(red: 249 / 255, green: 249 / 255, blue: 249 / 255, alpha: 0.7)
        storkeColorPublic = UIColor(red: 36 / 255, green: 50 / 255, blue: 82 / 255, alpha: 1.0)
        
        self.view = view
    }
    
    let resultLetterView: UILabel = {
        let label = UILabel()
        label.text = "Letter:"
        label.font = label.font.withSize(22)
//        label.textColor = UIColor(red: 253 / 255, green: 76 / 255, blue: 38 / 255, alpha: 1)
        label.textColor = UIColor.white
        return label
    }()
    
    let recognizeButton: UIButton = {
        let button  = UIButton()
        button.backgroundColor = .white
        button.setTitleColor(UIColor(red: 253 / 255, green: 76 / 255, blue: 38 / 255, alpha: 1) ,for: .normal)
        button.setTitle("recognize Letter", for: .normal)
        button.backgroundColor = UIColor(red: 249 / 255, green: 249 / 255, blue: 249 / 255, alpha: 0.7)
        button.layer.cornerRadius = 25
        button.addTarget(self, action: #selector(recognizeButtonPresst), for: .touchUpInside)
        return button
    }()
    
    // Button Function
    @objc func recognizeButtonPresst(sender: UIButton!) {
        let image = viewCanvas.getImage() // store the image in a constant
        recognize(image) // call the recognize function
        viewCanvas.clear() // Clear the Canvas
    }
    
    // Setup the recognize function
    func recognize(_ image: UIImage) {
        recognizer.recognize(image) {
            [weak self] result in
            switch (result) { // check if the succesed
            case .success(let prediction):
                self?.resultLetterView.text = "Letter: \(prediction.letter)" //show the result
                predictionLetter = prediction.letter
            case .error(let message):
                self?.resultLetterView.text = message // show the error message
            }
        }
    }
}

public func addML() {
    if #available(iOSApplicationExtension 11.0, *) {
        PlaygroundPage.current.liveView = mainViewController()
    } else {
        // Fallback on earlier versions
        print("You shoud upgrade your iOS, or buy a new iPad 😀")
    }
}
