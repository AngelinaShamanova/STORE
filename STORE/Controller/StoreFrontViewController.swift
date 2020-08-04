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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        product = realm.objects(Product.self)
        
        self.collectionView.register(UINib(nibName: "StorefrontCell", bundle: nil), forCellWithReuseIdentifier: "StorefrontCell")
        
        NotificationCenter.default.addObserver(self, selector: #selector(didUpdateFront), name: NSNotification.Name("UpdateFront"), object: nil)
    }
    
    @objc
    func didUpdateFront(notification: NSNotification) {
        let productName = notification.object as! String
        let row = product.firstIndex(where: { $0.name == productName })!
        collectionView.reloadItems(at: [IndexPath(row: row, section: 0)])
    }
    
    // MARK: UICollectionViewDataSource
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return product.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "StorefrontCell", for: indexPath) as! StorefrontCell
        
        let productInfo = product[indexPath.item]
        
        if productInfo.quantity != 0 {
            cell.configure(with: productInfo, row: indexPath.item)
        } else {
            cell.configureNotAvailableProduct(with: productInfo, row: indexPath.item)
        }
        
        return cell
    }
    
    // MARK: UICollectionViewDelegate
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: UIScreen.main.bounds.width - 10, height: UIScreen.main.bounds.width)
    }
    
}

