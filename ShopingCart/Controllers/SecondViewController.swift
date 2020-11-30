//
//  SecondViewController.swift
//  ShopingCart
//
//  Created by amrutha on 26/11/20.
//  Copyright © 2020 amrutha. All rights reserved.
//

import UIKit

class SecondViewController : UIViewController {
        
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var textView: UITextView!
    //  @IBOutlet weak var textLabel: UILabel!
    
    var name : String = ""
    var details : String = ""
    override func viewDidLoad() {
            super.viewDidLoad()
          
        imageView.image = UIImage(named: name)
        textView.text = details
        
        }
   
}
            
       

