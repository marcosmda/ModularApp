//
//  Bootstrap.swift
//  ProductScreen
//
//  Created by Marcos Vinicius Majeveski De Angeli on 17/12/21.
//

import Foundation
import Base

public func bootstrap() {
    ScreenRouter.shared.register(ProductViewController.routeProp)
}
