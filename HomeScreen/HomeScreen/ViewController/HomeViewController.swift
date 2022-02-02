//
//  HomeViewController.swift
//  HomeScreen
//
//  Created by Marcos Vinicius Majeveski De Angeli on 15/12/21.
//

import UIKit
import Base

public class HomeViewController: UIViewController {
    
    let cells: [CellContent] =
        Title("Home") |-|
        20 |-|
        Text("It is Something, Ain't it?")
        
    let table = TableView()
    
    public override func viewDidLoad() {
        table.start(with: cells, vc: self)
        
        let button = UIButton(frame: CGRect(x: 0, y: UIScreen.main.bounds.height/2, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height/2))
        button.addTarget(self, action: #selector(pressed), for: .touchUpInside)
        view.addSubview(button)
    }
    
    @objc func pressed() {
        ScreenRouter.shared.go(url: URL(string: "https://www.domain.com/s")!)
    }
    
}
