//
//  ProductViewController.swift
//  ProductScreen
//
//  Created by Marcos Vinicius Majeveski De Angeli on 17/12/21.
//

import UIKit
import Base

public class ProductViewController: UIViewController {
    
    private var product: ProductData?
    
    private var productId: Int
    
    public init(_ id: Int) {
        self.productId = id
        super.init(nibName: nil, bundle: nil)
        DispatchQueue.main.async {
            self.fetchProduct()
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    lazy var cells: [CellContent] =
    Image(product?.photos?.first) |-| 10 |-| BrandCondition(brand: product?.brand?.name, used: product?.used) |-| 10 |-| Pricing(product?.id) |-| 10 |-| Title(product?.title ?? "") |-| 10 |-| Text(product?.description ?? "") |-| 10 |-| StoreInfo(product?.sellerId)
        
    let table = TableView()
    
    public override func viewDidLoad() {
        
    }
    
    func fetchProduct() {
        ProductAPI().fetch(id: productId) { productData in
            guard let data = productData else {return}
            self.product = data
            self.table.start(with: self.cells, vc: self)
        }
    }
    
}


