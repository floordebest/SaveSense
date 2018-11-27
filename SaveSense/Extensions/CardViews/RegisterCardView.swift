//
//  RegisterCardView.swift
//  SaveSense
//
//  Created by Floor de Best on 21/11/2018.
//  Copyright © 2018 dBest Innovations. All rights reserved.
//

import Foundation
import UIKit

extension LoginViewController {
    
    func setupRegisterView() {
        view.addSubview(registerCardView)
        view.addSubview(registerTopTextLabel)
        view.addSubview(registerEmailTextField)
        view.addSubview(registerPasswordTextField)
        view.addSubview(registerButton)
        view.addSubview(loginTextLink)
        
        registerCardView.backgroundColor = UIColor.gray.withAlphaComponent(0.75)
        registerCardView.layer.cornerRadius = 22
        
        toLoginButton.isHidden = true
        toRegisterButton.isHidden = true
        
        registerTopTextLabel.text = "REGISTREREN"
        registerTopTextLabel.font = UIFont.boldSystemFont(ofSize: 24)
        registerTopTextLabel.textColor = .white
        
        registerEmailTextField.backgroundColor = .white
        registerEmailTextField.layer.cornerRadius = 20
        registerEmailTextField.textColor = .black
        registerEmailTextField.placeholder = "   Emailadres...."
        
        registerPasswordTextField.backgroundColor = .white
        registerPasswordTextField.layer.cornerRadius = 20
        registerPasswordTextField.textColor = .black
        registerPasswordTextField.placeholder = "   Wachtwoord...."
        registerPasswordTextField.isSecureTextEntry = true
        
        registerButton.setTitle("Registreren", for: .normal)
        registerButton.setTitleColor(.black, for: .normal)
        
        loginTextLink.text = "Heeft u al een account? \nKlik hier om in te loggen."
        loginTextLink.textColor = .white
        loginTextLink.lineBreakMode = NSLineBreakMode.byWordWrapping
        loginTextLink.numberOfLines = 2
        
        setupRegisterViewConstraints()
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(LoginViewController.tapLoginText))
        loginTextLink.isUserInteractionEnabled = true
        loginTextLink.addGestureRecognizer(tap)
        
    }
    
    func setupRegisterViewConstraints() {
        registerCardView.translatesAutoresizingMaskIntoConstraints = false
        
        registerCardView.heightAnchor.constraint(equalToConstant: 450).isActive = true
        registerCardView.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -20).isActive = true
        registerCardView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -20).isActive = true
        
        registerViewCenterConstraint = registerCardView.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 700)
        registerViewCenterConstraint.isActive = true
        
        registerTopTextLabel.translatesAutoresizingMaskIntoConstraints = false
        registerTopTextLabel.centerXAnchor.constraint(equalTo: registerCardView.centerXAnchor).isActive = true
        registerTopTextLabel.heightAnchor.constraint(equalToConstant: 100).isActive = true
        registerTopTextLabel.topAnchor.constraint(equalTo: registerCardView.topAnchor, constant: 5).isActive = true
        
        registerEmailTextField.translatesAutoresizingMaskIntoConstraints = false
        registerEmailTextField.leadingAnchor.constraint(equalTo: registerCardView.leadingAnchor, constant: 10).isActive = true
        registerEmailTextField.trailingAnchor.constraint(equalTo: registerCardView.trailingAnchor, constant: -10).isActive = true
        registerEmailTextField.heightAnchor.constraint(equalToConstant: 50).isActive = true
        registerEmailTextField.topAnchor.constraint(equalTo: registerTopTextLabel.bottomAnchor, constant: 25).isActive = true
        
        registerPasswordTextField.translatesAutoresizingMaskIntoConstraints = false
        registerPasswordTextField.leadingAnchor.constraint(equalTo: registerCardView.leadingAnchor, constant: 10).isActive = true
        registerPasswordTextField.trailingAnchor.constraint(equalTo: registerCardView.trailingAnchor, constant: -10).isActive = true
        registerPasswordTextField.heightAnchor.constraint(equalToConstant: 50).isActive = true
        registerPasswordTextField.topAnchor.constraint(equalTo: registerEmailTextField.bottomAnchor, constant: 25).isActive = true
        
        registerButton.translatesAutoresizingMaskIntoConstraints = false
        registerButton.leadingAnchor.constraint(equalTo: registerCardView.leadingAnchor, constant: 50).isActive = true
        registerButton.trailingAnchor.constraint(equalTo: registerCardView.trailingAnchor, constant: -50).isActive = true
        registerButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        registerButton.topAnchor.constraint(equalTo: registerPasswordTextField.bottomAnchor, constant: 50).isActive = true
        
        loginTextLink.translatesAutoresizingMaskIntoConstraints = false
        loginTextLink.centerXAnchor.constraint(equalTo: registerCardView.centerXAnchor).isActive = true
        loginTextLink.topAnchor.constraint(equalTo: registerButton.bottomAnchor, constant: 25).isActive = true
    }
}
