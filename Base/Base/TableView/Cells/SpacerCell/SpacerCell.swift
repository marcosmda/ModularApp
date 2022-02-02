//
//  SpacerCell.swift
//  Base
//
//  Created by Marcos Vinicius Majeveski De Angeli on 17/12/21.
//

import UIKit

public class Spacer: CellContent {
    
    var height: CGFloat // Can be a generic
    
    public init(_ height: CGFloat) {
        self.height = height
    }
    
    public override func asCell() -> UITableViewCell? {
        guard let cell = tableView?.dequeueReusableCell(withIdentifier: identifier()) as? SpacerCell else {return nil}
        cell.configure(height)
        return cell
    }
}

public class SpacerCell: UITableViewCell {

    public func configure(_ height: CGFloat) {
        self.isUserInteractionEnabled = false
        self.heightAnchor.constraint(equalToConstant: height).isActive = true
    }
}
