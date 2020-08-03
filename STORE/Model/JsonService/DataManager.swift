//
//  DataManager.swift
//  STORE
//
//  Created by MacBook on 03.08.2020.
//  Copyright © 2020 mybestcompany.com. All rights reserved.
//

import RealmSwift

class DataManager {
    
    let jsonData = DataLoader().productInformation
    let product = Product()
    
    init() {
    }
    
    func saveDataToRealm() {
        
        
        try! realm.write {
            jsonData
        }
    }
}
