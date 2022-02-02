//
//  StoreData.swift
//  produto-enjoei
//
//  Created by Marcos Vinicius Majeveski De Angeli on 21/10/21.
//

import Foundation

//MARK: - Store
/// The Store data received as JSON
public struct StoreData: Codable {
    public let avatar: Avatar?
    public let title: String?
    public let description: String?
}

//MARK: - Avatar
public struct Avatar: Codable {
    public let imagePublicId: String?
}
