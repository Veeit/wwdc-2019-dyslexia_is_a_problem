/*:

On this page, you will create a [XOR gate](glossary://XOR%20gate) using [NOR gates](glossary://NOR%20gate) **only**.\
 \
As is shown on the right, the circuit is already built. Your task is to decide the inputs in order to make the **whole circuit** function just as a [XOR gate](glossary://XOR%20gate).\
 \
 Related [truth tables](glossary://truth%20table) are posted as references.
 */
//#-hidden-code
import PlaygroundSupport
import Foundation
allowGates = [false,false,false,false,true,false,false]
//AND OR NOT NAND NOR XOR XNOR

func updateView(_ message: String) {
    let page = PlaygroundPage.current
    if let proxy = page.liveView as? PlaygroundRemoteLiveViewProxy {
        proxy.send(.string(message))
    }
}

var gateX: VarID!
var gateY: VarID!
var gateC: VarID!
var gateD: VarID!

func myXORGate(_ a: VarID, _ b: VarID) -> VarID{
    //#-end-hidden-code
    //#-code-completion(everything, hide)
    //#-code-completion(identifier, show, a, b)
    //#-code-completion(keyword, show, let)
//Use a and b as input variables.
    let c = NOR(/*#-editable-code*/<#T##input 1#>/*#-end-editable-code*/,/*#-editable-code*/<#T##input 2#>/*#-end-editable-code*/)
    let d = NOR(/*#-editable-code*/<#T##input 1#>/*#-end-editable-code*/,/*#-editable-code*/<#T##input 2#>/*#-end-editable-code*/)
    let x = NOR(c,d)
    let y = NOR(/*#-editable-code*/<#T##input 1#>/*#-end-editable-code*/,/*#-editable-code*/<#T##input 2#>/*#-end-editable-code*/)
    let z = NOR(x,y)
/*:
 Tap *"Run My Code"* to check the result. Your answer is correct only when it produces right output for **all possible inputs**.\
 \
 Both `1` and `T` denote `true`, while both `0` and `F` denote `false`.\
 \
 On [next chapter](@next), another interesting problem is presented with similar philosophy.
 */
    //#-hidden-code
    gateX = x
    gateY = y
    gateC = c
    gateD = d
    return z
}

//Drawing
let tmp = myXORGate(VarID(0, 1), VarID(0, 2))
var updateString = String(gateC.id) + String(gateD.id) + String(gateY.id)
updateView(updateString)

var success = true
let correctAnswer = [VarID(false, 1), VarID(true, 1), VarID(true, 1), VarID(false, 1)]
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
    let a = VarID(cnt/2, 1), b = VarID(cnt%2, 1), ans = myXORGate(a,b)
    updateString = a.str() + b.str() + gateC.str() + gateD.str() + gateX.str() + gateY.str() + ans.str() + Var(ans == correctAnswer[cnt]).str()
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
    PlaygroundPage.current.assessmentStatus = .pass(message: "Substitution of gates is fun, especially when we build something under **a tight budget**. Challenges [ahead](@next).")
}
else{
    PlaygroundPage.current.assessmentStatus = .fail(hints: ["You can turn a [NOR gate](glossary://NOR%20gate) into a [NOT gate](glossary://NOT%20gate) by setting both its inputs to be the same.", "Pay attention to the symmetry."], solution: "```swift\nlet c = NOR(a,a)\nlet d = NOR(b,b)\nlet y = NOR(a,b)")
}

//#-end-hidden-code









