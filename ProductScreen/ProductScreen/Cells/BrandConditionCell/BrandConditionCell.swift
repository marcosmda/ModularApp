//
//  ImageFooterCell.swift
//  ProductScreen
//
//  Created by Marcos Vinicius Majeveski De Angeli on 22/12/21.
//

import UIKit
import Base

public class BrandCondition: CellContent {
    var brand: String?
    var used: Bool?
    
    public init(brand: String?, used: Bool?) {
        self.brand = brand
        self.used = used
    }
    
    public override func asCell() -> UITableViewCell? {
        guard let cell = tableView?.dequeueReusableCell(withIdentifier: identifier()) as? BrandConditionCell else {return nil}
        cell.configure(self)
        return cell
    }
}

public class BrandConditionCell: UITableViewCell {
    
    @IBOutlet weak var brandLabel: UILabel?
    @IBOutlet weak var conditionLabel: UILabel?
    
    public func configure(_ brandCondition: BrandCondition) {
    if brandLabel?.text != "Label" && conditionLabel?.text != "Label" {return}
        guard let isUsed = brandCondition.used else {return}
        
        self.isUserInteractionEnabled = false
        brandLabel?.text = brandCondition.brand
        brandLabel = brandLabel?.asSmallBlackDescription()
        conditionLabel?.text = isUsed ? "usado" : "novo"
    }
}

