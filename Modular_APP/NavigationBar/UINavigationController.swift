//
//  UINavigationController.swift
//  Modular_APP
//
//  Created by Marcos Vinicius Majeveski De Angeli on 21/12/21.
//

import UIKit
import Base

func setNavigationBar() {
    //Logo
    guard let navigationController = ScreenRouter.shared.navigationController else {return}
//    let imageView = UIImageView(image: UIImage(named: "logo"))
//    
//    imageView.heightAnchor.constraint(equalToConstant: 30).isActive = true
//    imageView.widthAnchor.constraint(equalToConstant: 30).isActive = true
//    navigationController.navigationItem.titleView = imageView
    
    //Back Button
    navigationController.navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "arrow.left"), style: .plain, target: nil, action: nil)
    navigationController.navigationItem.leftBarButtonItem?.tintColor = .black
}
