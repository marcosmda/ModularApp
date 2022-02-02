//
//  ProductViewController+Router.swift
//  ProductScreen
//
//  Created by Marcos Vinicius Majeveski De Angeli on 17/12/21.
//

import UIKit
import Base

extension ProductViewController: ScreenRouterable {
    
    public static var routeProp: Route {
        return Route(type: self, asModal: false, paths: ["p"])
    }
    
    public static func canHandle(url: URL) -> Bool {
        if url.pathComponents.contains(where: {$0 == "p"}) {return true}
        return false
    }
    
    public static func vcForURL(url: URL) -> UIViewController? {
        return ProductViewController(1)
    }
}
