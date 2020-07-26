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
    
    var products: Product!
    var product: Results<Product>!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        collectionView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        product = realm.objects(Product.self)
        self.collectionView.register(UINib(nibName: "StorefrontCell", bundle: nil), forCellWithReuseIdentifier: "StorefrontCell")
        
    }
    
    // MARK: UICollectionViewDataSource
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return product.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "StorefrontCell", for: indexPath) as! StorefrontCell
    
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
}

