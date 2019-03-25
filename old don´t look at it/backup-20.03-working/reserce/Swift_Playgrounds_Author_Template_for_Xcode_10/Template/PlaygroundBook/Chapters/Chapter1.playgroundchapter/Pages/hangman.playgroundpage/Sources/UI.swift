/* About This File:
 E: this file is part of the WWDC 2019 project created by Veit Progl
 D: Diese Datei ist teil von den WWDC 2019 Project erstellt von Veit Progl
 */

import Foundation
import PlaygroundSupport
import UIKit
import ARKit
import SceneKit

public func createArray(hangmanWord: String) -> [String:Bool] {
    var wordArray = [String:Bool]()
    for i in hangmanWord {
        wordArray[String(i)] = false
    }
    return wordArray
}
