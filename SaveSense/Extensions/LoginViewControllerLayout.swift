//
//  LoginViewControllerLayout.swift
//  SaveSense
//
//  Created by Floor de Best on 20/11/2018.
//  Copyright © 2018 dBest Innovations. All rights reserved.
//

import Foundation
import UIKit

extension LoginViewController {
    
    func loadLogo() {
        view.addSubview(logoView)
        view.backgroundColor = UIColor(red:0.26, green:0.33, blue:0.57, alpha:1.0)
        
        logoView.image = watchLogo
        
        setupLogoViewConstraints()

    }
    
    func loadChooseView() {
        view.addSubview(toLoginButton)
        view.addSubview(toRegisterButton)
        
        toLoginButton.setTitle("INLOGGEN", for: .normal)
        toLoginButton.setTitleColor(.black, for: .normal)
        
        toRegisterButton.setTitle("REGISTREREN", for: .normal)
        toRegisterButton.setTitleColor(.black, for: .normal)
        
        setupLoginRegisterButtonConstraints()
    }
    
    func setupSatellite() {
        view.addSubview(satelliteView)
        satelliteView.addSubview(satelliteImageView)
        satelliteImageView.image = satelliteImage
        
        setupSatelliteConstraints()
    }
    
    func rotateSatelliteImage() {
        
        let angle = CGFloat.pi
        
        UIView.animate(withDuration: 5, delay: 0, options: [.beginFromCurrentState, .curveLinear], animations: { () -> Void in
            self.satelliteView.transform = self.satelliteView.transform.rotated(by: angle)
        }) { finished in
            self.rotateSatelliteImage()
        }
    }
}
