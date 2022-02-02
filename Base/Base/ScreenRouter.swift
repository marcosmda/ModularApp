//
//  BaseViewController.swift
//  Base
//
//  Created by Marcos Vinicius Majeveski De Angeli on 15/12/21.
//

import UIKit

public class ScreenRouter {
    public static let shared = ScreenRouter()
    public var routes = [ScreenRouterable.Type]()
    public weak var navigationController: UINavigationController?
    
    private init() {}
    
    public func go(url: URL, animated: Bool = true) {
        for route in ScreenRouter.shared.routes {
            if let vc = route.vcForURL(url: url), route.canHandle(url: url) {
                if route.routeProp.modalPrefered {
                    navigationController?.present(vc, animated: animated)
                } else {
                    navigationController?.pushViewController(vc, animated: animated)
                }
            }
        }
    }
    
    public func register(_ route: Route) {
        if let registeredRoute = routes.filter({$0 == route.type}).first, registeredRoute == route.type {return}
        routes.append(route.type)
    }
}

public protocol ScreenRouterable: UIViewController {
    static var routeProp: Route {get}
    
    static func canHandle(url: URL) -> Bool
    static func vcForURL(url: URL) -> UIViewController?
}

public extension ScreenRouterable {
    static func canHandle(url: URL) -> Bool {
        for path in routeProp.pathsAccepted {
            if path == url.pathComponents[1] {
                return true
            }
        }
        return false
    }
}


public struct Route {
    let type: ScreenRouterable.Type
    let modalPrefered: Bool
    let pathsAccepted: [String]
    var queries: [String: String] = [:]
    
    public init(type: ScreenRouterable.Type, asModal: Bool, paths: [String]) {
        self.type = type
        self.modalPrefered = asModal
        self.pathsAccepted = paths
    }
}
