//
//  PricingCell.swift
//  ProductScreen
//
//  Created by Marcos Vinicius Majeveski De Angeli on 22/12/21.
//

import UIKit
import Base

public class Pricing: CellContent {
    var id: Int?
    
    public init(_ id: Int?) {
        self.id = id
    }
    
    public override func asCell() -> UITableViewCell? {
        guard let cell = tableView?.dequeueReusableCell(withIdentifier: identifier()) as? PricingCell else {return nil}
        cell.configure(self)
        return cell
    }
}

public class PricingCell: UITableViewCell {
    
    @IBOutlet weak var priceLabel: UILabel?
    @IBOutlet weak var installmentLabel: UILabel?
    
    public func configure(_ price: Pricing) {
        if !(priceLabel?.text == "" || priceLabel?.text == "Label") || !(installmentLabel?.text == "" || installmentLabel?.text == "Label") {return}
        guard let productId = price.id else {return}
        self.isUserInteractionEnabled = false
        PricingAPI().fetch(id: productId) { pricingData in
            guard let productPrice = pricingData?.regularPrice?.values?.price?.sale ?? pricingData?.regularPrice?.values?.price?.listed, let installments = pricingData?.regularPrice?.values?.priceSubtitle else {return}
            self.priceLabel?.text = "R$ \(productPrice),00"
            self.priceLabel = self.priceLabel?.asPinkPrice()
            self.installmentLabel?.text = installments
            self.installmentLabel = self.installmentLabel?.asSmallBlackDescription()
            price.tableView?.reloadData()
        }
    }
}
