//
//  LoginViewControllerLayout.swift
//  SaveSense
//
//  Created by Floor de Best on 20/11/2018.
//  Copyright © 2018 dBest Innovations. All rights reserved.
//
//  Layout File for login view

import Foundation
import UIKit

extension LoginViewController {
    
    // Function to load the logo
    func loadLogo() {
        view.addSubview(logoView)
        view.backgroundColor = UIColor(red:0.26, green:0.33, blue:0.57, alpha:1.0)
        
        logoView.image = watchLogo
        
        // Load function to setup logo constraints and put it on screen
        setupLogoViewConstraints()
        
    }
    
    // Function to load the main login/registering view
    func loadChooseView() {
        view.addSubview(toLoginButton)
        view.addSubview(toRegisterButton)
        
        toLoginButton.setTitle("INLOGGEN", for: .normal)
        toLoginButton.setTitleColor(.black, for: .normal)
        
        toRegisterButton.setTitle("REGISTREREN", for: .normal)
        toRegisterButton.setTitleColor(.black, for: .normal)
        
        // Function to setup the constraints of the buttons and put them on screen
        setupLoginRegisterButtonConstraints()
    }
    
    // Function to load the satellite image
    func setupSatellite() {
        view.addSubview(satelliteView)
        satelliteView.addSubview(satelliteImageView)
        satelliteImageView.image = satelliteImage
        
        // Function to setup the image constraints and put it on screen
        setupSatelliteConstraints()
    }
    
    // Function to rotate the satellite image 
    func rotateSatelliteImage() {
        
        let angle = CGFloat.pi
        
        UIView.animate(withDuration: 5, delay: 0, options: [.beginFromCurrentState, .curveLinear], animations: { () -> Void in
            self.satelliteView.transform = self.satelliteView.transform.rotated(by: angle)
        }) { finished in
            self.rotateSatelliteImage()
        }
    }
    
    // Zooms in on logo as loading screen and starts loading data into the database for the main 'Home' screen
    // TODO: Implement Firebase to check if account is valid while loading: Yes -> Go to mainpage, No -> Go to login/registering page
    func animateLoginLogoZoomIn() {
        
        // Load data in database for main 'Home' view
        HomeViewController().createDummyData()
        
        // Start animation
        UIView.animate(withDuration: 3, delay: 0, options: [.beginFromCurrentState, .curveLinear], animations: { () -> Void in
            self.logoInCenter.isActive = true
            self.logoView.transform = CGAffineTransform(scaleX: 1.5, y: 1.5)
            self.satelliteView.transform = CGAffineTransform(scaleX: 1.5, y: 1.5)
        }) { finished in
            //if user is logged in (saved in memory), get device data and save to devicemodel class and load homeViewController. Keep this as loading screen.
            if devices.count > 0 {
                let homeView = HomeViewController()
                self.present(homeView, animated: true, completion: nil)
            }
                // When loading Home is not automated, opening HomeViewController will start on touching the screen
                //    if self.quitLoading == true {
                //        self.animateLoginLogoZoomOut()
            else {
                // Keeps zooming
                self.animateLoginLogoZoomIn()
            }
        }
    }
    
    // Function to zoom out the logo to center top screen to load 'login/registering' page if no saved account is found on the device
    func animateLoginLogoZoomOut() {
        
        UIView.animate(withDuration: 2, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 2, options: .curveEaseOut, animations: {
            self.logoInCenter.isActive = false
            self.logoViewTopAnchor.isActive = true
            self.logoView.transform = CGAffineTransform(scaleX: 1, y: 1)
            self.satelliteView.transform = CGAffineTransform(scaleX: 1, y: 1)
            self.loadChooseView()
            self.view.layoutIfNeeded()
        }, completion: { (finished: Bool) in
        })
    }
}
