//
//  ImageAPI.swift
//  Base
//
//  Created by Marcos Vinicius Majeveski De Angeli on 17/12/21.
//

import Foundation

public class ImageAPI {
    private let urlManager = URLManager()
    
    public init(){}
    
    /// Fetches the image data
    /// - Parameters:
    ///   - imageSize: The size given by ImageSizes enum
    ///   - imageId: The publicId of the image
    ///   - completion: The completion after a result
    public func fetch(size imageSize: ImageSizes, id imageId: String, then completion:@escaping (Data?) -> Void) {
        guard let url = urlManager.imageURL(size: imageSize, id: imageId) else {
            completion(nil)
            return
        }
        
        APIAccess().fetch(model: Data.self, url: url) { data in
            completion(data)
        }
    }
}

/// An enum describing every size that an image can be fetched
public enum ImageSizes: String {
    case size75x75 = "75x75"
    case size180x180 = "180x180"
    case size240x240 = "240x240"
    case size460x460 = "460x460"
    case size500x500 = "500x500"
    case size900x500 = "900x500"
    case size1200x1200 = "1200x1200"
    case size1176x200 = "1176x200"
}
