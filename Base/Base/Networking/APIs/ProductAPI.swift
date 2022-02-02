//
//  ProductAPI.swift
//  Base
//
//  Created by Marcos Vinicius Majeveski De Angeli on 17/12/21.
//

import Foundation

public class ProductAPI {
    private let urlManager = URLManager()
    
    public init(){}
    
    /// Fetches a product by it's id
    /// - Parameters:
    ///   - productId: The id of the product to be fetched
    ///   - completion: The completion after a result
    public func fetch(id productId: Int, then completion:@escaping (ProductData?) -> Void){
        
        guard let url = urlManager.productURL(productId) else {
            completion(nil)
            return
        }
        
        APIAccess().fetch(model: ProductData.self, url: url) { product in
            completion(product)
        }
    }
}
