import UIKit


private let gatePrice = [2,2,1,1,1,4,3]
private var truthTableData = [["a", "b", "c", "ans", "result"],
                             ["0", "0", "0", "1", " "],
                             ["0", "0", "1", "1", " "],
                             ["0", "1", "0", "0", " "],
                             ["0", "1", "1", "0", " "],
                             ["1", "0", "0", "0", " "],
                             ["1", "0", "1", "1", " "],
                             ["1", "1", "0", "0", " "],
                             ["1", "1", "1", "1", " "]]
private var truthTableDataOriginal = truthTableData
private var priceTableData = ["Quantity", "0", "0", "0", "0", "0", "0", "0"]
private let budget = 5

public class AdvancedPage3ViewController: UIViewController{
    
    var priceTable: GridViewController!
    var truthTable: GridViewController!
    var sentencePreview: SentenceView!
    var MoneyPreview: MoneyView!
    public override func viewDidLoad() {
        view.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        setPriceTable()
        setTruthTable()
        setMoneyView(budget,0)
        setSentenceView()
    }
    
    func setPriceTable() {
        priceTable = GridViewController()
        priceTable.pageNumber = 6
        priceTable.setColumns(columns: ["Gates", "AND","OR", "NOT", "NAND", "NOR", "XOR", "XNOR"])
        priceTable.addRow(row: getPriceRow())
        priceTable.addRow(row: priceTableData)
        view.addSubview(priceTable.view)
    }
    
    func setTruthTable() {
        truthTable = GridViewController()
        truthTable.pageNumber = 7
        truthTable.setColumns(columns: truthTableData[0])
        for i in 1..<truthTableData.count {
             truthTable.addRow(row: truthTableData[i])
        }
        view.addSubview(truthTable.view)
    }
    
    func setMoneyView(_ budget: Int, _ cost: Int) {
        MoneyPreview = MoneyView(frame: placeMiddleHalf(view, 170, 400, 80))
        MoneyPreview.budget = budget
        MoneyPreview.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        view.addSubview(MoneyPreview)
    }
    
    func setSentenceView() {
        sentencePreview = SentenceView(frame: placeMiddleHalf(view, 580, 480, 80))
        sentencePreview.content = " "
        sentencePreview.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        view.addSubview(sentencePreview)
    }
    
    public override func viewDidLayoutSubviews() {
        priceTable.view.frame = CGRect(x:view.frame.width/40, y:70, width:view.frame.width*19/20, height:84)
        priceTable.view.layer.borderWidth = 1.5
        truthTable.view.frame = CGRect(x:view.frame.width/40, y:290, width:view.frame.width*19/20, height:252)
        truthTable.view.layer.borderWidth = 1.5
    }
    
    public func updateVars(_ varsToDisp: String){
        if varsToDisp[varsToDisp.startIndex] == "!" {
            truthTableData = truthTableDataOriginal
            truthTableData[0][4] = "result"
            for i in 1...8 {
                truthTableData[i][4] = String(varsToDisp[varsToDisp.index(varsToDisp.startIndex,offsetBy:i)])
            }
            truthTable.view.removeFromSuperview()
            setTruthTable()
        }
        else if varsToDisp[varsToDisp.startIndex] == "%" {
            let qtt = varsToDisp.components(separatedBy: " ")
            for i in 1...7 {
                priceTableData[i] = qtt[i]
            }
            priceTable.view.removeFromSuperview()
            setPriceTable()
        }
        else if varsToDisp[varsToDisp.startIndex] == "*" {
            if let idx = Int(String(varsToDisp[varsToDisp.index(varsToDisp.startIndex,offsetBy:1)])) {
                UIView.transition(
                    with: self.sentencePreview,
                    duration: 0.5,
                    options: [.transitionCurlDown],
                    animations: {
                        self.sentencePreview.content = contentString[idx]
                        if idx>0 {
                            self.sentencePreview.layer.borderWidth = 4
                            self.sentencePreview.layer.borderColor = #colorLiteral(red: 0.9239723682, green: 0.07257270068, blue: 0.3809882402, alpha: 1)
                            self.sentencePreview.layer.cornerRadius = 20
                        }
                        else{
                            self.sentencePreview.layer.borderColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
                        }
                })
            }
        }
        else if varsToDisp[varsToDisp.startIndex] == "~" {
            let element = varsToDisp.components(separatedBy: "@")
            for i in 0...8 {
                truthTableData[i] += [element[i+1]]
            }
            truthTable.view.removeFromSuperview()
            setTruthTable()
        }
    }
    
    public func updateCost(_ realCost: Int){
        MoneyPreview.adjustCost(realCost)
    }
    
    public override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}

private func getPriceRow() -> [String] {
    var prices = ["Price"]
    for pr in gatePrice {
        prices += [String(pr)]
    }
    return prices
}







