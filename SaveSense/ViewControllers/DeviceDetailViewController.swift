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
        
        // Load device data to populate the view for the selected device
        loadDeviceData()
        
        // Listen for press on cancell button to return to main view
        returnScreenButton.addTarget(self, action: #selector(cancellButtonPressed), for: .touchUpInside)
        
        // Listen for press on 'edit' button to change the nameLabel of the device (opens a pop up alert)
        deviceNameChangeButton.addTarget(self, action: #selector(changeNameButtonPressed), for: .touchUpInside)
    }
    
    // Function to handle button press on the cancell button
    @objc func cancellButtonPressed() {
        
        // Remove device data (indexnr) from memory
        UserDefaults.standard.removeObject(forKey: "indexPath")
        
        // Go back to Main View
        presentingViewController?.dismiss(animated: true, completion: nil)
        
    }
    
    // Function to handle button press on the 'edit' button
    @objc func changeNameButtonPressed() {
        
        // Get device Index nr to give data to pop up to change
        guard let deviceIndex = UserDefaults.standard.object(forKey: "indexPath") as? Int else {return}
        
        AlertWithEdit(title: "Verander Naam", buttonTitleDone: "Opslaan", buttonTitleCancell: "Annuleren", textFieldText: deviceName, currentDeviceName: deviceName, deviceIndexPosition: deviceIndex)?.setupAlert(on: self)
    }

}
