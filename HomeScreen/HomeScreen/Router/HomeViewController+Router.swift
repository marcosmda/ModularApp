//
//  HomeViewController+Router.swift
//  HomeScreen
//
//  Created by Marcos Vinicius Majeveski De Angeli on 15/12/21.
//

import UIKit
import Base

extension HomeViewController: ScreenRouterable {
    
    public static var routeProp: Route {
        return Route(type: self, asModal: false, paths: ["h"])
    }
    
    public static func canHandle(url: URL) -> Bool {
        if url.pathComponents.contains(where: {$0 == "h"}) {return true}
        return false
    }
    
    public static func vcForURL(url: URL) -> UIViewController? {
        return HomeViewController()
    }
}
