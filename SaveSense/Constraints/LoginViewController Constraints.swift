//
//  LoginViewController Constraints.swift
//  SaveSense
//
//  Created by Floor de Best on 20/11/2018.
//  Copyright © 2018 dBest Innovations. All rights reserved.
//

import Foundation
import UIKit

extension LoginViewController {
    
    // Load Logo
    func setupLogoViewConstraints() {
        logoView.translatesAutoresizingMaskIntoConstraints = false
        
        logoView.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: -10).isActive = true
        
        logoViewHeight = logoView.heightAnchor.constraint(equalToConstant: 250)
        logoViewHeight.isActive = true
        
        logoViewWidth = logoView.widthAnchor.constraint(equalToConstant: 250)
        logoViewWidth.isActive = true
       
        logoViewTopAnchor = logoView.topAnchor.constraint(equalTo: view.topAnchor, constant: 100)
        logoViewTopAnchor.isActive = false
        
        logoInCenter = logoView.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        logoInCenter.isActive = true
        
        // Call to load satellite
        setupSatellite()
        
        // Call Function to register Touches
        // NOT USED RIGHT NOW, ONLY DEMO USE
        registerTouch()
        
        // Call Animate function to zoom in on logo as loading screen
        animateLoginLogoZoomIn()
        
    }
    
    // Setup first screen where client can choose to go to login or register for a new account
    func setupLoginRegisterButtonConstraints() {
        toLoginButton.translatesAutoresizingMaskIntoConstraints = false
        toRegisterButton.translatesAutoresizingMaskIntoConstraints = false
        
        toLoginButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        toLoginButton.topAnchor.constraint(equalTo: logoView.bottomAnchor, constant: 125).isActive = true
        toLoginButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        toLoginButton.widthAnchor.constraint(equalToConstant: 200).isActive = true
        
        toRegisterButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        toRegisterButton.topAnchor.constraint(equalTo: toLoginButton.bottomAnchor, constant: 50).isActive = true
        toRegisterButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        toRegisterButton.widthAnchor.constraint(equalToConstant: 200).isActive = true
        
    }
    
    // Setup satellite image which rotates around the main logo
    func setupSatelliteConstraints() {
        satelliteView.translatesAutoresizingMaskIntoConstraints = false
        satelliteImageView.translatesAutoresizingMaskIntoConstraints = false
        
        satelliteView.centerXAnchor.constraint(equalTo: logoView.centerXAnchor, constant: 8).isActive = true
        satelliteView.centerYAnchor.constraint(equalTo: logoView.centerYAnchor).isActive = true
        satelliteView.widthAnchor.constraint(equalTo: logoView.widthAnchor).isActive = true
        satelliteView.heightAnchor.constraint(equalTo: logoView.heightAnchor).isActive = true
        
        satelliteImageView.heightAnchor.constraint(equalTo: logoView.heightAnchor, multiplier: 0.3).isActive = true
        satelliteImageView.widthAnchor.constraint(equalTo: logoView.widthAnchor, multiplier: 0.3).isActive = true
        satelliteImageView.centerYAnchor.constraint(equalTo: satelliteView.centerYAnchor, constant: 115).isActive = true
        satelliteImageView.centerXAnchor.constraint(equalTo: satelliteView.centerXAnchor, constant: 115).isActive = true
        
        self.satelliteImageView.transform = CGAffineTransform(rotationAngle: 1.5)
        
        // Load animation function to rotate satellite around the logo
        rotateSatelliteImage()
    }
    
}
