//
//  TextCell.swift
//  Base
//
//  Created by Marcos Vinicius Majeveski De Angeli on 17/12/21.
//

import UIKit

public class Text: CellContent {
    
    var text: String
    
    public init(_ text: String) {
        self.text = text
    }
    
    public override func asCell() -> UITableViewCell? {
        guard let cell = tableView?.dequeueReusableCell(withIdentifier: identifier()) as? TextCell else {return nil}
        cell.configure(self)
        return cell
    }
}


public class TextCell: UITableViewCell {
    
    @IBOutlet weak var label: UILabel?
    
    public func configure(_ text: Text) {
        self.isUserInteractionEnabled = false
        self.label?.text = text.text
        self.label?.numberOfLines = 0
        self.label = self.label?.asSmallBlackDescription()
    }
}
