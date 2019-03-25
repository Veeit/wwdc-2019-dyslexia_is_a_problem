/*:
 - Note:
In this chapter, you will deal with **three input signals** and build a logic circuit implementing the logic given by the [truth table](glossary://truth%20table). You can use **all** the logic gates introduced in this playground. You may also want to use [De Morgan's laws](glossary://De%20Morgan's%20laws).
 \
 \
In pratical circuit design, designers do [logic minimization](glossary://logic%20minimization) under time and space trade-offs. The "simplicity" are often measured by the number of gates, number of literals it contains, or by number of cascaded levels of gates.
 \
 \
In this chapter, such constraints and balances are simply abstracted to a **"cost"** for every gate and an overall **"budget"** for the entire circuit.
 
 
 
Now, let's design a 3-input circuit that takes `a`, `b`, `c` as inputs and produces output as the `ans` column of the [truth table](glossary://truth%20table) on the right.
 
Below is a clumsy attempt. It functions well but is way too expensive. **Try to redesign it!**
 
 As the complexity of design increases, a helper function `watch(variable: Var, title: String)` is introduced. You can add as many variables as you want to the [truth table](glossary://truth%20table) to help analyze the problem.
 */
//#-hidden-code
import PlaygroundSupport
allowGates = [true,true,true,true,true,true,true]
gatesCount = [0,0,0,0,0,0,0,0]
let gatePrice = [2,2,1,1,1,4,3]
var cost = 0
let budget = 6
var sentence = String()
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
//#-code-completion(identifier, hide, correctAnswer, success, result, budget, cost, gatePrice, updateString, cols, iter, sentence, watchSequence)
//#-code-completion(description, hide, "myCircuit(a: Var, b: Var, c: Var)", "updateCost(message: Int)", "updateView(message: String)")
func myCircuit(_ a: Var, _ b: Var, _ c: Var) -> Var{
    //#-editable-code
    let na = NOT(a), nb = NOT(b), nc = NOT(c)
    let caseOne = AND(AND(na, b), nc)
    let caseTwo = AND(AND(a, nb), nc)
    //Add variables you want to observe to the truth table like this:
    watch(variable: caseOne, title:"Case 1")
    watch(variable: caseTwo, title:"Case 2")
    //#-end-editable-code
    let result = /*#-editable-code*/NOR(caseOne, caseTwo)/*#-end-editable-code*/
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
let correctAnswer = [Var(true), Var(true), Var(false), Var(true), Var(false), Var(true), Var(true), Var(true)]
var updateString = "!"

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
cost = 0
for i in 0...6{
    cost += gatesCount[i]*gatePrice[i]/8
}
updateView(updateString)//Price Table
updateCost(cost)//Cost

if !success {
    PlaygroundPage.current.assessmentStatus = .fail(hints: ["Think about the two situations resulting false output."], solution: "`let result = OR(c, XNOR(a, b)`")
    sentence = "*1"
}
else if cost>budget{
    PlaygroundPage.current.assessmentStatus = .fail(hints: ["Maybe you can find replacement of gates to reduce the cost. Just focus on the two situations resulting `false` output."], solution: "`let result = OR(c, XNOR(a, b)`")
    sentence = "*2"
}else {
    PlaygroundPage.current.assessmentStatus = .pass(message: "Nice job! Try [another one](@next).")
    sentence = "*0"
}
updateView(sentence)//Status Message
//#-end-hidden-code













