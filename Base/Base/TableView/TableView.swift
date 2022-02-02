//
//  TableView.swift
//  TableView_Solution
//
//  Created by Marcos Vinicius Majeveski De Angeli on 09/12/21.
//

import UIKit

public class TableView: UITableView {
    
    /// An array of arrays representing the section and the row for the tableView, where each array represents a section and each element inside this array represents a row. The first element of each section represents a header and will be pinned at the top, therefore it is not added as cell, only as header.
    private(set) var indexedContent: [[CellContent]] = []
    
    public func start(with content: [CellContent], vc: UIViewController) {
        if self.superview == nil {
            vc.view.addSubview(self)
            self.frame = UIScreen.main.bounds
        }
        
        self.indexedContent = indexContent(content)
        self.separatorStyle = .none
        
        delegate = self
        dataSource = self
        self.sectionHeaderTopPadding = 0
    }
    
    /// Turns an array of CellContent in an array of arrays, describing the sections and rows for the tableView
    /// - Parameter content: the content that will be displayed on the tableView
    /// - Returns: The received content indexed in sections based on the isHeader property of each one
    private func indexContent(_ content: [CellContent]) -> [[CellContent]] {
        var indexedContent = [[CellContent]]()
        var headerIndexes = [Int]()
        
        //Check which index represents a header
        for i in 0..<content.count {
            let cell = content[i]
            //Cell MUSTS
            cell.tableView = self
            cell.registerCell()
            
            if content[i].isHeader {
                headerIndexes.append(i)
            }
        }
        
        if headerIndexes.isEmpty {return [content]}
        
        //If first header detected is not the first cell, the previous cells should be added before header
        if let firstHeaderIndex = headerIndexes.first, firstHeaderIndex != 0 {
            var section = [CellContent]()
            for cellIndex in 0..<firstHeaderIndex {
                section.append(content[cellIndex])
            }
            indexedContent.append(section)
        }
        
        // For each Header adds a section for and appends to the indexedContent variable
        for i in 0..<headerIndexes.count {
            let currentHeaderIndex = headerIndexes[i]
            
            //Stop Cenario, when a header is the last cell
            if currentHeaderIndex == content.count-1 {
                indexedContent.append([content[currentHeaderIndex]])
                break
            }
            
            var section = [CellContent]()
            
            //If it is not the last header index
            if i != headerIndexes.count-1 {
                let nextHeaderIndex = headerIndexes[i+1]
                for cellIndex in currentHeaderIndex..<nextHeaderIndex {
                    section.append(content[cellIndex])
                }
            } else {
                for cellIndex in currentHeaderIndex..<content.count {
                    section.append(content[cellIndex])
                }
            }
            indexedContent.append(section)
        }
        
        return indexedContent
    }
}

extension TableView: UITableViewDelegate {}

extension TableView: UITableViewDataSource {
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //The first element of each section is added as header, and not as cell
        if let firstCell = indexedContent[section].first, firstCell.isHeader {
            return indexedContent[section].count-1
        } else {
            return indexedContent[section].count
        }
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        indexedContent[indexPath.section][indexPath.row].registeredIndexPath = indexPath
        
        //The first element of each section is added as header, and not as cell, so the first row is the second element
        if let firstCell = indexedContent[indexPath.section].first, firstCell.isHeader {
            return indexedContent[indexPath.section][indexPath.row+1].asCell() ?? UITableViewCell()
        } else {
            return indexedContent[indexPath.section][indexPath.row].asCell() ?? UITableViewCell()
        }
    }
    
    public func numberOfSections(in tableView: UITableView) -> Int {
        return indexedContent.count
    }
    
    public func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if let firstCell = indexedContent[section].first, firstCell.isHeader {
            return indexedContent[section].first?.asCell()?.contentView
        } else {return nil}
    }
    
    public func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if let firstCell = indexedContent[section].first, firstCell.isHeader {
            return tableView.estimatedSectionHeaderHeight
        } else {return 0}
    }
    
    public func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return indexedContent[indexPath.section][indexPath.row].rowHeight ?? rowHeight
    }
}
