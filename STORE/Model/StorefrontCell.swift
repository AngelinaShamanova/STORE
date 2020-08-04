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
    let data = DataLoader().productInformation
    
    @IBOutlet var name: UILabel!
    @IBOutlet var price: UILabel!
    @IBOutlet var quantity: UILabel!
    @IBOutlet var buy: UIButton!
    
    private var productName: String!
    private var row: Int!
    
    func configure(with productList: Product, row: Int) {
        productName = productList.name
        self.row = row
        
        buy.layer.cornerRadius = 10
        buy.isHidden = false
        name.text = "Наименование товара: \(productList.name)"
        price.text = "Цена: \(productList.price)"
        quantity.text = "Количество: \(productList.quantity)"
    }
    
    func configureNotAvailableProduct(with productList: Product, row: Int) {
        productName = productList.name
        self.row = row
        
        buy.isHidden = true
        name.text = "Наименование товара: \(productList.name)"
        price.text = "Цена: \(productList.price)"
        quantity.text = "ТОВАРА НЕТ В НАЛИЧИИ"
    }
    
    @IBAction func buyAction(_ sender: UIButton) {
        
        let result = realm.objects(Product.self).first { $0.name == productName }!
        let newQt = result.quantity - 1
        quantity.text = "Количество: \(newQt)"
        
        try! realm.write {
            result.quantity = newQt
        }
        if result.quantity == 0 {
            self.buy.isHidden = true
            self.quantity.text = "ТОВАРА НЕТ В НАЛИЧИИ"
        }
        
        NotificationCenter.default.post(name: NSNotification.Name("UpdateBack"), object: productName)
    }
}
