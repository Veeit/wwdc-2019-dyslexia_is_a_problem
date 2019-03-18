/*:
 On this page, you can create *"Build Your Circuit"* puzzles. You may create very difficult ones and pass them to your geek friends :)\
\
**To create a puzzle, three items should be set: prices of the gates, total budget, and the "ans" column.**
 */
//#-hidden-code
import PlaygroundSupport
allowGates = [true,true,true,true,true,true,true]
gatesCount = [0,0,0,0,0,0,0,0]

var cost = 0
var sentence = String()
var updateString = String()
var cols:Dictionary<String, [String]> = [:]
var iter = 0
var watchSequence = [String]()

func updateView(_ message: String) {
    let page = PlaygroundPage.current
    if let proxy = page.liveView as? PlaygroundRemoteLiveViewProxy {
        proxy.send(.string(message))
    }
}

func updateCost(_ message: Int) {
    let page = PlaygroundPage.current
    if let proxy = page.liveView as? PlaygroundRemoteLiveViewProxy {
        proxy.send(.integer(message))
    }
}

func watch(variable x: Var, title name: String) {
    if let states = cols[name] {
        precondition(iter+1 == cols[name]!.count, "Title should be unique!")
        cols[name]! += [x.str()]
    }
    else {
        cols[name] = [name, x.str()]
        watchSequence += [name]
    }
}

//#-end-hidden-code
//#-code-completion(everything, hide)
let gatePrice = [/*#-editable-code*/<#T##AND##Int#>/*#-end-editable-code*/,/*#-editable-code*/<#T##OR##Int#>/*#-end-editable-code*/,/*#-editable-code*/<#T##NOT##Int#>/*#-end-editable-code*/,/*#-editable-code*/<#T##NAND##Int#>/*#-end-editable-code*/,/*#-editable-code*/<#T##NOR##Int#>/*#-end-editable-code*/,/*#-editable-code*/<#T##XOR##Int#>/*#-end-editable-code*/,/*#-editable-code*/<#T##XNOR##Int#>/*#-end-editable-code*/]
let budget = /*#-editable-code*/<#T##Total Budget##Int#>/*#-end-editable-code*/
//#-code-completion(identifier, show, true, false)
let ans = [/*#-editable-code*/<#T##state 000##Bool#>/*#-end-editable-code*/,
           /*#-editable-code*/<#T##state 001##Bool#>/*#-end-editable-code*/,
           /*#-editable-code*/<#T##state 010##Bool#>/*#-end-editable-code*/,
           /*#-editable-code*/<#T##state 011##Bool#>/*#-end-editable-code*/,
           /*#-editable-code*/<#T##state 100##Bool#>/*#-end-editable-code*/,
           /*#-editable-code*/<#T##state 101##Bool#>/*#-end-editable-code*/,
           /*#-editable-code*/<#T##state 110##Bool#>/*#-end-editable-code*/,
           /*#-editable-code*/<#T##state 111##Bool#>/*#-end-editable-code*/]
//#-hidden-code
updateString = gatePrice.reduce("&", {$0 + " " + String($1)})
updateView(updateString)

updateString = "$ " + String(budget)
updateView(updateString)

updateString = ans.reduce("#", {$0 + " " + Var($1).str()})
updateView(updateString)
//#-end-hidden-code
/*:
**Now try to solve the puzzle.**
 */
//#-code-completion(everything, hide)
//#-code-completion(description, show, "NAND(input1: Var, input2: Var)")
//#-code-completion(description, show, "AND(input1: Var, input2: Var)")
//#-code-completion(description, show, "NOR(input1: Var, input2: Var)")
//#-code-completion(description, show, "OR(input1: Var, input2: Var)")
//#-code-completion(description, show, "XOR(input1: Var, input2: Var)")
//#-code-completion(description, show, "XNOR(input1: Var, input2: Var)")
//#-code-completion(description, show, "NOT(input: Var)")
//#-code-completion(identifier, show, a, b, c)
//#-code-completion(keyword, show, let)
//#-code-completion(currentmodule, show)
//#-code-completion(identifier, hide, correctAnswer, success, result, budget, cost, gatePrice, updateString, cols, iter, sentence, watchSequence, ans)
//#-code-completion(description, hide, "myCircuit(a: Var, b: Var, c: Var)", "updateCost(message: Int)", "updateView(message: String)")
func myCircuit(_ a: Var, _ b: Var, _ c: Var) -> Var{
    //#-editable-code
//Do calculations and watch variables.
    //#-end-editable-code
    let result = /*#-editable-code*/a/*#-end-editable-code*/
    return result
}
/*:
 Tap *"Run My Code"* to check the result. Your answer is correct only when it produces right output for **all possible inputs** and the **overall cost** is no more than the **budget**.\
 **Tip:**\
 Run the code constantly as you design your circuit in order to keep track of the cost and the variables.\
 **References:**\
 [AND gate](glossary://AND%20gate), [OR gate](glossary://OR%20gate), [NOT gate](glossary://NOT%20gate)\
 [NAND gate](glossary://NAND%20gate), [NOR gate](glossary://NOR%20gate), [XOR gate](glossary://XOR%20gate), [XNOR gate](glossary://XNOR%20gate)\
 [De Morgan's laws](glossary://De%20Morgan's%20laws)
 */
//#-hidden-code
let correctAnswer = ans.map({Var($0)})
updateString = "!"

var success = true
for i in 0..<8 {
    iter = i
    let tmp = myCircuit(Var(i/4), Var((i/2)%2), Var(i%2))
    updateString += tmp.str()
    if tmp != correctAnswer[i] {
        success = false
    }
}
updateView(updateString)//Result

for keys in watchSequence {
    updateString = cols[keys]!.reduce("~", {$0 + "@" + $1})
    updateView(updateString)//Cols
}


updateString = gatesCount.reduce("%", {$0 + " " + String($1/8)})
updateView(updateString)//gate counts

cost = 0
for i in 0...6{
    cost += gatesCount[i]*gatePrice[i]/8
}
updateCost(cost)//Cost

if !success {
    PlaygroundPage.current.assessmentStatus = .fail(hints: [], solution: nil)
    sentence = "*1"
}
else if cost>budget{
    PlaygroundPage.current.assessmentStatus = .fail(hints: [], solution: nil)
    sentence = "*2"
}else {
    PlaygroundPage.current.assessmentStatus = .pass(message: nil)
    sentence = "*0"
}
updateView(sentence)//Status Message
//#-end-hidden-code




