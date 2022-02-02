//
//  SearchViewController+Router.swift
//  SearchScreen
//
//  Created by Marcos Vinicius Majeveski De Angeli on 15/12/21.
//

import Foundation
import Base
import UIKit

extension SearchViewController: ScreenRouterable {
    public static var routeProp: Route {
        return Route(type: self, asModal: false, paths: ["s"])
    }
    
    public static func canHandle(url: URL) -> Bool {
        if url.pathComponents.contains(where: {$0 == "s"}) {return true}
        return false
    }
    
    public static func vcForURL(url: URL) -> UIViewController? {
        return SearchViewController()
    }
}
 
