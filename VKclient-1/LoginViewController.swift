//
//  LoginViewController.swift
//  VKclient-1
//
//  Created by Тарас Пешков on 13.10.2021.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var loginTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
        self.view.addGestureRecognizer(tapRecognizer)
    }
    
    //MARK: - Hide keyboard
    @objc func hideKeyboard() {
        self.view.endEditing(true)
    }
    
    // MARK: - checkUserLogin
    
    @IBAction func pressButton(_ sender: UIButton) {
        
        if let userName = loginTextField.text,
           let userPassword = passwordTextField.text {
            
            if userName.isEmpty || userPassword.isEmpty {
                checkUserAlert(message: "Введите данные для авторизации!")
                loginTextField.textColor = UIColor.red
                passwordTextField.textColor = UIColor.red
                
            } else if
                userName != "Admin" || userPassword != "Admin" {
                checkUserAlert(message: "Неверное имя пользователя или пароль!")
                loginTextField.textColor = UIColor.red
                passwordTextField.textColor = UIColor.red
            }
            
            else if userName == "Admin" && userPassword == "Admin" {
                performSegue(withIdentifier: "toMainView", sender: nil)
            }
        }
   
    }
    
    //MARK: - Alert
    func checkUserAlert(message: String) {
        let alert = UIAlertController(title: "Ошибка", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    //MARK: - TextField Editing
    @IBAction func loginTextFieldEditing(_ sender: UITextField) {
        loginTextField.textColor = UIColor.label
    }
    
    @IBAction func passwordTextFieldEditing(_ sender: UITextField) {
        passwordTextField.textColor = UIColor.label
    }
    
}
