//
//  HomeViewController.swift
//  SaveSense
//
//  Created by Floor de Best on 21/11/2018.
//  Copyright © 2018 dBest Innovations. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
    let tableView = UITableView()
    let logOutButton    =       UIButton()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(tableView)
        view.backgroundColor = UIColor(red:0.26, green:0.33, blue:0.57, alpha:1.0)
        
        setupTableViewConstraints()
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(DeviceCellClass.self, forCellReuseIdentifier: "DeviceCell")
        self.tableView.separatorStyle = .none
        self.tableView.backgroundColor = UIColor(red:0.26, green:0.33, blue:0.57, alpha:1.0)
        
        tableView.tableFooterView = UIView()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        tableView.reloadData()
    }
    
    func setupTableViewConstraints() {
        
        tableView.layer.cornerRadius = 20
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        let tableViewHeight = tableView.heightAnchor.constraint(equalToConstant: 500)
        tableViewHeight.isActive = true
        
        tableView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        tableView.topAnchor.constraint(equalTo: view.topAnchor, constant: 10).isActive = true
        tableView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.9).isActive = true
        
        if devices.count <= 1 {
            tableViewHeight.constant = 250
        } else {
            tableViewHeight.constant = 600
        }
    }
    
    func createDummyData() {
        let deviceInfo = Device(deviceSerial: "123456789", deviceName: "DummyWatch", longGPS: 52.18999, latGPS: 4.41634, batteryPercentage: "75", phoneNumber: "0642666784")
        let deviceInfo2 = Device(deviceSerial: "0987654321", deviceName: "DummerWatch", longGPS: 52.58999, latGPS: 4.61634, batteryPercentage: "45", phoneNumber: "0612345678")
        let deviceInfo3 = Device(deviceSerial: "0987654321", deviceName: "DummerWatch", longGPS: 52.58999, latGPS: 4.61634, batteryPercentage: "45", phoneNumber: "0612345678")
        
        devices.append(deviceInfo!)
        devices.append(deviceInfo2!)
        devices.append(deviceInfo3!)
        
        
    }

}
