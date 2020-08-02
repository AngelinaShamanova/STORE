//
//  StorefrontCell.swift
//  STORE
//
//  Created by MacBook on 25/07/2020.
//  Copyright © 2020 mybestcompany.com. All rights reserved.
//

import UIKit
import RealmSwift


class StorefrontCell: UICollectionViewCell {
    
    var product: Results<Product>!
    
    @IBOutlet var name: UILabel!
    @IBOutlet var price: UILabel!
    @IBOutlet var quantity: UILabel!
    @IBOutlet var buy: UIButton!
    
    func configure(with productList: Product) {
        buy.layer.cornerRadius = 10
        buy.isHidden = false 
        name.text = "Наименование товара: \(productList.name)"
        price.text = "Цена: \(productList.price)"
        quantity.text = "Количество: \(productList.quantity)"
    }
    
    func configureNotAvailableProduct(with productList: Product) {
        buy.isHidden = true
        name.text = "Наименование товара: \(productList.name)"
        price.text = "Цена: \(productList.price)"
        quantity.text = "ТОВАРА НЕТ В НАЛИЧИИ"
    }
    
    @IBAction func buyAction(_ sender: UIButton) {
        
        let results = realm.objects(Product.self)
        
        for product in results {
            
            let newQt = product.quantity - 1
            quantity.text = "Количество: \(newQt)"
            
            try! realm.write {
                product.quantity = newQt
            }
            
                if product.quantity == 0 {
                    self.buy.isHidden = true
                    self.reloadInputViews()
                    self.quantity.text = "ТОВАРА НЕТ В НАЛИЧИИ"
                } else { return }
            }
    }
}
