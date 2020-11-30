//
//  ViewController.swift
//  ShopingCart
//
//  Created by amrutha on 26/11/20.
//  Copyright © 2020 amrutha. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let  data = ["watch1","watch2","watch4","watch5"]
    let details = ["Apple Watch SE GPS 40mm Space Grey Aluminium Case-Black Sport Band Regular 800$","New Apple Watch Series 6 GPS+Cellular,40mm space grey aluminium case with black sportband regular $760  Band","New Apple Watch Series 6 GPS+Cellular,40mm blue aluminium case with Deep Navy sportband regular $760 ","Apple Watch SE GPS 40mm Space Grey Aluminium Case-Black Sport Band Regular 840$"]
    
    var pokemonNames : [String]!
    var pokeData : PokemonData?
    
     @IBOutlet weak var collectionVIew: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        gettingData()
        let layout = UICollectionViewFlowLayout()
        collectionVIew.collectionViewLayout = layout
        layout.itemSize = CGSize(width: 200, height: 300)
        collectionVIew.register(UINib(nibName:"CollectionViewCell", bundle:nil),forCellWithReuseIdentifier:"CollectionViewCell")
        collectionVIew.delegate = self
        collectionVIew.dataSource = self
        
    }
    func gettingData() {
       var semaphore = DispatchSemaphore (value: 0)

       var request = URLRequest(url: URL(string: "https://pokeapi.co/api/v2/egg-group/monster")!,timeoutInterval: Double.infinity)
       request.httpMethod = "GET"

       let task = URLSession.shared.dataTask(with: request) { data, response, error in
         guard let data = data else {
           print(String(describing: error))
           return
         }
         print(String(data: data, encoding: .utf8)!)
         semaphore.signal()
        do {
            
            let decoder = JSONDecoder()
            let response = try decoder.decode(PokemonData.self,from:data)
            DispatchQueue.main.async {
                
                self.pokeData = response
                self.pokemonNames = [self.pokeData?.pokemonSpecies[0].name ?? "",self.pokeData?.names[0].name ?? "",self.pokeData?.name ?? ""]
                
//                print(self.pokeData?.pokemonSpecies[0].name ?? "")
//                print(self.pokeData?.names[0].name ?? "")
//                print(self.pokeData?.name ?? "")
                print(self.pokemonNames)
                self.collectionVIew.reloadData()

            }
        }
        catch {
            print(error)
        }
       }

       task.resume()
       semaphore.wait()
    }
}
    extension ViewController: UICollectionViewDataSource {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.count
           }
           
           func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
               let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewCell", for: indexPath) as! CollectionViewCell
            cell.configure(UIImage(named: data[indexPath.row])!)
    
               return cell
           }
       }
extension ViewController:  UICollectionViewDelegate {
           
           func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
               //collectionView.deselectItem(at: indexPath, animated: true)
               let vc = storyboard?.instantiateViewController(withIdentifier: "SecondViewController") as?  SecondViewController
               vc?.name = data[indexPath.row]
               vc?.details = details[indexPath.row]
               self.navigationController?.pushViewController(vc!, animated: true)
              // print("you tapped me")
               
           }
       }
extension ViewController: UICollectionViewDelegateFlowLayout {
           
           
           func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeforItemAt indexPath: IndexPath) -> CGSize {
               
               return CGSize(width: 200, height: 300)
           }
           
}
    

