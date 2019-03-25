import UIKit

public class AbstractProblemViewController: UIViewController{
    
    var truthTable: GridViewController!
    var statusPreview: UIView!
    var aVar: TrueFalseResultView!
    var bVar: TrueFalseResultView!
    var zVar: TrueFalseResultView!
    var correct: CorrectResultView!

    public override func viewDidLoad() {
        view.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        setTruthTable()
        setStatusPreview()
    }
    
    func setTruthTable() {
        truthTable = GridViewController()
        truthTable.pageNumber = 3
        truthTable.setColumns(columns: ["a","b", "z"])
        truthTable.addRow(row: ["0", "0", "0"])
        truthTable.addRow(row: ["0", "1", "1"])
        truthTable.addRow(row: ["1", "0", "1"])
        truthTable.addRow(row: ["1", "1", "0"])
        view.addSubview(truthTable.view)
    }

    public override func viewDidLayoutSubviews() {
        truthTable.view.frame = CGRect(x:view.frame.width/8, y:20, width:view.frame.width*3/4, height:140)
        //truthTable.view.frame = placeMiddleHalf(view, 20, 500, 140)
        truthTable.view.layer.borderWidth = 1.5
    }
    
    func setLabel(_ object: String, _ position: CGRect)
    {
        let labelRect = position
        let label = UILabel(frame: labelRect)
        label.attributedText = centeredAttributedString(object, fontSize: 40)
        statusPreview.addSubview(label)
    }
    
    func setStatusPreview() {
        statusPreview = UIView(frame: placeMiddleCard(view, 140, 360, 400))
        statusPreview.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0)
        setLabel("a", CGRect(x: 30, y: 100, width: 100, height: 100))
        setLabel("b", CGRect(x: 130, y: 100, width: 100, height: 100))
        setLabel("z", CGRect(x: 230, y: 100, width: 100, height: 100))
        
        aVar = TrueFalseResultView(frame: CGRect(x: 30, y: 200, width: 100, height: 100))
        aVar.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        statusPreview.addSubview(aVar)
        
        bVar = TrueFalseResultView(frame: CGRect(x: 130, y: 200, width: 100, height: 100))
        bVar.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        statusPreview.addSubview(bVar)
        
        zVar = TrueFalseResultView(frame: CGRect(x: 230, y: 200, width: 100, height: 100))
        zVar.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        statusPreview.addSubview(zVar)
        
        correct = CorrectResultView(frame: CGRect(x: 130, y: 300, width: 100, height: 100))
        correct.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        statusPreview.addSubview(correct)
        
        view.addSubview(statusPreview)
        
    }
    
    public func updateVars(_ varsToDisp: String){
        var aVarNewValue = explain(varsToDisp[varsToDisp.index(varsToDisp.startIndex,offsetBy:0)])
        var bVarNewValue = explain(varsToDisp[varsToDisp.index(varsToDisp.startIndex,offsetBy:1)])
        var zVarNewValue = explain(varsToDisp[varsToDisp.index(varsToDisp.startIndex,offsetBy:2)])
        var correctNewValue = explain(varsToDisp[varsToDisp.index(varsToDisp.startIndex,offsetBy:3)])
        
        if self.aVar.isTrue != aVarNewValue{
            UIView.transition(
                with: self.aVar,
                duration: 0.5,
                options: [.transitionFlipFromLeft],
                animations: {
                    self.aVar.isTrue = aVarNewValue
            })
        }
        if self.bVar.isTrue != bVarNewValue{
            UIView.transition(
                with: self.bVar,
                duration: 0.5,
                options: [.transitionFlipFromLeft],
                animations: {
                    self.bVar.isTrue = bVarNewValue
            })
        }
        if self.zVar.isTrue != zVarNewValue{
            UIView.transition(
                with: self.zVar,
                duration: 0.5,
                options: [.transitionFlipFromLeft],
                animations: {
                    self.zVar.isTrue = zVarNewValue
            })
        }
        
        if self.correct.isCorrect != correctNewValue{
            UIView.transition(
                with: self.correct,
                duration: 0.5,
                options: [.transitionCurlDown],
                animations: {
                    self.correct.isCorrect = correctNewValue
            })
        }
    }
    
}

