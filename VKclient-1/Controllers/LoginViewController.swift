//
//  LoginViewController.swift
//  VKclient-1
//
//  Created by Тарас Пешков on 13.10.2021.
//

import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet weak var logoImage: UIImageView!
    @IBOutlet weak var gradientView: UIView!
    @IBOutlet weak var vkLabel: UILabel!
    @IBOutlet weak var loginTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    
    var isLikeOn = false
    
    let gradientLayer = CAGradientLayer()
    
    func addShadow(view: UIView) {
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowOffset = CGSize(width: 5, height: 5)
        view.layer.shadowRadius = 5
        view.layer.shadowOpacity = 0.2
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        gradientLayer.frame = gradientView.bounds
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        animateLogin()
        
        let tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
        tapRecognizer.cancelsTouchesInView = false
        self.view.addGestureRecognizer(tapRecognizer)
        
        addShadow(view: loginTextField)
        addShadow(view: passwordTextField)
        addShadow(view: loginButton)
        
        gradientLayer.colors = [UIColor.white.cgColor, UIColor.systemGray4.cgColor]
        gradientLayer.locations = [0, 1]
        gradientLayer.startPoint = CGPoint.zero
        gradientLayer.endPoint = CGPoint.init(x: 0, y: 1)
        
        gradientLayer.frame = gradientView.bounds
        gradientView.layer.addSublayer(gradientLayer)
    }
    
    //MARK: - Hide keyboard
    @objc func hideKeyboard() {
        self.view.endEditing(true)
    }
    
    // MARK: - checkUserLogin
    
    @IBAction func pressButton(_ sender: UIButton) {
        
      // performSegue(withIdentifier: "toMainView", sender: nil) // вход без авторизации
        
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
            } else if
                userName == "Admin" && userPassword == "Admin" {
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
    
    //MARK: - AnimateLogin
    
    func animateLogin() {
        
        self.logoImage.transform = CGAffineTransform(translationX: 0, y: -50)
        self.loginTextField.transform = CGAffineTransform(translationX: -70, y: 0)
        self.passwordTextField.transform = CGAffineTransform(translationX: 70, y: 0)
        self.loginButton.transform = CGAffineTransform(translationX: 0, y: +100)
        
        UIView.animate(withDuration: 3,
                       delay: 0,
                       usingSpringWithDamping: 0.2,
                       initialSpringVelocity: 10,
                       options: [] ) {
            self.logoImage.transform = .identity
            self.loginTextField.transform = .identity
            self.passwordTextField.transform = .identity
            self.loginButton.transform = .identity
        }
        
    }
    
}
