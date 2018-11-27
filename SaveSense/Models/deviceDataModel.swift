//
//  deviceDataModel.swift
//  SaveSense
//
//  Created by Floor de Best on 22/11/2018.
//  Copyright © 2018 dBest Innovations. All rights reserved.
//

import Foundation

var devices: [Device] = []

class Device {
    
    var deviceSerial: String
    var deviceName: String
    var longGPS: Double
    var latGPS: Double
    var batteryPercentage: String
    var phoneNumber : String
    
    
    init?(deviceSerial: String, deviceName: String, longGPS: Double, latGPS: Double, batteryPercentage: String, phoneNumber: String) {
        
        self.deviceSerial = deviceSerial
        self.deviceName = deviceName
        self.longGPS = longGPS
        self.latGPS = latGPS
        self.batteryPercentage = batteryPercentage
        self.phoneNumber = phoneNumber
        
    }
    
}
