//
//  JsonService.swift
//  STORE
//
//  Created by MacBook on 02.08.2020.
//  Copyright © 2020 mybestcompany.com. All rights reserved.
//

import Foundation

class JsonService {
    
    func request(_ forResourse: String, _ withExtension: String, completion: @escaping (ProductInformation?, Error?) -> Void?) {
        
        guard let fileURL = Bundle.main.url(forResource: forResourse, withExtension: withExtension) else {
            print("couldn't find the file")
            return
        }
        URLSession.shared.dataTask(with: fileURL) { (data, responce, error) in
            DispatchQueue.main.async {
                if let error = error {
                    print("Some error!")
                    completion(nil, error)
                    return
                }
                guard let data = data else { return }
                
                do {
                    let products = try JSONDecoder().decode(ProductInformation.self, from: data)
                    completion(products, nil)
                } catch let jsonError {
                    print("Failed to decode JSON", jsonError)
                    completion(nil, jsonError)
                }
                
            }
        }.resume()
    }
    
}
