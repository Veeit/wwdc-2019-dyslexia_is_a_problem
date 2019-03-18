/*:

Despite the 3 basic logic gates, another 4 gates are also widely used:

- [NAND gate](glossary://NAND%20gate): The output is `false` **only** if both its inputs are `true`.
- [NOR gate](glossary://NOR%20gate): The output is `true` **only** if both its inputs are `false`.
- [XOR gate](glossary://XOR%20gate): The output is `true` if the inputs are different.
- [XNOR gate](glossary://XNOR%20gate): The output is `true` if the inputs are the same.


 * Experiment:
 Again let's set the input values of the logic gates:
     1. Set inputs `b`, `d` to proper values.
     2. Make `x` `true`.
     3. Make `z` `false`.


 
 */
//#-hidden-code
import PlaygroundSupport
allowGates = [false,false,false,true,true,true,true]
func updateView(_ message: String) {
    let page = PlaygroundPage.current
    if let proxy = page.liveView as? PlaygroundRemoteLiveViewProxy {
        proxy.send(.string(message))
    }
}
//AND OR NOT NAND NOR XOR XNOR
//#-end-hidden-code
//#-code-completion(everything, hide)
//#-code-completion(identifier, show, true, false)
let a = Var(true), b = Var(/*#-editable-code*/<#T##boolean value##Bool#>/*#-end-editable-code*/)
let x = NAND(a,b)
let c = Var(false), d = Var(/*#-editable-code*/<#T##boolean value##Bool#>/*#-end-editable-code*/)
let y = NOR(c,d)
let m = XOR(x, y), n = Var(true)
let z = XNOR(m,n)
/*:
 Tap *"Run My Code"* to check the results.\
 \
 Both `1` and `T` are used to denote `true`, while both `0` and `F` are used to denote `false`.\
 \
 When you are ready, move on to the [next page](@next). Interesting stuff ahead.
 */
//#-hidden-code
let updateString = a.str() + b.str() + c.str() + d.str() + x.str() + y.str() + m.str() + n.str() + z.str()
updateView(updateString)

if x == Var(true) && z == Var(false) {
    PlaygroundPage.current.assessmentStatus = .pass(message: "Well done. Move [forward](@next)!")
}
else{
    PlaygroundPage.current.assessmentStatus = .fail(hints: ["Try using the [truth table](glossary://truth%20table) above."], solution: "Set `b` and `d` to `false` may be a good decision.")
}
//#-end-hidden-code

