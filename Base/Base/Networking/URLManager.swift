//
//  URLManager.swift
//  Base
//
//  Created by Marcos Vinicius Majeveski De Angeli on 17/12/21.
//

import Foundation

/// A Manager for getting the url pattern for the APIAccess and building it with the desired parameters
class URLManager {
    //MARK: Properties
    /// A dictionary created from a JSON file on class's initialization based on an URLModel
    private var urls: [String:URLModel] = [:]
    
    //MARK: Initialization
    /// Initializes decoding the URLModels from their keys in a JSON file named "urls" or throws an error
    init() {
        if let url = Bundle(identifier: "MarcosAngeli.Base")?.url(forResource: "urls", withExtension: "json") {
            
            do {
                let data = try Data(contentsOf: url)
                let urls = try JSONDecoder.default.decode([String:URLModel].self, from: data)
                self.urls = urls
            } catch {
                print("Unable to find urls.json!")
            }
            
        }
    }
    
    //MARK: Private Methods
    /// Creates an URL based on the key and parameters received
    /// - Parameters:
    ///   - key: The type of URL that will be created as an URLKey
    ///   - parameters: The parameters to be included on the URL as paths
    /// - Returns: An URL with the given parameters or nil if a model could not be found for the given type
    private func createURL(key: URLKey, parameters: [String]) -> URL?{
        guard let baseURL = urls[key.rawValue]
        else {
            print("NO URL FOUND FOR THE KEY")
            return nil
        }
        
        /// The components used to create the request URL
        var urlComponents = URLComponents()
        
        //Initial part of the URL
        urlComponents.scheme = baseURL.scheme
        urlComponents.host = baseURL.host
        
        //Had some trouble making a single base path for the pricing api request where the "/" was converted into "%2F" when appended to the URL paths
        for basePath in baseURL.basePaths {
            urlComponents.path.append(basePath.asPath())
        }
        for parameter in parameters {
            urlComponents.path.append(parameter.asPath())
        }
        
        //Ending parts of the URL
        urlComponents.path.append(baseURL.ending.asPath())
        
        return urlComponents.url
    }
}

//MARK: - URL Creation
/// An extenison for dealing with the creation part of the urls for each specific one
extension URLManager {
    /// Creates an URL for a Product request
    /// - Parameter id: The Product id for creatig the URL
    /// - Returns: The URL for fetching the data from the APIAcess
    func productURL(_ id: Int) -> URL? {
        let currentKey = URLKey.product_id
        return createURL(key: currentKey, parameters: [String(id)])
    }
    
    /// Creates an URL for a Price request
    /// - Parameter id: The Product id for creatig the URL
    /// - Returns: The URL for fetching the data from the APIAcess
    func pricingURL(_ id: Int) -> URL? {
        let currentKey = URLKey.product_pricing
        return createURL(key: currentKey, parameters: [String(id)])
    }
    
    /// Creates an URL for a Store request
    /// - Parameter nick: The Store nickname for creatig the URL
    /// - Returns: The URL for fetching the data from the APIAcess
    func storeURL(nick: String) -> URL? {
        let currentKey = URLKey.store_nick
        return createURL(key: currentKey, parameters: [nick])
    }
    
    /// Creates an URL for a Store request
    /// - Parameter id: The Store id for creatig the URL
    /// - Returns: The URL for fetching the data from the APIAcess
    func storeURL(id: Int) -> URL? {
        let currentKey = URLKey.store_id
        return createURL(key: currentKey, parameters: [String(id)])
    }
    
    /// Creates an URL for an Image request
    /// - Parameters:
    ///   - size: The size of the requested Image, enumerated on ImageSizes
    ///   - id: The Image id for creatig the URL
    /// - Returns: The URL for fetching the data from the APIAcess
    func imageURL(size: ImageSizes, id: String) -> URL? {
        let currentKey = URLKey.image
        return createURL(key: currentKey, parameters: [size.rawValue, id])
    }
}

//MARK: - URLKeys
/// The keys for an url pattern. They must have the same value of the keys on the JSON file so it can be decoded into URLModels
enum URLKey: String {
    case store_id
    case store_nick
    case product_id
    case product_pricing
    case image
}
