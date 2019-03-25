/*:
 - Note:
 You may have noticed that some gates are "replaceable", which means their functions can be **fully** replaced by some other gates.
 \
 \
As a matter of fact, *Charles Sanders Peirce* showed that [NOR gates](glossary://NOR%20gate) alone (or alternatively [NAND gates](glossary://NAND%20gate) alone) can be used to reproduce the functions of all the other logic gates. Consequently, these gates are sometimes called [universal logic gates](glossary://universal%20logic%20gate).
 \
 \
On the next two pages, you'll try to prove this theorem partly.
 
 
 Now, let's create a [OR gate](glossary://OR%20gate) using [NAND gates](glossary://NAND%20gate) **only**.\
 \
 As is shown on the right, the circuit is already built. Your task is to specify the inputs in order to make the **whole circuit** function just as a [OR gate](glossary://OR%20gate).\
 \
 Related [truth table](glossary://truth%20table) is posted as references.
 */
//#-hidden-code
import PlaygroundSupport
import Foundation
allowGates = [false,false,false,true,false,false,false]
//AND OR NOT NAND NOR XOR XNOR

func updateView(_ message: String) {
    let page = PlaygroundPage.current
    if let proxy = page.liveView as? PlaygroundRemoteLiveViewProxy {
        proxy.send(.string(message))
    }
}

var gateI: VarID!
var gateII: VarID!


func myORGate(_ a: VarID, _ b: VarID) -> VarID{
//#-end-hidden-code
//#-code-completion(everything, hide)
//#-code-completion(identifier, show, a, b)
//#-code-completion(keyword, show, let)
//Use a and b as input variables.
    let x = NAND(/*#-editable-code*/<#T##input 1#>/*#-end-editable-code*/,/*#-editable-code*/<#T##input 2#>/*#-end-editable-code*/)
    let y = NAND(/*#-editable-code*/<#T##input 1#>/*#-end-editable-code*/,/*#-editable-code*/<#T##input 2#>/*#-end-editable-code*/)
    let z = NAND(x,y)
/*:
 Tap *"Run My Code"* to check the result. Your answer is correct only when it produces right output for **all possible inputs**.\
 \
 Both `1` and `T` denote `true`, while both `0` and `F` denote `false`.\
 \
 On [next page](@next), a larger circuit is waiting for you.
 */
//#-hidden-code
    gateI = x
    gateII = y
    return z
}

//Drawing
let tmp = myORGate(VarID(0, 1), VarID(0, 2))
var updateString = String(gateI.id) + String(gateII.id)
updateView(updateString)

var success = true
let correctAnswer = [VarID(false, 1), VarID(true, 1), VarID(true, 1), VarID(true, 1)]
var cnt = 0
var timer: Timer!

func checkcnt(_ fl: Int) {
    if cnt==fl {
        timer.invalidate()
        CFRunLoopStop(CFRunLoopGetCurrent())
    }
}

timer = Timer.scheduledTimer(withTimeInterval: 1.5, repeats: true) { _ in
    checkcnt(3)
    let a = VarID(cnt/2, 1), b = VarID(cnt%2, 1), ans = myORGate(a,b)
    updateString = a.str() + b.str() + gateI.str() + gateII.str() + ans.str() + Var(ans == correctAnswer[cnt]).str()
    updateView(updateString)
    if ans != correctAnswer[cnt] {
        success = false
        timer.invalidate()
        CFRunLoopStop(CFRunLoopGetCurrent())
    }
    cnt += 1
}

CFRunLoopRun()
if success {
    PlaygroundPage.current.assessmentStatus = .pass(message: "Great! Let's try a [harder one](@next).")
}
else{
    PlaygroundPage.current.assessmentStatus = .fail(hints: ["You can turn a [NAND gate](glossary://NAND%20gate) into a [NOT gate](glossary://NOT%20gate) by setting both its inputs to be the same.", "Pay attention to the symmetry."], solution: "```swift\nlet x = NAND(a,a)\nlet y = NAND(b,b)")
}

//#-end-hidden-code









