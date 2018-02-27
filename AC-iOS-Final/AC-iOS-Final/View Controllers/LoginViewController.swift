//
//  LoginViewController.swift
//  AC-iOS-Final
//
//  Created by C4Q on 2/26/18.
//  Copyright © 2018 C4Q . All rights reserved.
//

import UIKit
import SnapKit
import FirebaseAuth

class LoginViewController: UIViewController {
    
    let loginView = LoginView()
    private var firebaseAuth = FirebaseAuthorization()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpLoginView()
        firebaseAuth.delegate = self
        loginView.loginButton.addTarget(self, action: #selector(login), for: .touchUpInside)
        loginView.registerButton.addTarget(self, action: #selector(register), for: .touchUpInside)
    }
    
    private func setUpLoginView() {
        view.addSubview(loginView)
        loginView.snp.makeConstraints { login in
            login.edges.equalTo(self.view.safeAreaLayoutGuide).inset(UIEdgeInsetsMake(0, 0, 0, 0))
        }
        
    }
    
    private func getEmail() -> String {
        guard let email = loginView.emailTF.text, !email.isEmpty else { return "Email is Empty"}
        return email
    }
    
    private func getPassWord() -> String {
        guard let password = loginView.passwordTF.text, !password.isEmpty else { return "Password is Empty" }
        return password
    }
    
    @objc private func login() {
        firebaseAuth.signInUser(email: getEmail(), password: getPassWord())
    }
    
    @objc private func register() {
        firebaseAuth.registerUser(email: getEmail(), password: getPassWord())
        
    }
    
    func showAlert(title: String, message: String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okCancel = UIAlertAction(title: "Ok", style: .default, handler: nil)
        alertController.addAction(okCancel)
        present(alertController, animated: true, completion: nil)
    }
    
    
}

extension LoginViewController: FirebaseAuthDelegate {
    
    func didCreateUser(_ userService: FirebaseAuthorization, user: User) {
        print("Successful user creation")
        showAlert(title: "You have joined Meatly!", message: "Please log in.")
        
    }
    
    func didFailCreatingUser(_ userService: FirebaseAuthorization, error: Error) {
        showAlert(title: "Error Creating User", message: error.localizedDescription)
    }
    
    func didSignIn(_ userService: FirebaseAuthorization, user: User) {
        print("Success sign in")
//        let tabBarVC = UINavigationController(rootViewController: TabBarViewController())
        let tabBarVC = TabBarViewController()
        present(tabBarVC, animated: true, completion: nil)
    }
    
    func didFailSigningIn(_ userService: FirebaseAuthorization, error: Error) {
        showAlert(title: "Error Signing In", message: error.localizedDescription)
    }
    
    
}
