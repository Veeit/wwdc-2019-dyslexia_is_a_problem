import Foundation

public struct Var {
    public fileprivate(set) var value: Bool
    public init(_ withValue: Bool) {
        value = withValue
    }
    public init(_ withInt: Int) {
        if withInt==1 {value = true}
        else {value = false}
    }
    public func str() -> String {
        if value {return "1"}
        else {return"0"}
    }
}


public func AND(_ input1: Var, _ input2: Var) -> Var{
    precondition(allowGates[0], "AND gate is not available now!")
    gatesCount[0] += 1
    let result = Var(input1.value && input2.value)
    return result
}

public func OR(_ input1: Var, _ input2: Var) -> Var{
    precondition(allowGates[1], "OR gate is not available now!")
    gatesCount[1] += 1
    let result = Var(input1.value || input2.value)
    return result
}

public func NOT(_ input: Var) -> Var{
    precondition(allowGates[2], "NOT gate is not available now!")
    gatesCount[2] += 1
    let result = Var(!input.value)
    return result
}

public func NAND(_ input1: Var, _ input2: Var) -> Var{
    precondition(allowGates[3], "NAND gate is not available now!")
    gatesCount[3] += 1
    let result = Var(!(input1.value && input2.value))
    return result
}

public func NOR(_ input1: Var, _ input2: Var) -> Var{
    precondition(allowGates[4], "NOR gate is not available now!")
    gatesCount[4] += 1
    let result = Var(!(input1.value || input2.value))
    return result
}

public func XOR(_ input1: Var, _ input2: Var) -> Var{
    precondition(allowGates[5], "XOR gate is not available now!")
    gatesCount[5] += 1
    let result = Var((input1.value != input2.value))
    return result
}

public func XNOR(_ input1: Var, _ input2: Var) -> Var{
    precondition(allowGates[6], "XNOR gate is not available now!")
    gatesCount[6] += 1
    let result = Var((input1.value == input2.value))
    return result
}

public func ==(lhs: Var, rhs: Var) -> Bool {
    return lhs.value == rhs.value
}

public func !=(lhs: Var, rhs: Var) -> Bool {
    return lhs.value != rhs.value
}

public var allowGates = [Bool]()
//AND OR NOT NAND NOR XOR XNOR

public var gatesCount = [0,0,0,0,0,0,0,0]








