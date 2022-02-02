//
//  String.swift
//  Base
//
//  Created by Marcos Vinicius Majeveski De Angeli on 17/12/21.
//

import Foundation

//MARK: - Methods
public extension String {
    /// Adds a bracket to the begining of the given String
    /// - Returns: The given String with a bracket as the first character
    func asPath() -> String {
        return "/" + self
    }
}
