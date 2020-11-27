//
//  SecondViewController.swift
//  ShopingCart
//
//  Created by amrutha on 26/11/20.
//  Copyright © 2020 amrutha. All rights reserved.
//

import UIKit

class SecondViewContrller : UIViewController {
    
    @IBOutlet weak var collectionVIew: UICollectionView!
    
    //var Data = CollectionData()
    let  data = ["watch2","watch3","image5"]
    
    override func viewDidLoad() {
        //super.viewDidLoad()
        //gettingData()
        let layout = UICollectionViewFlowLayout()
        collectionVIew.collectionViewLayout = layout
        layout.itemSize = CGSize(width: 400, height: 400)
        collectionVIew.register(UINib(nibName:"CollectionViewCell", bundle:nil),forCellWithReuseIdentifier:"CollectionViewCell")
        collectionVIew.delegate = self
        collectionVIew.dataSource = self
        
    }
}
extension SecondViewContrller: UICollectionViewDataSource {
        
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewCell", for: indexPath) as! CollectionViewCell
        cell.configure(UIImage(named: data[indexPath.row])!)
        return cell
    }
}
extension SecondViewContrller: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
        print("you tapped me")
    }
}

extension SecondViewContrller: UICollectionViewDelegateFlowLayout {
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeforItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: 400, height: 400)
    }
    
}
   /* func gettingData()
    {
        let headers = [
            "x-rapidapi-key": "4aa0f13539msh34fda854e492f73p103d3bjsn8d4920e27193",
            "x-rapidapi-host": "holidayapi1.p.rapidapi.com"
        ]

        let request = NSMutableURLRequest(url: NSURL(string: "https://holidayapi1.p.rapidapi.com/holidays?country=US&year=2019&pretty=0&format=json")! as URL,
                                                cachePolicy: .useProtocolCachePolicy,
                                            timeoutInterval: 10.0)
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = headers

        let session = URLSession.shared
        let dataTask = session.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) -> Void in
            if (error != nil) {
                print(error)
            } else {
                let httpResponse = response as? HTTPURLResponse
                print(httpResponse)
            }
            print(error)
           print(String(data: data!, encoding: .utf8)!)
        })

        dataTask.resume()
            
    }*/


