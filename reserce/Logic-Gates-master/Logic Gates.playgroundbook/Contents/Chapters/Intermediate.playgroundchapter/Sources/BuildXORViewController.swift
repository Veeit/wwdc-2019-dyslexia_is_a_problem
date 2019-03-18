import UIKit

public class BuildXORViewController: UIViewController{
    
    var truthTable: GridViewController!
    public var gatesPreview: BuildXORView!
    var correct: CorrectResultView!
    
    public override func viewDidLoad() {
        view.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        setTruthTable()
        setGatesPreview()
    }
    
    func setTruthTable() {
        truthTable = GridViewController()
        truthTable.pageNumber = 5
        truthTable.setColumns(columns: ["p","q", "NOR(p,q)", "XOR(p,q)"])
        truthTable.addRow(row: ["0", "0", "1", "0"])
        truthTable.addRow(row: ["0", "1", "0", "1"])
        truthTable.addRow(row: ["1", "0", "0", "1"])
        truthTable.addRow(row: ["1", "1", "0", "0"])
        view.addSubview(truthTable.view)
    }
    func setGatesPreview() {
        gatesPreview = BuildXORView(frame: placeMiddleCard(view, 180, 460, 500))
        gatesPreview.inputState = [0,0,0,0,0,0]
        gatesPreview.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        gatesPreview.drawValues()
        correct = CorrectResultView(frame: CGRect(x: 180, y: 310, width: 100, height: 100))
        correct.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        gatesPreview.addSubview(correct)
        view.addSubview(gatesPreview)
    }
    
    public override func viewDidLayoutSubviews() {
        truthTable.view.frame = CGRect(x:view.frame.width/8, y:20, width:view.frame.width*3/4, height:140)
        truthTable.view.layer.borderWidth = 1.5
    }
    
    public func updateVars(_ varsToDisp: String){
        if strlen(varsToDisp)<=6 {
            gatesPreview.inputState = []
            for charVar in varsToDisp {
                if let temp = Int(String(charVar)) {
                    gatesPreview.inputState += [temp]
                }
            }
            gatesPreview.redraw()
        }
        else {
            var varValue = [Bool]()
            for ch in varsToDisp{
                varValue += [explain(ch)]
            }
            for i in 0...5{
                if gatesPreview.flipResults[i].isTrue != varValue[gatesPreview.inputState[i] - 1]{
                    UIView.transition(
                        with: gatesPreview.flipResults[i],
                        duration: 0.5,
                        options: [.transitionFlipFromLeft],
                        animations: {
                            self.gatesPreview.flipResults[i].isTrue = varValue[self.gatesPreview.inputState[i] - 1]
                    })
                }
            }
            for i in 6...10{
                //gatesPreview.backgroundColor = UIColor.red
                if gatesPreview.flipResults[i].isTrue != varValue[i - 4]{
                    UIView.transition(
                        with: gatesPreview.flipResults[i],
                        duration: 0.5,
                        options: [.transitionFlipFromLeft],
                        animations: {
                            self.gatesPreview.flipResults[i].isTrue = varValue[i - 4]
                    })
                }
            }
            if correct.isCorrect != varValue[7]{
                UIView.transition(
                    with: correct,
                    duration: 0.5,
                    options: [.transitionCurlDown],
                    animations: {
                        self.correct.isCorrect = varValue[7]
                })
            }
        }
    }
    
    public override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}

