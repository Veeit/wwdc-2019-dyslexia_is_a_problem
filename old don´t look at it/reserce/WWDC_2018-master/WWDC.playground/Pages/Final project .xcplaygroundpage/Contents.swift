//#-hidden-code
import UIKit
import PlaygroundSupport
import Vision

// Present the view controller in the Live View window
PlaygroundPage.current.liveView = mainViewController()
PlaygroundPage.current.needsIndefiniteExecution = true
//#-end-hidden-code

/*:
 You finaly arrived at the end of the journey. This is my final project! You can change some veriables to to adjust the result as you want:
 */

/*:
 Usage of the programm:
 
 - run the code
 - draw a letter into the canvas
 - press recognize letter
 - press "add to word" (if it is the corect letter, otherwise just draw the letter again)
 - if you wrote the word incorrectly, press "clear"
 - now press "Done"
 - move your iPad to detect a plane
 - click into the blue square
 - enjoy your word in AR!
 
 */

/*:
 Now let us change the Font of the AR text. It is very Simpel. You must only change the
 String fontName.
 
 Possible Fonts:
   - "CreteRound-Regular"
   - "SedgwickAveDisplay-Regular"
*/
//#-code-completion(identifier, show, "CreteRound-Regular", "SedgwickAveDisplay-Regular")

fontName = /*#-editable-code Font name*/"SedgwickAveDisplay-Regular"/*#-end-editable-code*/

/*:
 O.k this is cool, right? What is with the color though? You can change the color easy too!
 */

textColor = UIColor(red: CGFloat(/*#-editable-code Text color red*/0.0/255.0/*#-end-editable-code*/), green: CGFloat(/*#-editable-code Text color green*/0.0/255.0/*#-end-editable-code*/), blue: CGFloat(/*#-editable-code Text color blue*/100.0/255.0/*#-end-editable-code*/), alpha: CGFloat(/*#-editable-code Text color alpha*/1.0/*#-end-editable-code*/))

/*:
 You want more ? No problem, you can also change the size:
 */

textHeight = /*#-editable-code Height*/0.02/*#-end-editable-code*/
textLength = /*#-editable-code Length*/0.02/*#-end-editable-code*/
textWidth = /*#-editable-code Width*/0.02/*#-end-editable-code*/
