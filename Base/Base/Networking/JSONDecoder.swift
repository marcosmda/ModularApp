//
//  JSONDecoder.swift
//  Base
//
//  Created by Marcos Vinicius Majeveski De Angeli on 17/12/21.
//

import Foundation

extension JSONDecoder {
    /// A decoding strategy convertig from Snake Case to Camel Case
    static var `default`: JSONDecoder = {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return decoder
    }()
}
