//
//  ProductData.swift
//  produto-enjoei
//
//  Created by Marcos Vinicius Majeveski De Angeli on 21/10/21.
//

import Foundation

// MARK: - Product
/// The Product data received as JSON
public struct ProductData: Codable {
    public let id: Int?
    public let title: String?
    public let description: String?
    public let used: Bool?
    public let brand: Brand?
    public let photos: [String]?
    public let sellerId: Int?
}

// MARK: - Brand
public struct Brand: Codable {
    public let name: String?
}
