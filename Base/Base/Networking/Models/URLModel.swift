//
//  URLModel.swift
//  Base
//
//  Created by Marcos Vinicius Majeveski De Angeli on 17/12/21.
//

import Foundation

/// A model that every URL must follow to be a valid one
public struct URLModel: Codable {
    let scheme: String
    let host: String
    let basePaths: [String]
    let parameters: [String]
    let ending: String
}
