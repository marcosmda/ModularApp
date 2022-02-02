//
//  UIView.swift
//  Base
//
//  Created by Marcos Vinicius Majeveski De Angeli on 17/12/21.
//

import UIKit

//MARK: - Methods
public extension UIView {
    
    /// Adds multiple subViews to the desired view
    /// - Parameter views: Ana array containing the views to be added
    func addSubview(views: [UIView]){
        for view in views {
            self.addSubview(view)
        }
    }
}
