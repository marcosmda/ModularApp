//
//  Bootstrap.swift
//  HomeScreen
//
//  Created by Marcos Vinicius Majeveski De Angeli on 16/12/21.
//

import Foundation
import Base

public func bootstrap() {
    ScreenRouter.shared.register(HomeViewController.routeProp)
}
