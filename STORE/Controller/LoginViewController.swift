//
//  LogInViewController.swift
//  STORE
//
//  Created by MacBook on 03.08.2020.
//  Copyright © 2020 mybestcompany.com. All rights reserved.
//

import UIKit
import RealmSwift

class LoginViewController: UIViewController {
    
    @IBOutlet var userNameTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    @IBOutlet var logInButton: UIButton!
    
    private let userName = "User"
    private let password = "12345"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        logInButton.layer.cornerRadius = 15
        let data = DataLoader().productInformation
        print(data.count)
    }
    
    // MARK: Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == "logIn" else { return }
        
    }
    // MARK: IB Actions
    @IBAction func logInPressed() {
        guard
            userNameTextField.text == userName,
            passwordTextField.text == password
            else {
                showAlert(title: "Invalid login or password",
                          message: "Please, enter correct login and password",
                          textField: passwordTextField)
                return
        }
        
        performSegue(withIdentifier: "logIn", sender: nil)
    }
    
    @IBAction func forgotUserNamePressed() {
        showAlert(title: "Oops!",
                  message: "Your name is \(userName)")
    }
    
    @IBAction func forgotPasswordPressed() {
        showAlert(title: "Oops!",
                  message: "Your password is \(password)")
    }
}

// MARK: - Alert Controller
extension LoginViewController {
    private func showAlert(title: String, message: String, textField: UITextField? = nil) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default) { _ in
            textField?.text = nil
        }
        alert.addAction(okAction)
        present(alert, animated: true)
    }
}

// MARK: Text Field Delegate
extension LoginViewController: UITextFieldDelegate {
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super .touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == userNameTextField {
            textField.resignFirstResponder()
            passwordTextField.becomeFirstResponder()
        } else {
            logInPressed()
        }
        return true
    }
}
