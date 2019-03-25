import Foundation
import UIKit

public class GridViewController: UICollectionViewController {
    
    var cols: [String]! = []
    var rows: [[Any]]! = []
    public var pageNumber: Int = 0
    public init() {
        let layout = GridViewLayout()
        super.init(collectionViewLayout: layout)
        layout.viewController = self
        collectionView!.backgroundColor = UIColor.white
        collectionView!.register(GridViewCell.self,
                                 forCellWithReuseIdentifier: "cell")
        collectionView!.delegate = self
        collectionView!.dataSource = self
        collectionView!.isDirectionalLockEnabled = true
        collectionView!.bounces = false
    }
    
    public required init?(coder aDecoder: NSCoder) {
        fatalError("GridViewController.init(coder:) has not been implemented")
    }
    
    public func setColumns(columns: [String]) {
        cols = columns
    }
    
    public func addRow(row: [Any]) {
        rows.append(row)
        collectionView!.collectionViewLayout.invalidateLayout()
        collectionView!.reloadData()
    }
    
    public override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    public override func viewDidLayoutSubviews() {
        collectionView!.frame = CGRect(x:0, y:0,
                                       width:view.frame.width, height:view.frame.height)
    }
    
    public override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    public override func numberOfSections(in collectionView: UICollectionView) -> Int {
        if cols.isEmpty {
            return 0
        }
        return rows.count + 1
    }
    
    public override func collectionView(_ collectionView: UICollectionView,
                                        numberOfItemsInSection section: Int) -> Int {
        return cols.count
    }
    
    public override func collectionView(_ collectionView: UICollectionView,
                                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell",
                                                      for: indexPath) as! GridViewCell
        
        if indexPath.section == 0 {
            cell.label.font = UIFont.systemFont(ofSize: 14, weight: UIFont.Weight.bold)
            cell.label.text = cols[indexPath.row]
            cell.label.textColor = UIColor.black
        } else {
            cell.label.font = UIFont.systemFont(ofSize: 15)
            cell.label.text = "\(rows[indexPath.section-1][indexPath.row])"
            cell.label.textColor = UIColor.black
        }
        
        if indexPath.section == 0 {
            cell.backgroundColor = #colorLiteral(red: 0.994199574, green: 0.9595844572, blue: 0.5758271617, alpha: 1)
            if pageNumber == 7 {
                if indexPath.row == 3 {cell.backgroundColor = #colorLiteral(red: 0.9239723682, green: 0.5767884859, blue: 0.567258418, alpha: 1)}
                if indexPath.row == 4 {cell.backgroundColor = #colorLiteral(red: 0.9568627477, green: 0.8640284293, blue: 0.7343515728, alpha: 1)}
            }
            if pageNumber == 1 {
                if indexPath.row == 2 {cell.backgroundColor = #colorLiteral(red: 1, green: 0.5843137255, blue: 0.2078431373, alpha: 1)}
                if indexPath.row == 3 {cell.backgroundColor = #colorLiteral(red: 0.9921568627, green: 0.8196078431, blue: 0.1725490196, alpha: 1)}
                if indexPath.row == 4 {cell.backgroundColor = #colorLiteral(red: 0.8470588235, green: 0.9843137255, blue: 0.2588235294, alpha: 1)}
            }
            if pageNumber == 2 {
                if indexPath.row == 2 {cell.backgroundColor = #colorLiteral(red: 0.4, green: 0.937254902, blue: 1, alpha: 1)}
                if indexPath.row == 3 {cell.backgroundColor = #colorLiteral(red: 0.337254902, green: 0.6901960784, blue: 0.9725490196, alpha: 1)}
                if indexPath.row == 4 {cell.backgroundColor = #colorLiteral(red: 0.6235294118, green: 0.3647058824, blue: 0.9647058824, alpha: 1)}
                if indexPath.row == 5 {cell.backgroundColor = #colorLiteral(red: 1, green: 0.4156862745, blue: 0.8823529412, alpha: 1)}
            }
            if pageNumber == 4 {
                if indexPath.row == 2 {cell.backgroundColor = #colorLiteral(red: 0.4, green: 0.937254902, blue: 1, alpha: 1)}
                if indexPath.row == 3 {cell.backgroundColor = #colorLiteral(red: 0.9921568627, green: 0.8196078431, blue: 0.1725490196, alpha: 1)}
            }
            if pageNumber == 5 {
                if indexPath.row == 2 {cell.backgroundColor = #colorLiteral(red: 0.337254902, green: 0.6901960784, blue: 0.9725490196, alpha: 1)}
                if indexPath.row == 3 {cell.backgroundColor = #colorLiteral(red: 0.6235294118, green: 0.3647058824, blue: 0.9647058824, alpha: 1)}
            }
        }
        else {
            if cell.label.text=="1" {cell.backgroundColor = UIColor(white: 242/255.0, alpha: 1)}
            else {cell.backgroundColor = UIColor.white}
        }
        
        if pageNumber == 6 {
            
            if indexPath.row == 1 {cell.backgroundColor = #colorLiteral(red: 1, green: 0.5843137255, blue: 0.2078431373, alpha: 1)}
            if indexPath.row == 2 {cell.backgroundColor = #colorLiteral(red: 0.9921568627, green: 0.8196078431, blue: 0.1725490196, alpha: 1)}
            if indexPath.row == 3 {cell.backgroundColor = #colorLiteral(red: 0.8470588235, green: 0.9843137255, blue: 0.2588235294, alpha: 1)}
            if indexPath.row == 4 {cell.backgroundColor = #colorLiteral(red: 0.4, green: 0.937254902, blue: 1, alpha: 1)}
            if indexPath.row == 5 {cell.backgroundColor = #colorLiteral(red: 0.337254902, green: 0.6901960784, blue: 0.9725490196, alpha: 1)}
            if indexPath.row == 6 {cell.backgroundColor = #colorLiteral(red: 0.6235294118, green: 0.3647058824, blue: 0.9647058824, alpha: 1)}
            if indexPath.row == 7 {cell.backgroundColor = #colorLiteral(red: 1, green: 0.4156862745, blue: 0.8823529412, alpha: 1)}
            if indexPath.section == 1 {cell.backgroundColor = cell.backgroundColor!.withAlphaComponent(0.3)}
            if indexPath.section == 2 {
                if cell.label.text == "0" {cell.backgroundColor = UIColor.white}
                else {cell.backgroundColor = cell.backgroundColor!.withAlphaComponent(0.1)}
            }
            if indexPath.row == 0 {
                cell.backgroundColor = UIColor(white: 242/255.0, alpha: 1)
                cell.label.font = UIFont.systemFont(ofSize: 14, weight: UIFont.Weight.bold)
                
            }
        }
        
        return cell
    }
    
}
