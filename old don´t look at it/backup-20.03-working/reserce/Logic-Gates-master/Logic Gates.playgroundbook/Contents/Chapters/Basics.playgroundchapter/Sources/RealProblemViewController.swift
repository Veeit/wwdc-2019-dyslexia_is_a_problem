import UIKit

public class RealProblemViewController: UIViewController{
    
    var truthTable: GridViewController!
    var statusPreview: UIView!
    var basketball: TrueFalseResultView!
    var homework: TrueFalseResultView!
    var happy: TrueFalseResultView!
    var correct: CorrectResultView!
    
    public override func viewDidLoad() {
        title = "A Real Problem"
        view.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        setStatusPreview()
    }
    
    func setLabel(_ object: String, _ position: CGRect)
    {
        let labelRect = position
        let label = UILabel(frame: labelRect)
        label.attributedText = centeredAttributedString(object, fontSize: 50)
        statusPreview.addSubview(label)
    }
    
    func setStatusPreview() {
        statusPreview = UIView(frame: placeMiddleCard(view, 60, 360, 400))
        statusPreview.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        setLabel("🏀", CGRect(x: 30, y: 100, width: 100, height: 100))
        setLabel("📚", CGRect(x: 130, y: 100, width: 100, height: 100))
        setLabel("😁", CGRect(x: 230, y: 100, width: 100, height: 100))
        
        basketball = TrueFalseResultView(frame: CGRect(x: 30, y: 200, width: 100, height: 100))
        basketball.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        statusPreview.addSubview(basketball)
        
        homework = TrueFalseResultView(frame: CGRect(x: 130, y: 200, width: 100, height: 100))
        homework.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        statusPreview.addSubview(homework)
        
        happy = TrueFalseResultView(frame: CGRect(x: 230, y: 200, width: 100, height: 100))
        happy.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        statusPreview.addSubview(happy)
        
        correct = CorrectResultView(frame: CGRect(x: 130, y: 300, width: 100, height: 100))
        correct.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        statusPreview.addSubview(correct)
        
        view.addSubview(statusPreview)
        
    }
    
    public func updateVars(_ varsToDisp: String){
        var basketballNewValue = explain(varsToDisp[varsToDisp.index(varsToDisp.startIndex,offsetBy:0)])
        var homeworkNewValue = explain(varsToDisp[varsToDisp.index(varsToDisp.startIndex,offsetBy:1)])
        var happyNewValue = explain(varsToDisp[varsToDisp.index(varsToDisp.startIndex,offsetBy:2)])
        var correctNewValue = explain(varsToDisp[varsToDisp.index(varsToDisp.startIndex,offsetBy:3)])
        
        if self.basketball.isTrue != basketballNewValue{
            UIView.transition(
                with: self.basketball,
                duration: 0.5,
                options: [.transitionFlipFromLeft],
                animations: {
                    self.basketball.isTrue = basketballNewValue
            })
        }
        if self.homework.isTrue != homeworkNewValue{
            UIView.transition(
                with: self.homework,
                duration: 0.5,
                options: [.transitionFlipFromLeft],
                animations: {
                    self.homework.isTrue = homeworkNewValue
            })
        }
        if self.happy.isTrue != happyNewValue{
            UIView.transition(
                with: self.happy,
                duration: 0.5,
                options: [.transitionFlipFromLeft],
                animations: {
                    self.happy.isTrue = happyNewValue
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



