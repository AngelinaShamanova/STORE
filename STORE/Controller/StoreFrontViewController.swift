//
//  StoreFrontViewController.swift
//  STORE
//
//  Created by MacBook on 24/07/2020.
//  Copyright © 2020 mybestcompany.com. All rights reserved.
//

import UIKit
import RealmSwift

class StoreFrontViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    var product: Results<Product>!
    var products: ProductInformation? = nil
    let jsonService = JsonService()
     var storageManager = StorageManager()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        fetchData("data", "json")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        product = realm.objects(Product.self)
        self.collectionView.register(UINib(nibName: "StorefrontCell", bundle: nil), forCellWithReuseIdentifier: "StorefrontCell")
        
    }
    
    // MARK: UICollectionViewDataSource
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return products?.productInfo.count ?? 0
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "StorefrontCell", for: indexPath) as! StorefrontCell
        
        saveDataToRealm(productJson: products!, at: indexPath)
        
        let productInfo = product[indexPath.item]
    
            if productInfo.quantity != 0 {
                cell.configure(with: productInfo)
            } else {
                cell.configureNotAvailableProduct(with: productInfo)
            }
        
        
        return cell
    }
    
    // MARK: UICollectionViewDelegate
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: UIScreen.main.bounds.width - 10, height: UIScreen.main.bounds.width)
    }
    
    func saveDataToRealm(productJson: ProductInformation, at indexPath: IndexPath) {
         
         try! realm.write {
             let productsRealm = Product()
             
            productsRealm.name = productJson.productInfo[indexPath.row].name
            productsRealm.price = productJson.productInfo[indexPath.row].price
            productsRealm.quantity = productJson.productInfo[indexPath.row].quantity
             
             realm.add(productsRealm)
         }
     }
    
    func fetchData(_ forResource: String, _ withExtension: String) {
        self.jsonService.request(forResource, withExtension, completion: { [weak self] (prods, error) in
            prods.map({ (prod) in
                self?.products = prods
                self?.collectionView.reloadData()
            })
        })
    }
}
