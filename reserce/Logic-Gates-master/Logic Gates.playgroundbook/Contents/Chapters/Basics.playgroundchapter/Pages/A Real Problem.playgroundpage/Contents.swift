/*:
 
Now let's use **Boolean operations** to model some variables in real life. Additionally, they can be represented by **cascading logic gates**.
 
 - Example: **A Playful Boy**\
My younger brother is obsessed with basketball🏀 and doesn't like doing his homework📚. So, it's quite easy to infer his mood.\
The boy is happy😁 **only** when:
     - He plays basketball🏀.
     - He does't have to do his homework📚.
 
 
 
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

func Test(_ 🏀: Var, _ 📚: Var) -> Var{
    //#-end-hidden-code
    //#-code-completion(everything, hide)
    //#-code-completion(keyword, show, let)
    //#-code-completion(description, show, "AND(input1: Var, input2: Var)", "OR(input1: Var, input2: Var)", "NOT(input: Var)")
    //#-code-completion(identifier, show, 🏀, 📚)
//Now implement this expression to model the boy's happiness.
    let 😁 = /*#-editable-code your expression here*/AND(🏀,NOT(📚))/*#-end-editable-code*/
/*:
 Tap *"Run My Code"* to check the result. Your answer is correct only when it produces right output for **all possible inputs**.\
\
 On [next page](@next), you will solve an abstract problem.
 */
    //#-hidden-code
    return 😁
}

let correctAnswer = [Var(false), Var(false), Var(true), Var(false)]
var success = true
var updateString = String()

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
    let ball = Var(cnt/2), book = Var(cnt%2), ans = Test(ball,book)
    updateString = ball.str() + book.str() + ans.str() + Var(ans == correctAnswer[cnt]).str()
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
    PlaygroundPage.current.assessmentStatus = .pass(message: "Keep [going](@next)!")
}
else{
    PlaygroundPage.current.assessmentStatus = .fail(hints: ["Try to connect two gates."], solution: "`var 😁 = AND(🏀,NOT(📚))`")
}
//#-end-hidden-code






