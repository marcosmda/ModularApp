//
//  CellContentOperator.swift
//  Base
//
//  Created by Marcos Vinicius Majeveski De Angeli on 17/12/21.
//

import UIKit

precedencegroup LeftAssociativityPrecedence {
    associativity: left
}

infix operator |-|: LeftAssociativityPrecedence

public func |-|(lhs: CellContent, rhs: CellContent) -> [CellContent] {
    return [lhs, rhs]
}

public func |-|(lhs: [CellContent], rhs: CellContent) -> [CellContent] {
    var content = lhs
    content.append(rhs)
    return content
}

public func |-|(lhs: CellContent, rhs: Int) -> [CellContent] {
    return [lhs, Spacer(CGFloat(rhs))]
}

public func |-|(lhs: [CellContent], rhs: Int) -> [CellContent] {
    var content = lhs
    content.append(Spacer(CGFloat(rhs)))
    return content
}
