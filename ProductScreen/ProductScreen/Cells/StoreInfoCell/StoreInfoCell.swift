//
//  StoreInfoCell.swift
//  ProductScreen
//
//  Created by Marcos Vinicius Majeveski De Angeli on 22/12/21.
//

import UIKit
import Base


class StoreInfo: CellContent {
    var storeId: Int?
    
    public init(_ storeId: Int?) {
        self.storeId = storeId
        super.init()
        self.rowHeight = 140
    }
    
    public override func asCell() -> UITableViewCell? {
        guard let cell = tableView?.dequeueReusableCell(withIdentifier: identifier()) as? StoreInfoCell else {return nil}
        cell.configure(self)
        return cell
    }
}

class StoreInfoCell: UITableViewCell {
    @IBOutlet weak var storeSellingLabel: UILabel?
    @IBOutlet weak var storeSoldLabel: UILabel?
    @IBOutlet weak var storeNameLabel: UILabel?
    @IBOutlet weak var storeInfoLabel: UILabel?
    @IBOutlet weak var storeImageLabel: UIImageView?
    @IBOutlet weak var strokeView: UIView?
    
    var isConfigured: Bool = false
    
    public func configure(_ store: StoreInfo) {
        if !isConfigured {
            
            storeSellingLabel?.text = "324"
            storeSoldLabel?.text = "1256"
            
            strokeView?.layer.borderWidth = 1
            strokeView?.layer.borderColor = UIColor(hex: "#F4F2F0").cgColor
            strokeView?.layer.cornerRadius = 3
            
            guard let storeId = store.storeId else {return}
            StoreAPI().fetch(id: storeId) { storeData in
                guard let name = storeData?.title, let info = storeData?.description, let imageId = storeData?.avatar?.imagePublicId else {return}
                
                self.storeNameLabel?.text = name
                self.storeNameLabel = self.storeNameLabel?.asSmallBlackDescription()
                
                self.storeInfoLabel?.text = info
                self.storeInfoLabel = self.storeInfoLabel?.asStoreDescription()
                
                ImageAPI().fetch(size: .size75x75, id: imageId) { imageData in
                    guard let data = imageData else {return}
                    self.storeImageLabel?.image = UIImage(data: data)
                    self.storeImageLabel?.layer.cornerRadius = (self.storeImageLabel?.frame.height ?? 0)/2
                    store.tableView?.estimatedRowHeight = 140
                    store.tableView?.reloadData()
                }
                
            }
        }
        isConfigured = true
        if storeImageLabel?.image == nil || storeInfoLabel?.text == "Label" || storeNameLabel?.text == "Label" {
            isConfigured = false
        }
    }
}
