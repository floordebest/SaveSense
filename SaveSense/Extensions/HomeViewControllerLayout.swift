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

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return devices.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let device = devices[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "DeviceCell") as! DeviceCellClass
        
        cell.setDevice(device: device)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //let cell = self.tableView.cellForRow(at: indexPath)
        
        UserDefaults.standard.set(indexPath.row, forKey: "indexPath")
        
        // Do something when cell selected
        let deviceDetailView = DeviceDetailViewController()
        self.present(deviceDetailView, animated: true, completion: nil)
    }
}
