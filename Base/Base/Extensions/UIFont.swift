//
//  UIFont.swift
//  Base
//
//  Created by Marcos Vinicius Majeveski De Angeli on 17/12/21.
//

import UIKit

//MARK: - UIFont Patterns
public extension UIFont {
    
    ///  Custom UIFont build method
    /// - Parameter size: The size of the desired custom UIFont
    /// - Returns: The font with the modifications
    class func verdana(ofSize size: CGFloat) -> UIFont {
        return UIFont(name: "Verdana", size: size) ?? UIFont.systemFont(ofSize: size)
    }
    
    ///  Custom UIFont build method
    /// - Parameter size: The size of the desired custom UIFont
    /// - Returns: The font with the modifications
    class func verdanaBold(ofSize size: CGFloat) -> UIFont {
        return UIFont(name: "Verdana Bold", size: size) ?? UIFont.systemFont(ofSize: size)
    }
}
