//
//  HomeViewControllerLayout.swift
//  SaveSense
//
//  Created by Floor de Best on 22/11/2018.
//  Copyright © 2018 dBest Innovations. All rights reserved.
//

import Foundation
import UIKit

extension HomeViewController: UITableViewDataSource, UITableViewDelegate {

    // Load tableview
    func setupTableViewConstraints() {
        // Load Autolayout
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        // Sets the height of the total table view
        let tableViewHeight = tableView.heightAnchor.constraint(equalToConstant: 500)
        tableViewHeight.isActive = true
        
        tableView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        tableView.topAnchor.constraint(equalTo: view.topAnchor, constant: 10).isActive = true
        tableView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.9).isActive = true
        
        // Sets the tableview height relative to the amount of registered devices
        if devices.count <= 1 {
            tableViewHeight.constant = 250
        } else {
            tableViewHeight.constant = 600
        }
    }
    
    // Perform a count of data to get the number of rows needed in the database
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return devices.count
    }
    
    // Load and return the cell to put in the row of the database
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let device = devices[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "DeviceCell") as! DeviceCellClass
        
        cell.setDevice(device: device)
        
        return cell
    }
    
    // Listens if a cell gets selected/clicked on and goes to the Device Detail page for that device
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        // Saves the index number of the selected to port it to the next page (detailview)
        UserDefaults.standard.set(indexPath.row, forKey: "indexPath")
        
        // Load the next page, where details and functions are of the selected device
        let deviceDetailView = DeviceDetailViewController()
        self.present(deviceDetailView, animated: true, completion: nil)
    }
}
