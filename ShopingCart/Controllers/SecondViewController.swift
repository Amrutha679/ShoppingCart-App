//
//  SecondViewController.swift
//  ShopingCart
//
//  Created by amrutha on 26/11/20.
//  Copyright © 2020 amrutha. All rights reserved.
//

import UIKit

class SecondViewContrller :UIViewController,UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout {
    
    @IBOutlet weak var collectionVIew: UICollectionView!
    
    //var Data = CollectionData()
    let  data = ["watch1","watch2","watch3"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionVIew.register(UINib(nibName:"CollectionViewCell", bundle:nil),forCellWithReuseIdentifier:"CollectionViewCell")
        collectionVIew.delegate = self
        collectionVIew.dataSource = self
        
    }
   
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewCell", for: indexPath) as! CollectionViewCell
        cell.configure(with: UIImage(named: "image5")!)
        return cell
    }
    
        
       
}
