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
    
    //static let identifier = "CollectionViewCell"
    override func awakeFromNib() {
      //  super.awakeFromNib()
        // Initialization code
    }
  public func configure(_ image: UIImage) {
        
    self.imageView.image = image
    }
}
