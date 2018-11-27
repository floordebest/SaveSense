//
//  DeviceDetailViewController.swift
//  SaveSense
//
//  Created by Floor de Best on 23/11/2018.
//  Copyright © 2018 dBest Innovations. All rights reserved.
//

import UIKit
import MapKit

class DeviceDetailViewController: UIViewController {
    
    let logoView                    =   UIImageView()
    let logo: UIImage               =   #imageLiteral(resourceName: "watchIconWhiteBackground.png")
    
    let satelliteLogoView           =   UIImageView()
    let satelliteView               =   UIView()
    let satellite: UIImage          =   #imageLiteral(resourceName: "satelliteIcon.png")
    
    let deviceDetailView            =   UIView()
    
    let deviceNameLabel             =   UILabel()
    let deviceNameChangeButton      =   UIButton()
    
    let returnScreenButton          =   UIButton()
    
    let batteryPercentageLabel      =   UILabel()
    let batteryImageView            =   UIImageView()
    
    let mapView                     =   MKMapView()
    let requestDeviceGPSButton      =   UIButton()
    
    let turnDeviceOffButton         =   UIButton()
    
    let messageSendTextField        =   UITextField()
    let messageSendButton           =   customButton()
    
    let wristSensorOnOffButton      =   UIButton()
    
    let findDeviceButton            =   UIButton()
    
    let callToDeviceButton          =   UIButton()
    
    var batteryImage                =   UIImage()
    
    var deviceSerial                =   String()
    var batteryPercentage           =   Int()
    var deviceName                  =   String()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Load data function
        loadDeviceData()
        
        // Listen for press on cancell button to return to main view
        returnScreenButton.addTarget(self, action: #selector(cancellButtonPressed), for: .touchUpInside)
        
        deviceNameChangeButton.addTarget(self, action: #selector(changeNameButtonPressed), for: .touchUpInside)
    }
    
    func loadDeviceData() {
        
        // Get device Index nr from memory
        guard let deviceIndex = UserDefaults.standard.object(forKey: "indexPath") as? Int else {return}
        
        // get device data from indexnr
        let currentDevice = devices[deviceIndex]
        
        // Load GPS data for map view
        let initialLocation = CLLocation(latitude: currentDevice.latGPS, longitude: currentDevice.longGPS)
        let regionRadius: CLLocationDistance = 500
        let annotation = MKPointAnnotation()
        
        func centerMapOnLocation(location: CLLocation) {
            let coordinateRegion = MKCoordinateRegion(center: location.coordinate,
                                                      latitudinalMeters: regionRadius, longitudinalMeters: regionRadius)
            annotation.coordinate = CLLocationCoordinate2D(latitude: currentDevice.latGPS, longitude: currentDevice.longGPS)
            annotation.title = "Laatste positie van \(currentDevice.deviceName)"
            mapView.setRegion(coordinateRegion, animated: true)
            mapView.showsUserLocation = true
            mapView.addAnnotation(annotation)
        }
        
        centerMapOnLocation(location: initialLocation)
        
        // Load battery percentage data
        batteryPercentage = Int(currentDevice.batteryPercentage)!
        deviceName = currentDevice.deviceName
        
        // Set device Name
        deviceNameLabel.text = deviceName
        batteryPercentageLabel.text = "\(batteryPercentage)%"
        deviceSerial = currentDevice.deviceSerial
        
        // Load View Layout from extension
        loadDeviceDetailView()
    }
    
    @objc func cancellButtonPressed() {
        // Remove device data (indexnr) from memory
        UserDefaults.standard.removeObject(forKey: "indexPath")
        
        // Go back to Main View
        
        presentingViewController?.dismiss(animated: true, completion: nil)
        
        //let homeView = HomeViewController()
        //self.present(homeView, animated: true, completion: nil)
    }
    
    @objc func changeNameButtonPressed() {
        
        guard let deviceIndex = UserDefaults.standard.object(forKey: "indexPath") as? Int else {return}
        
        AlertWithEdit(title: "Verander Naam", buttonTitleDone: "Opslaan", buttonTitleCancell: "Annuleren", textFieldText: deviceName, currentDeviceName: deviceName, deviceIndexPosition: deviceIndex)?.setupAlert(on: self)
    }

}
