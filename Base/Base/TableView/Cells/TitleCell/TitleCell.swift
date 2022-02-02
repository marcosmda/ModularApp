//
//  TitleCell.swift
//  Base
//
//  Created by Marcos Vinicius Majeveski De Angeli on 17/12/21.
//

import UIKit

public class Title: CellContent {
    
    var text: String // can be a generic
    
    public init(_ text: String) {
        self.text = text
    }
    
    public override func asCell() -> UITableViewCell? {
        guard let cell = tableView?.dequeueReusableCell(withIdentifier: identifier()) as? TitleCell else {return nil}
        cell.configure(self)
        return cell
    }
}

public class TitleCell: UITableViewCell {
    
    @IBOutlet weak var title: UILabel?

    public func configure(_ title: Title) {
        self.isUserInteractionEnabled = false
        self.title?.text = title.text
        self.title = self.title?.asProductTitle()
    }
}
