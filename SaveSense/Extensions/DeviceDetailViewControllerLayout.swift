//
//  DeviceDetailViewControllerLayout.swift
//  SaveSense
//
//  Created by Floor de Best on 23/11/2018.
//  Copyright © 2018 dBest Innovations. All rights reserved.
//

import Foundation
import UIKit
import MapKit

extension DeviceDetailViewController {
      
    
    func loadDeviceData() {
        
        // Check if 'data' is filled to load all variables else return
        guard let indexnr = data else { return }
        
        deviceName = devices[data!].deviceName
        deviceSerial = devices[data!].deviceSerial
        deviceLongGPS = devices[data!].longGPS
        deviceLatGPS = devices[data!].latGPS
        batteryPercentage = Int(devices[data!].batteryPercentage)!
        devicePhoneNumber = Int(devices[data!].phoneNumber)!
        
        
        // Load GPS data for map view
        let initialLocation = CLLocation(latitude: deviceLatGPS, longitude: deviceLongGPS)
        let regionRadius: CLLocationDistance = 500
        let annotation = MKPointAnnotation()
        
        func centerMapOnLocation(location: CLLocation) {
            let coordinateRegion = MKCoordinateRegion(center: location.coordinate,
                                                      latitudinalMeters: regionRadius, longitudinalMeters: regionRadius)
            annotation.coordinate = CLLocationCoordinate2D(latitude: deviceLatGPS, longitude: deviceLongGPS)
            annotation.title = "Laatste positie van \(deviceName)"
            mapView.setRegion(coordinateRegion, animated: true)
            mapView.showsUserLocation = true
            mapView.addAnnotation(annotation)
        }
        
        centerMapOnLocation(location: initialLocation)
        
        // Set device Name
        deviceNameLabel.text = deviceName
        batteryPercentageLabel.text = "\(batteryPercentage)%"
        
        // Load View to put it on screen
        loadDeviceDetailView()
    }
    
    // Function to load all the device data, buttons and stuff on screen
    func loadDeviceDetailView() {
        view.addSubview(deviceDetailView)
        view.addSubview(logoView)
        view.addSubview(satelliteView)
        satelliteView.addSubview(satelliteLogoView)
        
        view.backgroundColor =  UIColor(red:0.26, green:0.33, blue:0.57, alpha:1.0)
        
        deviceDetailView.addSubview(mapView)
        deviceDetailView.addSubview(deviceNameLabel)
        deviceDetailView.addSubview(batteryPercentageLabel)
        deviceDetailView.addSubview(batteryImageView)
        deviceDetailView.addSubview(requestDeviceGPSButton)
        deviceDetailView.addSubview(turnDeviceOffButton)
        deviceDetailView.addSubview(messageSendTextField)
        deviceDetailView.addSubview(messageSendButton)
        deviceDetailView.addSubview(wristSensorOnOffButton)
        deviceDetailView.addSubview(findDeviceButton)
        deviceDetailView.addSubview(callToDeviceButton)
        deviceDetailView.addSubview(deviceNameChangeButton)
        deviceDetailView.addSubview(returnScreenButton)
        
        deviceNameLabel.font = UIFont.boldSystemFont(ofSize: 24)
        deviceNameLabel.textAlignment = .center
        
        mapView.layer.cornerRadius = 20
        
        messageSendTextField.backgroundColor = .white
        messageSendTextField.font = messageSendTextField.font?.withSize(16)
        messageSendTextField.placeholder = "Stuur een bericht naar \(deviceName)..."
        messageSendTextField.textColor = .black
        messageSendTextField.layer.cornerRadius = 12
        
        messageSendButton.setTitle("VERSTUUR", for: .normal)
        messageSendButton.setTitleColor(.black, for: .normal)
        messageSendButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        messageSendButton.backgroundColor = .gray
        messageSendButton.layer.cornerRadius = 12
        
        if batteryPercentage >= 75 {
            batteryImage = #imageLiteral(resourceName: "battery_full.png")
        } else if batteryPercentage >= 50 {
            batteryImage = #imageLiteral(resourceName: "battery_threequarter.png")
        } else if batteryPercentage >= 25 {
            batteryImage = #imageLiteral(resourceName: "battery_half.png")
        } else {
            batteryImage = #imageLiteral(resourceName: "battery_empty.png")
        }
        
        batteryImageView.image = batteryImage
        
        deviceNameChangeButton.setBackgroundImage(#imageLiteral(resourceName: "Edit_icon.png"), for: .normal)
        
        returnScreenButton.setBackgroundImage(#imageLiteral(resourceName: "close-150192_960_720.png"), for: .normal)
        
        deviceDetailView.backgroundColor = UIColor.white.withAlphaComponent(0.50)
        deviceDetailView.layer.cornerRadius = 20
        
        // Load View Constraints
        deviceDetailViewConstraints()
        
        logoView.image = logo
        satelliteLogoView.image = satellite
        
        // Load Logo View Constraints
        setupLogoViewConstraints()
        
    }
    
    // Function for rotating satellite image around logo
    func rotateSatelliteImage() {
        
        let angle = CGFloat.pi
        
        UIView.animate(withDuration: 2.5, delay: 0, options: [.beginFromCurrentState, .curveLinear], animations: { () -> Void in
            self.satelliteView.transform = self.satelliteView.transform.rotated(by: angle)
        }) { finished in
            self.rotateSatelliteImage()
        }
    }
    
}
