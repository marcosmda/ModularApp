//
//  UILabel.swift
//  Base
//
//  Created by Marcos Vinicius Majeveski De Angeli on 17/12/21.
//

import UIKit

//MARK: - UILabel Patterns
public extension UILabel {
    
    /// Builds the UILabel to the desired format
    /// - Returns: Returns the UILabel with the modifications
    func asSmallGrayTitle() -> UILabel{
        self.font = UIFont.verdana(ofSize: 10)
        self.textColor = UIColor(hex: "#7D7A77")
        return self
    }
    
    /// Builds the UILabel to the desired format
    /// - Returns: Returns the UILabel with the modifications
    func asSmallBlackDescription() -> UILabel{
        self.font = UIFont.verdana(ofSize: 12)
        self.textColor = UIColor(hex: "#333333")
        self.numberOfLines = 0
        return self
    }
    
    /// Builds the UILabel to the desired format
    /// - Returns: Returns the UILabel with the modifications
    func asBlackInstallments() -> UILabel{
        self.font = UIFont.verdana(ofSize: 12)
        self.textColor = UIColor(hex: "#222222")
        return self
    }
    
    /// Builds the UILabel to the desired format
    /// - Returns: Returns the UILabel with the modifications
    func asPinkPrice() -> UILabel{
        self.font = UIFont.verdanaBold(ofSize: 16)
        self.textColor = UIColor(hex: "#F05B78")
        return self
    }
    
    /// Builds the UILabel to the desired format
    /// - Returns: Returns the UILabel with the modifications
    func asProductTitle() -> UILabel{
        self.font = UIFont.verdanaBold(ofSize: 14)
        self.textColor = UIColor(hex: "#333333")
        self.numberOfLines = 0
        return self
    }
    
    /// Builds the UILabel to the desired format
    /// - Returns: Returns the UILabel with the modifications
    func asStoreDescription() -> UILabel{
        self.font = UIFont.verdana(ofSize: 10)
        self.textColor = UIColor(hex: "#908E8B")
        self.numberOfLines = 0
        return self
    }
}
