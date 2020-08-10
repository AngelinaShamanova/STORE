//
//  JsonService.swift
//  STORE
//
//  Created by MacBook on 02.08.2020.
//  Copyright © 2020 mybestcompany.com. All rights reserved.
//

import Foundation

class DataLoader {
    
    @Published var productInformation = [ProductInformation]()
    
    init() {
        load()
    }
    
    func load() {
        
        if let fileLocation = Bundle.main.url(forResource: "data", withExtension: "json") {
            
            do {
                let data = try Data(contentsOf: fileLocation)
                let jsonDecoder = JSONDecoder()
                let dataFromJson = try jsonDecoder.decode([ProductInformation].self, from: data)
                
                self.productInformation = dataFromJson
            } catch {
                print("Error!")
            }
        }
    }
}
