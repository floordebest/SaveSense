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
        
        setupSatellite()
        registerTouch()
        animateLoginLogoZoomIn()

        
    }
    
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
        
        rotateSatelliteImage()
    }
    
    func registerTouch() {
        let tapper = UITapGestureRecognizer(target: self, action: #selector(LoginViewController.tappert))
        logoView.isUserInteractionEnabled = true
        view.addGestureRecognizer(tapper)
    }
    
    func animateLoginLogoZoomIn() {
        HomeViewController().createDummyData()
        
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
           //if user is not logged in (not saved on device), zoom out to login screen
        //    if self.quitLoading == true {
        //        self.animateLoginLogoZoomOut()
            else {
            self.animateLoginLogoZoomIn()
            }
        }
    }
    
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
