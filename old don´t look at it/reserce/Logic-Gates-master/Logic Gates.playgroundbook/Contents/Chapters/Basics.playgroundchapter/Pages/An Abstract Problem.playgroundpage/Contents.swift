/*:
 Let's focus on a more general problem.
 
 For input variables `a`, `b`, use [AND](glossary://AND%20gate), [OR](glossary://OR%20gate), [NOT](glossary://NOT%20gate) gates to implement the logic given by the [truth table](glossary://truth%20table) on the right.
 - Note:
Introducing **additional local variables** is really helpful.\
Here are two examples (`c`, `d`), you may change them or add more.
 */
//#-hidden-code
import PlaygroundSupport
import Foundation
allowGates = [true,true,true,false,false,false,false]

func updateView(_ message: String) {
    let page = PlaygroundPage.current
    if let proxy = page.liveView as? PlaygroundRemoteLiveViewProxy {
        proxy.send(.string(message))
    }
}

func Test(_ a: Var, _ b: Var) -> Var{
    //#-end-hidden-code
    //#-code-completion(everything, hide)
    //#-code-completion(keyword, show, let)
    //#-code-completion(description, show, "AND(input1: Var, input2: Var)", "OR(input1: Var, input2: Var)", "NOT(input: Var)")
    //#-code-completion(identifier, show, a, b, c, d)
    //#-code-completion(currentmodule, show)
    //#-code-completion(identifier, hide, correctAnswer, success, cnt, timer, updateString)
    //#-code-completion(description, hide, "Test(a: Var, b: Var)", "updateView(message: String)", "checkcnt(fl: Int)")
    //#-editable-code
    let c = OR(a,b)
    let d = AND(a,b)
    //#-end-editable-code
    //Calculate the output
    let z = /*#-editable-code*/ AND(c, NOT(d)) /*#-end-editable-code*/
    
/*:
Tap *"Run My Code"* to check the result. Your answer is correct only when it produces right output for **all possible inputs**.\
\
Both `1` and `T` are used to denote `true`, while both `0` and `F` are used to denote `false`.\
\
[Next chapter](@next) will introduce more **logic gates**.
*/
    //#-hidden-code
    return z
}
let correctAnswer = [Var(false), Var(true), Var(true), Var(false)]
var success = true
var cnt = 0
var timer: Timer!
var updateString = String()

func checkcnt(_ fl: Int) {
    if cnt==fl {
        timer.invalidate()
        CFRunLoopStop(CFRunLoopGetCurrent())
    }
}

timer = Timer.scheduledTimer(withTimeInterval: 1.5, repeats: true) { _ in
    checkcnt(3)
    let a = Var(cnt/2), b = Var(cnt%2), z = Test(a,b)
    updateString = a.str() + b.str() + z.str() + Var(z == correctAnswer[cnt]).str()
    updateView(updateString)
    if z != correctAnswer[cnt] {
        success = false
        timer.invalidate()
        CFRunLoopStop(CFRunLoopGetCurrent())
    }
    cnt += 1
}

CFRunLoopRun()

if success {
    PlaygroundPage.current.assessmentStatus = .pass(message: "More gates are [arriving](@next)...")
}
else{
    PlaygroundPage.current.assessmentStatus = .fail(hints: ["Use introduced variables as helpers."], solution: "`let z = AND(c, NOT(d))`")
}
//#-end-hidden-code










