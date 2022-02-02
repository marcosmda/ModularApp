//
//  AppDelegate.swift
//  Modular_APP
//
//  Created by Marcos Vinicius Majeveski De Angeli on 20/12/21.
//

import UIKit
import Base
import HomeScreen

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow(frame: UIScreen.main.bounds)
        bootstrap()
        
        let navigationController = UINavigationController(rootViewController: HomeViewController())
        ScreenRouter.shared.navigationController = navigationController
        window?.rootViewController = navigationController
        setNavigationBar()
        
        window?.makeKeyAndVisible()
        return true
    }


}

