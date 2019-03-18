import UIKit

public class MoreGatesViewController: UIViewController{
    
    var truthTable: GridViewController!
    public var gatesPreview: MoreGatesView!
    public override func viewDidLoad() {
        view.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        setTruthTable()
        setGatesPreview()
    }
    
    func setTruthTable() {
        truthTable = GridViewController()
        truthTable.pageNumber = 2
        truthTable.setColumns(columns: ["p","q", "NAND(p,q)", "NOR(p,q)", "XOR(p,q)", "XNOR(p,q)"])
        truthTable.addRow(row: ["0", "0", "1", "1", "0", "1"])
        truthTable.addRow(row: ["0", "1", "1", "0", "1", "0"])
        truthTable.addRow(row: ["1", "0", "1", "0", "1", "0"])
        truthTable.addRow(row: ["1", "1", "0", "0", "0", "1"])
        view.addSubview(truthTable.view)
    }
    
    func setGatesPreview() {
        gatesPreview = MoreGatesView(frame: placeMiddleHalf(view, 200, 540, 500))
        gatesPreview.varState = [1,2,0,2,2,2,2,1,2]
        gatesPreview.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        view.addSubview(gatesPreview)
    }
    
    public override func viewDidLayoutSubviews() {
        truthTable.view.frame = CGRect(x:0, y:20, width:view.frame.width-15, height:140)
        truthTable.view.layer.borderWidth = 1.5
    }
    
    public func updateVars(_ varsToDisp: String){
        gatesPreview.varState = []
        for charVar in varsToDisp {
            if let temp = Int(String(charVar)) {
                gatesPreview.varState += [temp]
            }
        }
        gatesPreview.redraw()
    }
    
    public override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}

