import PlaygroundSupport
import UIKit

public let viewCanvas = canvasView()
public var word = ""

public class mainViewController: UIViewController {
    var predictionLetter = ""
    
    // Setup the UI
    override public func viewDidLoad() {
        let view = UIView()
        view.backgroundColor = .white
        
        // Load the Views
        view.addSubview(viewCanvas)
        view.addSubview(resultLetterView)
        view.addSubview(wordView)
        view.addSubview(buttonView)
        view.addSubview(clearWordButton)
        
        
        // Setup the UI
        view.addConstrainsWithFormat(format: "V:|-10-[v0(50)]-[v1(50)]-80-[v2(50)]-10-[v3(400)]-|", views: resultLetterView, wordView, buttonView, viewCanvas)
        view.addConstrainsWithFormat(format: "H:|-10-[v0]-10-|", views: resultLetterView)
        view.addConstrainsWithFormat(format: "H:|-10-[v0]-[v1(50)]-10-|", views: wordView, clearWordButton)
        view.addConstrainsWithFormat(format: "H:|-10-[v0]-10-|", views: buttonView)
        view.addConstrainsWithFormat(format: "H:|-[v0(400)]-|", views: viewCanvas)
        view.addConstrainsWithFormat(format: "V:|-68-[v0(50)]-550-|", views: clearWordButton)
        
        self.view = view
    }
    
    // Setup the Lables / Buttons / VIews
    let resultLetterView: UILabel = {
        let label = UILabel()
        label.text = "Letter:"
        label.backgroundColor = .white
        label.layer.borderWidth = 2
        label.layer.borderColor = UIColor.gray.cgColor
        return label
    }()
    
    let wordView: UILabel = {
        let label = UILabel()
        label.text = "Word:"
        label.backgroundColor = .white
        label.layer.borderWidth = 2
        label.layer.borderColor = UIColor.gray.cgColor
        return label
    }()
    
    let clearWordButton: UIButton = {
        let button  = UIButton()
        button.backgroundColor = .gray
        button.setTitle("clear", for: .normal)
        button.addTarget(self, action: #selector(clearWordPresst), for: .touchUpInside)
        return button
    }()
    
    let buttonView: UIView = {
        let view = UIView()
        
        //Setup the BUttons
        let recognizeButton: UIButton = {
            let button  = UIButton()
            button.backgroundColor = .white
            button.setTitleColor(.blue ,for: .normal)
            button.setTitle("recognize Letter", for: .normal)
            button.addTarget(self, action: #selector(recognizeButtonPresst), for: .touchUpInside)
            return button
        }()
        
        let addLetterButton: UIButton = {
            let button  = UIButton()
            button.backgroundColor = .white
            button.setTitle("add to Word", for: .normal)
            button.setTitleColor(.blue ,for: .normal)
            button.addTarget(self, action: #selector(addLetterButtonPresst), for: .touchUpInside)
            return button
        }()
        
        let doneButton: UIButton = {
            let button  = UIButton()
            button.backgroundColor = .white
            button.setTitle("Done", for: .normal)
            button.setTitleColor(.blue ,for: .normal)
            button.addTarget(self, action: #selector(doneButtonPresst), for: .touchUpInside)
            return button
        }()
        
        //add the Buttons
        view.addSubview(recognizeButton)
        view.addSubview(addLetterButton)
        view.addSubview(doneButton)
        
        // add Constrains
        view.addConstrainsWithFormat(format: "H:|-[v0]-20-[v1]-20-[v2]-|", views: recognizeButton, addLetterButton, doneButton)
        view.addConstrainsWithFormat(format: "V:|-[v0]-|", views: recognizeButton)
        view.addConstrainsWithFormat(format: "V:|-[v0]-|", views: addLetterButton)
        view.addConstrainsWithFormat(format: "V:|-[v0]-|", views: doneButton)
        
        return view
    }()
    
    // Setup the recognize function
    let recognizer: LetterRecognizer = LetterRecognizer()
    
    private func recognize(_ image: UIImage) {
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
    
    // Button Functions
    @objc func recognizeButtonPresst(sender: UIButton!) {
        let image = viewCanvas.getImage() // store the image in a constant
        recognize(image) // call the recognize function
        viewCanvas.clear() // Clear the Canvas
    }
    
    @objc func clearWordPresst(sender: UIButton!) {
        word = "" // Clear the Word
        wordView.text = "Word: \(word)" // Display the Words
        viewCanvas.clear() // Clear the canvas
    }
    
    @objc func addLetterButtonPresst(sender: UIButton!) {
        word.append(predictionLetter)
        wordView.text = "Word: \(word)" // Display the Words
        viewCanvas.clear() // Clear the Canvas
    }
    
    @objc func doneButtonPresst(sender: UIButton!) {
        PlaygroundPage.current.liveView = arViewController() // Go to arViewCOntroller
    }
    
}

extension mainViewController: canvasDelegate {
    public func canvas(_ canvas: canvasView, didChangeInput image: UIImage) {
        recognize(image)
    }
}
