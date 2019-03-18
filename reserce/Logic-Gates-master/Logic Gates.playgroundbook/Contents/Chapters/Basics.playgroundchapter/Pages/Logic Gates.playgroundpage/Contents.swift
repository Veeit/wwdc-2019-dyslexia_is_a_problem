/*:

 **Boolean operations** can be used to describe connections between [Boolean variables](glossary://Boolean%20variables). The basic operations of Boolean algebra are `AND`, `OR`, `NOT`.
 
 A **logic gate** is a physical device which implements a Boolean operation; that is, it performs a logical operation on 1 or 2 binary inputs and produces a single binary output.
 
 The basic logic gates are:
 
 - [AND gate](glossary://AND%20gate): A `true` output results **only** if all the inputs to the gate are `true`.
 - [OR gate](glossary://OR%20gate): A `true` output results if one or both of the inputs to the gate are `true`.
 - [NOT gate](glossary://NOT%20gate): If the applied input is `false` then the output becomes `true` and vice versa.
 
 The bahavior of these gates are represented by the [truth table](glossary://truth%20table) on the right.

 
 * Experiment:
   Let's start by setting the input values of the logic gates:
     1. Set the value of 🖋 and 📄 so that the output of the AND gate, 📝, is `true`.
     2. Set the value of 🍨 and 🍦 to ensure the OR gate output, 😍, is `true`.
     3. Set the value of 👍 to make 👎 `false`.
 
 
 
 
 */
//#-hidden-code
import PlaygroundSupport
allowGates = [true,true,true,false,false,false,false]

func updateView(_ message: String) {
    let page = PlaygroundPage.current
    if let proxy = page.liveView as? PlaygroundRemoteLiveViewProxy {
        proxy.send(.string(message))
    }
}





//#-end-hidden-code
//#-code-completion(everything, hide)
//#-code-completion(identifier, show, true, false)
let 🖋 = Var(/*#-editable-code*/true/*#-end-editable-code*/), 📄 = Var(/*#-editable-code*/false/*#-end-editable-code*/)
let 📝 = AND(🖋,📄)

let 🍨 = Var(/*#-editable-code*/true/*#-end-editable-code*/), 🍦 = Var(/*#-editable-code*/false/*#-end-editable-code*/)
let 😍 = OR(🍨,🍦)

let 👍 = Var(/*#-editable-code*/false/*#-end-editable-code*/)
let 👎 = NOT(👍)

/*:
Tap *"Run My Code"* to check the results.\
\
Both `1` and `T` are used to denote `true`, while both `0` and `F` are used to denote `false`.\
\
When you are ready, move on to the [next page](@next).
 */

//#-hidden-code

let updateString = 🖋.str() + 📄.str() + 🍨.str() + 🍦.str() + 👍.str() + 📝.str() + 😍.str() + 👎.str()
updateView(updateString)

if 📝 == Var(true) && 😍 == Var(true) && 👎 == Var(false){
    PlaygroundPage.current.assessmentStatus = .pass(message: "It's a pretty solid start. Now let's [proceed](@next).")
}
else{
    PlaygroundPage.current.assessmentStatus = .fail(hints: ["Try using the [truth table](glossary://truth%20table) above."], solution: "Set every variable to `true` may be a good choice.")

}
//#-end-hidden-code





