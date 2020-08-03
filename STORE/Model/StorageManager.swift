//
//  StorageManager.swift
//  STORE
//
//  Created by MacBook on 24/07/2020.
//  Copyright © 2020 mybestcompany.com. All rights reserved.
//

import RealmSwift

let realm = try! Realm()

class StorageManager {
    
    static func save(_ productList: Product) {
        try! realm.write {
            realm.add(productList)
        }
    }
    
    static func delete(_ productInfo: Product) {
        try! realm.write {
            let product = productInfo
            realm.delete(product)
        }
    }
    
    static func edit(_ product: Product, newName: String, newPrice: String, newQuantity: Int) {
        try! realm.write {
            product.name = newName
            product.price = newPrice
            product.quantity = newQuantity
        }
    }
    static func create(_ product: Product, from json: ProductInformation) {
        try! realm.write {
            product.name = json.name
            product.price = json.price
            product.quantity = json.quantity
            realm.add(product)
        }
    }
}
