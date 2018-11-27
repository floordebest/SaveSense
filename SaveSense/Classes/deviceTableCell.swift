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
    
    //var ref: DatabaseReference?
    
    func setDevice(device: Device) {
        
        let initialLocation = CLLocation(latitude: device.latGPS, longitude: device.longGPS)
        let regionRadius: CLLocationDistance = 50000
        let annotation = MKPointAnnotation()
        
        func centerMapOnLocation(location: CLLocation) {
            let coordinateRegion = MKCoordinateRegion(center: location.coordinate,
                                                      latitudinalMeters: regionRadius, longitudinalMeters: regionRadius)
            annotation.coordinate = CLLocationCoordinate2D(latitude: device.latGPS, longitude: device.longGPS)
            annotation.title = "Laatste positie van \(device.deviceName)"
            mapView.setRegion(coordinateRegion, animated: true)
            mapView.showsUserLocation = true
            mapView.addAnnotation(annotation)
        }
        
        centerMapOnLocation(location: initialLocation)
        
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
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.contentView.backgroundColor = borderColor
        self.layer.borderWidth = 5
        self.layer.borderColor = borderColor.cgColor
        self.layer.masksToBounds = false
        
        addSubview(cellCardView)
        cellCardView.addSubview(mapView)
        cellCardView.addSubview(deviceNameLabel)
        cellCardView.addSubview(batteryPercentageLabel)
        cellCardView.addSubview(batteryImageView)

        batteryImageView.image = batteryImage
        
        cellCardView.backgroundColor = .white
        cellCardView.layer.cornerRadius = 12

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
        
        createCellConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func createCellConstraints() {
        
        self.heightAnchor.constraint(equalToConstant: 250).isActive = true
        
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
