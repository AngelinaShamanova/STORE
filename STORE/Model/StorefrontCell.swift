//
//  StorefrontCell.swift
//  STORE
//
//  Created by MacBook on 25/07/2020.
//  Copyright © 2020 mybestcompany.com. All rights reserved.
//

import UIKit

class StorefrontCell: UICollectionViewCell {
    
    @IBOutlet var name: UILabel!
    @IBOutlet var price: UILabel!
    @IBOutlet var quantity: UILabel!
    @IBOutlet var buy: UIButton!
    
    func configure(with productList: Product) {
        buy.layer.cornerRadius = 10
        name.text = "Наименование товара: \(productList.name)"
        price.text = "Цена: \(productList.price)"
        quantity.text = "Количество: \(productList.quantity)"
    }
    
    func configureDeleteCell(with productList: Product) {
        buy.isHidden = true
        name.text = "Наименование товара: \(productList.name)"
        price.text = "Цена: \(productList.price)"
        quantity.text = "Товара нет в наличии"
    }
    
    @IBAction func buyAction(_ sender: UIButton, with productList: Product) {
    
    }
    
}
