//
//  LoginCardView.swift
//  SaveSense
//
//  Created by Floor de Best on 21/11/2018.
//  Copyright © 2018 dBest Innovations. All rights reserved.
//

import Foundation
import UIKit

extension LoginViewController {
    
    func setupLoginCardView() {
    view.addSubview(loginCardView)
    view.addSubview(loginTopTextLabel)
    view.addSubview(loginEmailTextField)
    view.addSubview(loginPasswordTextField)
    view.addSubview(loginButton)
    view.addSubview(registerTextLink)
        
    toLoginButton.isHidden = true
    toRegisterButton.isHidden = true
    
    loginCardView.backgroundColor = UIColor.gray.withAlphaComponent(0.75)
    loginCardView.layer.cornerRadius = 22
    
    loginTopTextLabel.text = "LOGIN"
    loginTopTextLabel.font = UIFont.boldSystemFont(ofSize: 24)
    loginTopTextLabel.textColor = .white
    
    loginEmailTextField.backgroundColor = .white
    loginEmailTextField.layer.cornerRadius = 20
    loginEmailTextField.textColor = .black
    loginEmailTextField.placeholder = "   Emailadres...."
    
    loginPasswordTextField.backgroundColor = .white
    loginPasswordTextField.layer.cornerRadius = 20
    loginPasswordTextField.textColor = .black
    loginPasswordTextField.placeholder = "   Wachtwoord...."
    loginPasswordTextField.isSecureTextEntry = true
    
    loginButton.setTitle("Inloggen", for: .normal)
    loginButton.setTitleColor(.black, for: .normal)
    
    registerTextLink.text = "Heeft u nog geen account? \nKlik hier om te registreren!"
    registerTextLink.textColor = .white
    registerTextLink.lineBreakMode = NSLineBreakMode.byWordWrapping
    registerTextLink.numberOfLines = 2
    
    
    let tap = UITapGestureRecognizer(target: self, action: #selector(LoginViewController.tapRegisterText))
    registerTextLink.isUserInteractionEnabled = true
    registerTextLink.addGestureRecognizer(tap)
    
    let tapOut = UITapGestureRecognizer(target: self, action: #selector(LoginViewController.hideKeyboard))
    view.isUserInteractionEnabled = true
    view.addGestureRecognizer(tapOut)
    
    setupLoginViewConstraints()
    }
    
    func setupLoginViewConstraints() {
        loginCardView.translatesAutoresizingMaskIntoConstraints = false
        loginCardView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10).isActive = true
        loginCardView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10).isActive = true
        loginCardView.heightAnchor.constraint(equalToConstant: 450).isActive = true
       // loginCardView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -20).isActive = true
        
        loginViewBottomConstraint = loginCardView.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 700)
        loginViewBottomConstraint.isActive = true
        
        loginTopTextLabel.translatesAutoresizingMaskIntoConstraints = false
        loginTopTextLabel.centerXAnchor.constraint(equalTo: loginCardView.centerXAnchor).isActive = true
        loginTopTextLabel.heightAnchor.constraint(equalToConstant: 100).isActive = true
        loginTopTextLabel.topAnchor.constraint(equalTo: loginCardView.topAnchor, constant: 5).isActive = true
        
        loginEmailTextField.translatesAutoresizingMaskIntoConstraints = false
        loginEmailTextField.leadingAnchor.constraint(equalTo: loginCardView.leadingAnchor, constant: 10).isActive = true
        loginEmailTextField.trailingAnchor.constraint(equalTo: loginCardView.trailingAnchor, constant: -10).isActive = true
        loginEmailTextField.heightAnchor.constraint(equalToConstant: 50).isActive = true
        loginEmailTextField.topAnchor.constraint(equalTo: loginTopTextLabel.bottomAnchor, constant: 25).isActive = true
        
        loginPasswordTextField.translatesAutoresizingMaskIntoConstraints = false
        loginPasswordTextField.leadingAnchor.constraint(equalTo: loginCardView.leadingAnchor, constant: 10).isActive = true
        loginPasswordTextField.trailingAnchor.constraint(equalTo: loginCardView.trailingAnchor, constant: -10).isActive = true
        loginPasswordTextField.heightAnchor.constraint(equalToConstant: 50).isActive = true
        loginPasswordTextField.topAnchor.constraint(equalTo: loginEmailTextField.bottomAnchor, constant: 25).isActive = true
        
        loginButton.translatesAutoresizingMaskIntoConstraints = false
        loginButton.leadingAnchor.constraint(equalTo: loginCardView.leadingAnchor, constant: 50).isActive = true
        loginButton.trailingAnchor.constraint(equalTo: loginCardView.trailingAnchor, constant: -50).isActive = true
        loginButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        loginButton.topAnchor.constraint(equalTo: loginPasswordTextField.bottomAnchor, constant: 50).isActive = true
        
        registerTextLink.translatesAutoresizingMaskIntoConstraints = false
        registerTextLink.centerXAnchor.constraint(equalTo: loginCardView.centerXAnchor).isActive = true
        registerTextLink.topAnchor.constraint(equalTo: loginButton.bottomAnchor, constant: 25).isActive = true
    }
}
