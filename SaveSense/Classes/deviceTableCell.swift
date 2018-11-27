//
//  deviceTableCell.swift
//  SaveSense
//
//  Created by Floor de Best on 22/11/2018.
//  Copyright © 2018 dBest Innovations. All rights reserved.
//

import Foundation
import UIKit
import MapKit


class DeviceCellClass: UITableViewCell {
    
    var cellCardView            =       UIView()
    var mapView                 =       MKMapView()
    var deviceNameLabel         =       UILabel()
    var batteryPercentageLabel  =       UILabel()
    var battPercent             =       Int()
    
    let batteryImageView        =       UIImageView()
    var batteryImage            =       UIImage()
    let borderColor: UIColor    =       UIColor(red:0.26, green:0.33, blue:0.57, alpha:1.0)
    
    
    var deviceSerial = String()
    
    // Function to load device data and register it as a device
    func setDevice(device: Device) {
        
        // Load GPS / Map data
        
        // Sets location of the mapview
        let initialLocation = CLLocation(latitude: device.latGPS, longitude: device.longGPS)
        
        // Sets radius around the center of the mapview in meters (zoomlevel of the mapview)
        let regionRadius: CLLocationDistance = 50000
        
        // Sets an annotation on the locations (pin) to show where it is
        let annotation = MKPointAnnotation()
        
        // Function to center the view on the gives GPS data
        func centerMapOnLocation(location: CLLocation) {
            let coordinateRegion = MKCoordinateRegion(center: location.coordinate,
                                                      latitudinalMeters: regionRadius, longitudinalMeters: regionRadius)
            annotation.coordinate = CLLocationCoordinate2D(latitude: device.latGPS, longitude: device.longGPS)
            annotation.title = "Laatste positie van \(device.deviceName)"
            mapView.setRegion(coordinateRegion, animated: true)
            mapView.showsUserLocation = true
            mapView.addAnnotation(annotation)
        }
        
        // Call the function to center the view on the given GPS Data
        centerMapOnLocation(location: initialLocation)
        
        // Sets the deviceNameLabel, Batterylabel and device serial number
        deviceNameLabel.text = device.deviceName
        battPercent = Int(device.batteryPercentage)!
        let battsign = "%"
        if battPercent >= 75 {
            batteryImage = #imageLiteral(resourceName: "battery_full.png")
        } else if battPercent >= 50 {
            batteryImage = #imageLiteral(resourceName: "battery_threequarter.png")
        } else if battPercent >= 25 {
            batteryImage = #imageLiteral(resourceName: "battery_half.png")
        } else {
            batteryImage = #imageLiteral(resourceName: "battery_empty.png")
        }
        batteryPercentageLabel.text = String(battPercent) + battsign
        deviceSerial = device.deviceSerial
    }
    
    // Load the view constraints to put the data on screen
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        // TODO: There is a small white line around the cardview in the corners, find out what it is and how to delete it
        self.backgroundColor = .clear
        
        // Loads all the data as a 'cardview' in the cell
        addSubview(cellCardView)
        
        // Load all data in the cellCardView
        cellCardView.addSubview(mapView)
        cellCardView.addSubview(deviceNameLabel)
        cellCardView.addSubview(batteryPercentageLabel)
        cellCardView.addSubview(batteryImageView)

        batteryImageView.image = batteryImage
        
        cellCardView.backgroundColor = .white
        cellCardView.layer.cornerRadius = 12
        cellCardView.layer.borderWidth = 5
        cellCardView.layer.borderColor = borderColor.cgColor
        cellCardView.layer.masksToBounds = false

        mapView.layer.cornerRadius = 20
        
        deviceNameLabel.font = UIFont.boldSystemFont(ofSize: 24)
        deviceNameLabel.textColor = .black
        deviceNameLabel.textAlignment = .center
        
        batteryPercentageLabel.font = batteryPercentageLabel.font.withSize(18)
        if battPercent >= 25 {
            batteryPercentageLabel.textColor = .black
        } else {
            batteryPercentageLabel.textColor = .red
        }
        
        // Function to create constraints of the cell and put in position on screen
        createCellConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func createCellConstraints() {
        
        // Sets the top position of the total tableview
        self.heightAnchor.constraint(equalToConstant: 250).isActive = true
        
        // Sets the position of the cardview
        cellCardView.translatesAutoresizingMaskIntoConstraints = false
        cellCardView.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        cellCardView.topAnchor.constraint(equalTo: self.topAnchor, constant: 10).isActive = true
        cellCardView.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 1).isActive = true
        cellCardView.heightAnchor.constraint(equalToConstant: 250).isActive = true
        
        deviceNameLabel.translatesAutoresizingMaskIntoConstraints = false
        deviceNameLabel.centerXAnchor.constraint(equalTo: cellCardView.centerXAnchor).isActive = true
        deviceNameLabel.topAnchor.constraint(equalTo: cellCardView.topAnchor, constant: 5).isActive = true
        deviceNameLabel.widthAnchor.constraint(equalTo: cellCardView.widthAnchor, multiplier: 0.9).isActive = true
        deviceNameLabel.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        mapView.translatesAutoresizingMaskIntoConstraints = false
        mapView.leadingAnchor.constraint(equalTo: cellCardView.leadingAnchor, constant: 5).isActive = true
        mapView.heightAnchor.constraint(equalTo: cellCardView.heightAnchor, multiplier: 0.7).isActive = true
        mapView.widthAnchor.constraint(equalTo: cellCardView.widthAnchor, multiplier: 0.45).isActive = true
        mapView.topAnchor.constraint(equalTo: deviceNameLabel.bottomAnchor, constant: 5).isActive = true
        
    }
    
}
