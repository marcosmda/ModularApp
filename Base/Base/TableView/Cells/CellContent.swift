//
//  CellContent.swift
//  Base
//
//  Created by Marcos Vinicius Majeveski De Angeli on 17/12/21.
//

import UIKit

open class CellContent: NSObject {
    
    public var isHeader: Bool = false
    public var tableView: TableView?
    public var registeredIndexPath: IndexPath?
    public var rowHeight: CGFloat?
   
    open func asCell() -> UITableViewCell? {return nil}
    
    open func registerCell() {
        if let table = self.tableView {
            table.register(UINib(nibName: identifier(), bundle: .init(identifier: "MarcosAngeli.\(bundle())")), forCellReuseIdentifier: identifier())
        }
    }
    
    public func identifier() -> String {
        return "\(String(describing: type(of: self)))Cell"
    }
    
    public func bundle() -> String {
        var string = String(describing: self).replacingOccurrences(of: "<", with: ".")
        string = string.components(separatedBy: ".")[1] 
        return string
    }
    
    public func asHeader() -> CellContent{
        isHeader = true
        return self
    }
}
