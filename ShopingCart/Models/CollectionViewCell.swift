//
//  CollectionViewCell.swift
//  ShopingCart
//
//  Created by amrutha on 26/11/20.
//  Copyright © 2020 amrutha. All rights reserved.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var textLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    func configure(with image5: UIImage) {
        
        imageView.image = image5
    }

}
