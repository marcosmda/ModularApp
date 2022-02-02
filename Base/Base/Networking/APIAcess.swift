//
//  APIAcess.swift
//  Base
//
//  Created by Marcos Vinicius Majeveski De Angeli on 17/12/21.
//

import Foundation

class APIAccess {
    
    private var task: URLSessionDataTask?
    
    private let session: URLSession = {
        return URLSession(configuration: URLSessionConfiguration.default)
    }()
    
    /// Fetches a given model K by the given URL and customHeaders, and returns the model if succeded or nil if not
    func fetch<K:Decodable>(model:K.Type, url:URL,
                            customHeaders: [String:String] = [:],
                            callback:@escaping (K?) -> Void) {
        
        let completion:(K?) -> Void = { data in
            DispatchQueue.main.async {
                callback(data)
            }
        }
        
        guard url.host?.hasSuffix("") == true else {
            print("request/data error: invalid url domain")
            completion(nil)
            return
        }
        
        var request = URLRequest(url: url)
        
        request.setValue("", forHTTPHeaderField: "")
        request.setValue("", forHTTPHeaderField: "")
        request.setValue("", forHTTPHeaderField: "")
        
        for (key, value) in customHeaders {
            request.setValue(value, forHTTPHeaderField: key)
        }
        
        task = session.dataTask(with: request) { (rawData, _, error) in
            
            guard let data = rawData, error == nil else {
                print("request/data error: ", error ?? "<empty error log>", separator: "\n")
                completion(nil)
                return
            }
            
            do {
                // If it is an image, decoding is not needed, so it is returned as Data
                if let isImage = url.host?.hasPrefix("photos"), isImage {
                    completion(data as? K)
                    return
                }
                // If teh data is in a JSON format and it's not an imaeg, it has to be decoded as the given K model
                let response:K? = try JSONDecoder.default.decode(model, from: data)
                completion(response)
             } catch let jsonError {
                print("decoding error: ", jsonError)
                completion(nil)
             }
            
        }
        
        task?.resume()
    }
}
