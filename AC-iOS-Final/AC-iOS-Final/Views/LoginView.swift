//
//  LoginView.swift
//  AC-iOS-Final
//
//  Created by C4Q on 2/26/18.
//  Copyright © 2018 C4Q . All rights reserved.
//

import UIKit
import SnapKit

class LoginView: UIView {
    
    lazy var logoIV: UIImageView = {
        let iv = UIImageView()
        iv.image = #imageLiteral(resourceName: "meatly_logo")
        iv.contentMode = UIViewContentMode.scaleToFill
        iv.backgroundColor = .blue
        return iv
    }()
    
    lazy var emailTF: UITextField = {
        let tf = UITextField()
        tf.placeholder = "Email"
        tf.backgroundColor = .purple
        tf.keyboardType = .emailAddress
        return tf
    }()
    
    lazy var passwordTF: UITextField = {
        let tf = UITextField()
        tf.placeholder = "Password"
        tf.backgroundColor = .yellow
        tf.autocapitalizationType = .none
        tf.isSecureTextEntry = true
        return tf
    }()
    
    lazy var loginButton: UIButton = {
        let butt = UIButton()
        butt.setTitle("Sign In", for: .normal)
        butt.backgroundColor = .black
        return butt
    }()
    
    lazy var registerButton: UIButton = {
        let butt = UIButton()
        butt.setTitle("Sign Up", for: .normal)
        butt.backgroundColor = .red
        return butt
    }()
    
    override init(frame: CGRect) {
        super.init(frame: UIScreen.main.bounds)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    private func commonInit() {
        backgroundColor = .white
        setupViews()
    }
    
    private func setupViews() {
        let views = [logoIV, emailTF, passwordTF, loginButton, registerButton] as [UIView]
        views.forEach { addSubview($0)}
        setUpLogoIV()
        setUpEmailTF()
        setUpPassWordTF()
        setUpLogInButton()
        setUpRegisterButton()
    }
    
    private func setUpLogoIV() {
        logoIV.snp.makeConstraints { iv in
            iv.height.equalTo(self.snp.height).multipliedBy(0.4)
            iv.width.equalTo(self.snp.width).multipliedBy(0.7)
            iv.centerX.equalTo(self.snp.centerX)
            iv.top.equalTo(self.snp.top).offset(30)
        }
    }
    
    private func setUpEmailTF() {
        emailTF.snp.makeConstraints { tf in
            tf.centerX.equalTo(self.snp.centerX)
            tf.top.equalTo(logoIV.snp.bottom).offset(20)
            tf.height.equalTo(self.snp.height).multipliedBy(0.05)
            tf.width.equalTo(self.snp.width).multipliedBy(0.6)
        }
    }
    
    private func setUpPassWordTF() {
        passwordTF.snp.makeConstraints { tf in
            tf.centerX.equalTo(self.snp.centerX)
            tf.top.equalTo(emailTF.snp.bottom).offset(10)
            tf.height.equalTo(self.snp.height).multipliedBy(0.05)
            tf.width.equalTo(self.snp.width).multipliedBy(0.6)
            
        }
    }
    
    private func setUpLogInButton() {
        loginButton.snp.makeConstraints { butt in
            butt.height.equalTo(self.snp.height).multipliedBy(0.05)
            butt.width.equalTo(self.snp.width).multipliedBy(0.3)
            butt.top.equalTo(passwordTF.snp.bottom).offset(30)
            butt.left.equalTo(logoIV.snp.left)
        }
    }
    
    private func setUpRegisterButton() {
        registerButton.snp.makeConstraints { butt in
            butt.height.equalTo(self.snp.height).multipliedBy(0.05)
            butt.width.equalTo(self.snp.width).multipliedBy(0.3)
            butt.top.equalTo(passwordTF.snp.bottom).offset(30)
            butt.right.equalTo(logoIV.snp.right)
        }
    }
    
    
}
