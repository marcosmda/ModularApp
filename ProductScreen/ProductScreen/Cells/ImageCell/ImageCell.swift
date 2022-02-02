//
//  ImageCell.swift
//  ProductScreen
//
//  Created by Marcos Vinicius Majeveski De Angeli on 21/12/21.
//

import UIKit
import Base

public class Image: CellContent {
    var id: String?
    var image: UIImage? {
        didSet {
            cell?.configure(self)
        }
    }
    weak private var cell: ImageCell?
    
    public init(_ id: String?) {
        self.id = id
        super.init()
        DispatchQueue.main.async {
            self.fetchImage()
        }
    }
    
    public override func asCell() -> UITableViewCell? {
        guard let cell = tableView?.dequeueReusableCell(withIdentifier: identifier()) as? ImageCell else {return nil}
        cell.configure(self)
        self.cell = cell
        return cell
    }
    
    private func fetchImage() {
        guard let imagePublicId = id else {return}
        ImageAPI().fetch(size: .size500x500, id: imagePublicId) { optionalData in
            guard let data = optionalData else {return}
            self.image = UIImage(data: data)
        }
    }
}

public class ImageCell: UITableViewCell {
    
    @IBOutlet weak var productImage: UIImageView?
    
    public func configure(_ image: Image) {
        guard let imageView = productImage else {return}
        if imageView.image == nil {
            self.isUserInteractionEnabled = false
                self.productImage?.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.width).isActive = true
            imageView.image = image.image
                image.tableView?.reloadData()
        }
        if imageView.backgroundColor != .lightGray {
            self.isUserInteractionEnabled = false
            imageView.backgroundColor = .lightGray
                self.productImage?.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.width).isActive = true
                image.tableView?.reloadData()
        }
    }
}
