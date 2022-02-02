//
//  Bootstrap.swift
//  Modular_APP
//
//  Created by Marcos Vinicius Majeveski De Angeli on 20/12/21.
//

import Foundation
import Base
import HomeScreen
import SearchScreen
import ProductScreen

func bootstrap() {
    HomeScreen.bootstrap()
    SearchScreen.bootstrap()
    ProductScreen.bootstrap()
}
