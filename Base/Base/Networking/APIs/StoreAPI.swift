//
//  StoreAPI.swift
//  Base
//
//  Created by Marcos Vinicius Majeveski De Angeli on 17/12/21.
//

import Foundation

public class StoreAPI {
    private let urlManager = URLManager()
    
    public init(){}
    
    /// Fetches the store properties
    /// - Parameters:
    ///   - nickname: The nickname property of the store to be fetched
    ///   - completion: The completion after a result
    public func fetch(nick nickname: String, then completion:@escaping (StoreData?) -> Void){
        guard let url = urlManager.storeURL(nick: nickname) else {
            completion(nil)
            return
        }
        
        APIAccess().fetch(model: StoreData.self, url: url){ store in
            completion(store)
        }
    }
    
    /// Fetches the store properties
    /// - Parameters:
    ///   - id: The id property of the store to be fetched
    ///   - completion: The completion after a result
    public func fetch(id sellerId: Int, then completion:@escaping (StoreData?) -> Void) {
        guard let url = urlManager.storeURL(id: sellerId) else {
            completion(nil)
            return
        }
        
        APIAccess().fetch(model: StoreData.self, url: url){ store in
            completion(store)
        }
    }
    
}
