//
//  HomeViewController.swift
//  SaveSense
//
//  Created by Floor de Best on 21/11/2018.
//  Copyright © 2018 dBest Innovations. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
    let tableView       =       UITableView()
    let logOutButton    =       UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // Add tableview to the mainview and set the background color
        view.addSubview(tableView)
        view.backgroundColor = UIColor(red:0.26, green:0.33, blue:0.57, alpha:1.0)
        
        // Load the tableview
        setupTableViewConstraints()
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(DeviceCellClass.self, forCellReuseIdentifier: "DeviceCell")
        self.tableView.separatorStyle = .none
        self.tableView.backgroundColor = .clear
        
        tableView.tableFooterView = UIView()
    }
    
    // Do stuff when the screen is loaded and shown to the user
    override func viewDidAppear(_ animated: Bool) {
        // Reload database data to update screen if there are changes
        tableView.reloadData()
    }
    
    // Create Dummy Data for filling up the view and testing purposes
    func createDummyData() {
    
            let deviceInfo = Device(deviceSerial: "123456789", deviceName: "DummyWatch", longGPS: 52.18999, latGPS: 4.41634, batteryPercentage: "75", phoneNumber: "0642666784")
            let deviceInfo2 = Device(deviceSerial: "0987654321", deviceName: "DummerWatch", longGPS: 52.58999, latGPS: 4.61634, batteryPercentage: "45", phoneNumber: "0612345678")
            let deviceInfo3 = Device(deviceSerial: "0987654321", deviceName: "DummerWatch", longGPS: 52.58999, latGPS: 4.61634, batteryPercentage: "45", phoneNumber: "0612345678")
            
            devices.append(deviceInfo!)
            devices.append(deviceInfo2!)
            devices.append(deviceInfo3!)
 
    }

}
