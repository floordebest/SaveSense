//
//  DeviceDetailViewControllerConstraints.swift
//  SaveSense
//
//  Created by Floor de Best on 23/11/2018.
//  Copyright © 2018 dBest Innovations. All rights reserved.
//

import Foundation
import UIKit

extension DeviceDetailViewController {
    
    // View constraints setup
    func deviceDetailViewConstraints() {
        
        deviceDetailView.translatesAutoresizingMaskIntoConstraints = false
        
        deviceDetailView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.75).isActive = true
        deviceDetailView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.9).isActive = true
        deviceDetailView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10).isActive = true
        deviceDetailView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        deviceNameLabel.translatesAutoresizingMaskIntoConstraints = false
        
        deviceNameLabel.widthAnchor.constraint(equalTo: deviceDetailView.widthAnchor, multiplier: 0.75).isActive = true
        deviceNameLabel.heightAnchor.constraint(equalToConstant: 55).isActive = true
        deviceNameLabel.topAnchor.constraint(equalTo: deviceDetailView.topAnchor, constant: 5).isActive = true
        deviceNameLabel.centerXAnchor.constraint(equalTo: deviceDetailView.centerXAnchor).isActive = true
        
        deviceNameChangeButton.translatesAutoresizingMaskIntoConstraints = false
        
        deviceNameChangeButton.widthAnchor.constraint(equalToConstant: 25).isActive = true
        deviceNameChangeButton.heightAnchor.constraint(equalToConstant: 25).isActive = true
        deviceNameChangeButton.centerYAnchor.constraint(equalTo: deviceNameLabel.centerYAnchor).isActive = true
        deviceNameChangeButton.trailingAnchor.constraint(equalTo: deviceDetailView.trailingAnchor, constant: -5).isActive = true
        
        returnScreenButton.translatesAutoresizingMaskIntoConstraints = false
        
        returnScreenButton.widthAnchor.constraint(equalToConstant: 40).isActive = true
        returnScreenButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
        returnScreenButton.centerYAnchor.constraint(equalTo: deviceNameLabel.centerYAnchor).isActive = true
        returnScreenButton.leadingAnchor.constraint(equalTo: deviceDetailView.leadingAnchor, constant: 5).isActive = true
        
        mapView.translatesAutoresizingMaskIntoConstraints = false
        
        mapView.leadingAnchor.constraint(equalTo: deviceDetailView.leadingAnchor, constant: 5).isActive = true
        mapView.trailingAnchor.constraint(equalTo: deviceDetailView.trailingAnchor, constant: -5).isActive = true
        mapView.heightAnchor.constraint(equalTo: deviceDetailView.heightAnchor, multiplier: 0.35).isActive = true
        mapView.topAnchor.constraint(equalTo: deviceNameLabel.bottomAnchor, constant: 10).isActive = true
        
        messageSendTextField.translatesAutoresizingMaskIntoConstraints = false
        
        messageSendTextField.leadingAnchor.constraint(equalTo: deviceDetailView.leadingAnchor, constant: 5).isActive = true
        messageSendTextField.trailingAnchor.constraint(equalTo: deviceDetailView.trailingAnchor, constant: -105).isActive = true
        messageSendTextField.topAnchor.constraint(equalTo: mapView.bottomAnchor, constant: 10).isActive = true
        messageSendTextField.heightAnchor.constraint(equalToConstant: 35).isActive = true
        
        messageSendButton.translatesAutoresizingMaskIntoConstraints = false
        messageSendButton.leadingAnchor.constraint(equalTo: messageSendTextField.trailingAnchor, constant: 5).isActive = true
        messageSendButton.trailingAnchor.constraint(equalTo: deviceDetailView.trailingAnchor, constant: -5).isActive = true
        messageSendButton.topAnchor.constraint(equalTo: mapView.bottomAnchor, constant: 10).isActive = true
        messageSendButton.heightAnchor.constraint(equalToConstant: 35).isActive = true
        
    }
    
    // Logo constraints setup
    func setupLogoViewConstraints() {
        logoView.translatesAutoresizingMaskIntoConstraints = false
        
        logoView.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: -3).isActive = true
        logoView.heightAnchor.constraint(equalToConstant: 50).isActive = true
        logoView.widthAnchor.constraint(equalToConstant: 50).isActive = true
        logoView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -25).isActive = true
        
        setupSatelliteConstraints()
    }
    
    // Satellite image around logo constraints setup
    func setupSatelliteConstraints() {
        satelliteView.translatesAutoresizingMaskIntoConstraints = false
        satelliteLogoView.translatesAutoresizingMaskIntoConstraints = false
        
        satelliteView.centerXAnchor.constraint(equalTo: logoView.centerXAnchor, constant: 1).isActive = true
        satelliteView.centerYAnchor.constraint(equalTo: logoView.centerYAnchor).isActive = true
        satelliteView.widthAnchor.constraint(equalTo: logoView.widthAnchor).isActive = true
        satelliteView.heightAnchor.constraint(equalTo: logoView.heightAnchor).isActive = true
        
        satelliteLogoView.heightAnchor.constraint(equalTo: logoView.heightAnchor, multiplier: 0.3).isActive = true
        satelliteLogoView.widthAnchor.constraint(equalTo: logoView.widthAnchor, multiplier: 0.3).isActive = true
        satelliteLogoView.centerYAnchor.constraint(equalTo: satelliteView.centerYAnchor, constant: 27).isActive = true
        satelliteLogoView.centerXAnchor.constraint(equalTo: satelliteView.centerXAnchor, constant: 27).isActive = true
        
        self.satelliteLogoView.transform = CGAffineTransform(rotationAngle: 1.5)
        
        rotateSatelliteImage()
    }
    
}
