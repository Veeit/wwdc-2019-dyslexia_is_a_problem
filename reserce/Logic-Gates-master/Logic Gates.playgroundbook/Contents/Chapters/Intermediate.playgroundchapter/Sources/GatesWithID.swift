import Foundation
public struct VarID {
    public fileprivate(set) var value: Bool
    public fileprivate(set) var id: Int
    public init(_ withValue: Bool, _ num: Int) {
        value = withValue
        id = num
    }
    public init(_ withInt: Int, _ num: Int) {
        if withInt==1 {value = true}
        else {value = false}
        id = num
    }
    public func str() -> String {
        if value {return "1"}
        else {return"0"}
    }
}



public func NAND(_ input1: VarID, _ input2: VarID) -> VarID{
    precondition(allowGates[3], "NAND gate is not available now!")
    let result = VarID(!(input1.value && input2.value), input1.id*10 + input2.id)
    return result
}

public func NOR(_ input1: VarID, _ input2: VarID) -> VarID{
    precondition(allowGates[4], "NOR gate is not available now!")
    let result = VarID(!(input1.value || input2.value), input1.id*10 + input2.id)
    return result
}

public func ==(lhs: VarID, rhs: VarID) -> Bool {
    return lhs.value == rhs.value
}

public func !=(lhs: VarID, rhs: VarID) -> Bool {
    return lhs.value != rhs.value
}






