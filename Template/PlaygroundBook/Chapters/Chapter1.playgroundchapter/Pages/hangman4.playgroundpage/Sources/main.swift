//
//  ArView.swift
//  Book_Sources
//
//  Created by Veit Progl on 17.03.19.
//

import Foundation

import PlaygroundSupport
import UIKit
import AudioToolbox

public var wordList = ["did","up","egg","see","wwdc","made","put","good","on","in", "apple"]
public var currentWord = "Test"
public var dyslexiaMode = false

public let viewCanvas = canvasView()

@available(iOS 11.0, *)

public class mainViewController: UIViewController {
    var displayText = [String]()
    var predictionLetter = ""
    var missedLetters = 0
    
    override public func viewDidLoad() {
        super.viewDidLoad()
        let view = UIView()
        view.addBackground(imageName: "Blackboard.png")
        view.backgroundColor = .white
        let viewResultLetter = resultLetterView
        let buttonRecognize = recognizeButton
        
        view.addSubview(viewResultLetter)
        view.addSubview(wordLabel)
        view.addSubview(viewCanvas)
        view.addSubview(buttonRecognize)
        
        view.addSubview(counterLabel)
        
        viewCanvas.translatesAutoresizingMaskIntoConstraints = false
        counterLabel.translatesAutoresizingMaskIntoConstraints = false
        viewResultLetter.translatesAutoresizingMaskIntoConstraints = false
        wordLabel.translatesAutoresizingMaskIntoConstraints = false
        buttonRecognize.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            viewCanvas.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            viewCanvas.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            viewCanvas.widthAnchor  .constraint(equalToConstant: 400),
            viewCanvas.heightAnchor .constraint(equalToConstant: 400),
            
//            wordLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
//            wordLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
//            wordLabel.widthAnchor  .constraint(equalToConstant: 500),
//            wordLabel.heightAnchor .constraint(equalToConstant: 50),
            
//            viewResultLetter.topAnchor    .constraint(equalTo: view.topAnchor, constant: 150),
//            viewResultLetter.bottomAnchor.constraint(equalTo: counterLabel.topAnchor, constant: -20),
//            viewResultLetter.centerXAnchor.constraint(equalTo: view.centerXAnchor),
//            viewResultLetter.widthAnchor  .constraint(equalToConstant: 120),
//            viewResultLetter.heightAnchor .constraint(equalToConstant: 50),
            
//            counterLabel.topAnchor    .constraint(equalTo: view.topAnchor, constant: 220),
//            counterLabel.topAnchor    .constraint(equalTo: viewCanvas.topAnchor, constant: 20),
//            counterLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
//            counterLabel.widthAnchor  .constraint(equalToConstant: 300),
//            counterLabel.heightAnchor .constraint(equalToConstant: 50),
            
            buttonRecognize.bottomAnchor  .constraint(equalTo: view.bottomAnchor, constant: -150),
            buttonRecognize.centerXAnchor .constraint(equalTo: view.centerXAnchor),
            buttonRecognize.widthAnchor   .constraint(equalToConstant: 150),
            buttonRecognize.heightAnchor  .constraint(equalToConstant: 50),
            
            counterLabel.bottomAnchor.constraint(equalTo: viewCanvas.topAnchor, constant: -30),
            counterLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            counterLabel.widthAnchor.constraint(equalToConstant: 300),
            counterLabel.heightAnchor.constraint(equalToConstant: 30),
            
            viewResultLetter.bottomAnchor.constraint(equalTo: counterLabel.topAnchor, constant: -15),
            viewResultLetter.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            viewResultLetter.widthAnchor.constraint(equalToConstant: 120),
            viewResultLetter.heightAnchor.constraint(equalToConstant: 50),
            
            wordLabel.bottomAnchor.constraint(equalTo: viewResultLetter.topAnchor, constant: -20),
            wordLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            wordLabel.widthAnchor.constraint(equalToConstant: 500),
            wordLabel.heightAnchor.constraint(equalToConstant: 50)
            ])
        
        viewCanvas.layer.borderColor = UIColor.black.cgColor
        viewCanvas.layer.borderWidth = 5
        viewCanvas.backgroundColor = UIColor(red: 249 / 255, green: 249 / 255, blue: 249 / 255, alpha: 0.7)
        
        if dyslexiaMode == true {
            let listnew = hardCoreMode()
            setCorrendWord(list: listnew)
        } else {
            setCorrendWord(list: wordList)
        }
        
        displayText = createDisplayText(hangmanWord: currentWord)
        testLetter(word: currentWord, letter: predictionLetter)
        
        self.view = view
    }
    
    func hardCoreMode() -> [String] {
        var wordCount = 0
        var localList = [String]()
        for word in wordList {
            
            let newWord2 =  word.lowercased().map { char -> Character in
                switch char {
                case "p": return "q"
                case "q": return "p"
                case "d": return "b"
                case "b": return "d"
                case "n": return "m"
                case "m": return "n"
                case "e": return "i"
                case "i": return "e"
                case "k": return "g"
                case "g": return "k"
                default: return char
                }
            }
            
            var newWord3 = String()
            for i in newWord2 {
                newWord3 = newWord3 + String(i)
            }
            
            print(newWord3)
            localList.append(newWord3)
            wordCount = wordCount+1
        }
        return localList
    }
    
    //Setup the needed UI
    
    let wordLabel: UILabel = {
        let label = UILabel()
        label.text = ""
        label.font = label.font.withSize(32)
        label.textColor = UIColor.white
        label.textAlignment = .center;
        return label
    }()
    
    let counterLabel: UILabel = {
        let label = UILabel()
        label.text = "Mistakes: "
        label.font = label.font.withSize(22)
        label.textColor = UIColor.white
        label.textAlignment = .center;
        return label
    }()
    
    let resultLetterView: UILabel = {
        let label = UILabel()
        label.text = "Letter:"
        label.font = label.font.withSize(22)
        label.textColor = UIColor.white
        label.textAlignment = .center;
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
                testLetter(word: currentWord, letter: predictionLetter)
            case .error(let message):
                self?.resultLetterView.text = message // show the error message
            }
        }
    }
    
    func createDisplayText(hangmanWord: String) -> [String] {
        var displayText = [String]()
        for _ in hangmanWord {
            displayText.append("_ ")
        }
        return displayText
    }
    
    var lastCheck = String()
    func testLetter(word: String, letter: String) {
        var stringText = ""
        let wordUpper = word.uppercased()
        let characters = Array(wordUpper)
        var count = 0
        print(characters)
        
        let chars = Array(letter)
        print(chars)
        if chars.isEmpty == false {
            if characters.contains(chars[0]) {
                for i in characters {
                    let stringI = String(i)
                    if stringI.uppercased() == letter {
                        lastCheck = letter
                        displayText[count] = letter
                    }
                    count = count+1
                }
            } else if lastCheck != letter {
                missedLetters = missedLetters+1
                lastCheck = letter
            }
        }
        
        for i in displayText {
            stringText = stringText + i
        }
        if stringText.uppercased() == word.uppercased() {
            wordLabel.text = stringText
            counterLabel.text = "You Won! with \(missedLetters) mistakes"
        } else {
            wordLabel.text = stringText
            counterLabel.text = "Mistakes: \(missedLetters) "
        }
    }
    
    func setCorrendWord(list: [String]) {
        var list2 = list
        list2.shuffle()
        let word = list2.randomElement()
        currentWord = String(word!)
        //        currentWord = newWord
    }
    
}

public func displayBlackboard() {
    if #available(iOSApplicationExtension 11.0, *) {
        PlaygroundPage.current.liveView = mainViewController()
    } else {
        // Fallback on earlier versions
        print("You shoud upgrade your iOS, or buy a new iPad 😀")
    }
}
