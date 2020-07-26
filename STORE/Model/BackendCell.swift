//
//  BackendCell.swift
//  STORE
//
//  Created by MacBook on 24/07/2020.
//  Copyright © 2020 mybestcompany.com. All rights reserved.
//

import UIKit

class BackendCell: UITableViewCell {

    @IBOutlet var name: UILabel!
    @IBOutlet var price: UILabel!
    @IBOutlet var quantity: UILabel!
    
    func configure(with productList: Product) {
        name.text = "Наименование товара: \(productList.name)"
        price.text = "Цена: \(productList.price)"
        quantity.text = "Количество: \(productList.quantity)"
    }

}
