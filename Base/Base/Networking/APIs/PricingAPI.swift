//
//  PricingAPI.swift
//  Base
//
//  Created by Marcos Vinicius Majeveski De Angeli on 17/12/21.
//

import Foundation

public class PricingAPI {
    private let urlManager = URLManager()
    
    public init(){}
    
    /// Fetches the pricing for a product by it's id
    /// - Parameters:
    ///   - productId: The id of the product
    ///   - completion: The completion after a result
    public func fetch(id productId: Int, then completion:@escaping (PricingData?) -> Void) {
        guard let url = urlManager.pricingURL(productId) else {
            completion(nil)
            return
        }
        
        APIAccess().fetch(model: PricingData.self, url: url) { price in
            completion(price)
        }
    }
}
