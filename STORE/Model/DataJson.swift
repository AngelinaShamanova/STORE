//
//  DataJson.swift
//  STORE
//
//  Created by MacBook on 01.08.2020.
//  Copyright © 2020 mybestcompany.com. All rights reserved.
//

import Foundation

struct ProductInformation: Decodable, Encodable {
    let productInfo: [ProductInfo]
}

struct ProductInfo: Decodable, Encodable {
    let name: String
    let price: String
    let quantity: Int
}
