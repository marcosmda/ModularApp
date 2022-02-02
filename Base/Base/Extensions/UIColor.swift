//
//  UIColor.swift
//  Base
//
//  Created by Marcos Vinicius Majeveski De Angeli on 17/12/21.
//

import UIKit

//MARK: - Hex Initialization
public extension UIColor {
    /// /// Returns the desired color given in Hex code or .black if it could not be created from the given code
    /// - Parameter hex: The 7 characters Hex code describing the color
    convenience init(hex: String) {
        let r, g, b: CGFloat

        if hex.hasPrefix("#") {
            let start = hex.index(hex.startIndex, offsetBy: 1)
            let hexColor = String(hex[start...])

            if hexColor.count == 6 {
                let scanner = Scanner(string: hexColor)
                var hexNumber: UInt64 = 0

                if scanner.scanHexInt64(&hexNumber) {
                    r = CGFloat((hexNumber & 0xff0000) >> 16) / 255
                    g = CGFloat((hexNumber & 0x00ff00) >> 8) / 255
                    b = CGFloat(hexNumber & 0x0000ff) / 255

                    self.init(red: r, green: g, blue: b, alpha: 1)
                    return
                }
            }
        }
        self.init(red: 0, green: 0, blue: 0, alpha: 1)
        return
    }
}
