//
//  ViewController.swift
//  personalinfo
//
//  Created by Кирилл Файфер on 28.08.2020.
//  Copyright © 2020 Кирилл Файфер. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet var userNameTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    
    @IBOutlet var logInButton: UIButton!
    
    var userField: String!
    var passwordField: String!
    
    override func viewDidLoad() {
        super .viewDidLoad()
        
        userNameTextField.delegate = self
        passwordTextField.delegate = self
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "tabBarSegue" {
            let tabBarController = segue.destination as? UITabBarController
            guard let destinationVC = tabBarController?.viewControllers?.first as? FirstTabBarViewController else { return }
            
            if let user = userNameTextField.text {
                destinationVC.welcome = "Welcome, \(user) ✌️"
            }
        }
    }
    
    @IBAction func goIntoTabBarController() {
        guard let userName = userNameTextField.text, !userName.isEmpty else {
            showAlert(with: "Invalid Login and Password",
                      and: "Please, enter correct login and password")
            return
        }
        
        guard let password = passwordTextField.text, !password.isEmpty else {
            showAlert(with: "Invalid Password",
                      and: "Please, enter password")
            return
        }
        
        if userName == UserInfo.getUserName() && password == UserInfo.getPassword() {
            performSegue(withIdentifier: "tabBarSegue", sender: nil)
        } else {
            showAlert(with: "Invalid Login or Password",
                      and: "Please, enter correct login and password")
            
            passwordTextField.text = ""
        }
    }
    
    @IBAction func forgotLoginButton() {
        showAlert(with: "Oh, thats a pitty",
                  and: "Your User Name is - \(UserInfo.getUserName())")
    }
    @IBAction func forgotPasswordButton() {
        showAlert(with: "Oh, thats a pitty",
                  and: "Your Password is - \(UserInfo.getPassword())" )
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if let nextField = textField.superview?.viewWithTag(textField.tag + 1) as? UITextField {
            nextField.becomeFirstResponder()
        } else {
            goIntoTabBarController()
        }
        return false
    }
}

extension ViewController {
    private func showAlert (with title: String, and message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Okay", style: .default)
        
        alert.addAction(okAction)
        
        present(alert, animated: true)
    }
}
