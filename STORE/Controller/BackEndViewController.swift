//
//  BackEndViewController.swift
//  STORE
//
//  Created by MacBook on 24/07/2020.
//  Copyright © 2020 mybestcompany.com. All rights reserved.
//

import UIKit
import RealmSwift

class BackEndViewController: UITableViewController {
    
    // MARK: - Public Properties
    var productsDetail: Results<Product>!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        productsDetail = realm.objects(Product.self)
    }
    
    @IBAction func  addButtonPressed(_ sender: Any) {
        alerForAddAndUpdateList()
    }
    
    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return productsDetail.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ProductCell", for: indexPath) as! ProductCell
        
        let productInfo = productsDetail[indexPath.row]
        cell.configure(with: productInfo)
        
        return cell
    }
    
    // MARK: - Table view delegate
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    
    // MARK: - Swipe Actions
    func editAction(at indexPath: IndexPath) -> UIContextualAction {
        
        let products = productsDetail[indexPath.row]
        
        let editAction = UIContextualAction(style: .normal, title: "Edit") { (_, _, _) in
            self.alerForAddAndUpdateList(products, completion: {
                self.tableView.reloadRows(at: [indexPath], with: .automatic)
            })
            
        }
        return editAction
    }
    func deleteAction(at indexPath: IndexPath) -> UIContextualAction {
        let products = productsDetail[indexPath.row]
        
        let deleteAction = UIContextualAction(style: .destructive, title: "Delete") { (_, _, _) in
            StorageManager.delete(products)
            self.tableView.deleteRows(at: [indexPath], with: .automatic)
        }
        
        return deleteAction
    }
    
    override func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let edit = editAction(at: indexPath)
        let delete = deleteAction(at: indexPath)
        
        return UISwipeActionsConfiguration(actions: [delete, edit])
    }
}

    // MARK: - Extension
extension BackEndViewController {
    
    private func alerForAddAndUpdateList(_ productName: Product? = nil, completion: (() -> Void)? = nil) {
        
        var title = "Новый товар"
        var doneButton = "Сохранить"
        
        if productName != nil {
            title = "Редактировать"
            doneButton = "Обновить"
        }
        
        let alert = UIAlertController(title: title, message: "Пожалуйста, введите данные о товаре", preferredStyle: .alert)
        var nameTextField: UITextField!
        var priceTextField: UITextField!
        var quantityTextField: UITextField!
        
        let saveAction = UIAlertAction(title: doneButton, style: .default) { _ in
            guard let newName = nameTextField.text, !newName.isEmpty, let newPrice = priceTextField.text, !newPrice.isEmpty, let newQuantity = quantityTextField.text, !newQuantity.isEmpty else { return }
            
            if let productName = productName {
                StorageManager.edit(productName, newName: newName, newPrice: newPrice, newQuantity: newQuantity)
                if completion != nil { completion!() }
            } else {
                
                let productsList = Product()
                productsList.name = newName
                productsList.price = newPrice
                productsList.quantity = newQuantity
                
                StorageManager.save(productsList)
                
                self.tableView.insertRows(at: [IndexPath(
                    row: self.productsDetail.count - 1, section: 0)], with: .automatic
                )
            }
            
        }
        
        let cancelAction = UIAlertAction(title: "Отмена", style: .destructive)
        
        alert.addAction(saveAction)
        alert.addAction(cancelAction)
        
        alert.addTextField { textField in
            nameTextField = textField
            nameTextField.placeholder = "Наименование товара"
        }
        
        alert.addTextField { textField in
            priceTextField = textField
            priceTextField.placeholder = "Цена"
        }
        
        alert.addTextField { textField in
            quantityTextField = textField
            quantityTextField.placeholder = "Количество товара"
        }
        
        if let productsName = productName {
            nameTextField.text = productsName.name
            priceTextField.text = productsName.price
            quantityTextField.text = productsName.quantity
        }
        
        present(alert, animated: true)
    }
    
}

