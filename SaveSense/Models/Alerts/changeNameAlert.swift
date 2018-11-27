//
//  changeNameAlert.swift
//  SaveSense
//
//  Created by Floor de Best on 26/11/2018.
//  Copyright © 2018 dBest Innovations. All rights reserved.
//

import Foundation
import UIKit


// Custom alert to change a label and save the new data

class AlertWithEdit {
    
    var title: String
    var buttonTitleDone: String
    var buttonTitleCancell: String
    var textFieldText: String
    var currentDeviceName: String
    var deviceIndexPosition: Int
    
    
    init?(title: String, buttonTitleDone: String, buttonTitleCancell: String, textFieldText: String, currentDeviceName: String, deviceIndexPosition: Int) {
        
        self.title = title
        self.buttonTitleDone = buttonTitleDone
        self.buttonTitleCancell = buttonTitleCancell
        self.textFieldText = textFieldText
        self.currentDeviceName = currentDeviceName
        self.deviceIndexPosition = deviceIndexPosition
    }
    
    // Function to setup the alert
    func setupAlert(on VC: UIViewController) {
        
        // Pops up the alert
        let alertPupUp = UIAlertController(title: title, message: nil, preferredStyle: UIAlertController.Style.alert)
        
        // Load a textField on the popup and give the placeholder the name of the label you want to change
        alertPupUp.addTextField(configurationHandler: { (textField: UITextField!) -> Void in
            textField.placeholder = self.currentDeviceName
            textField.layer.cornerRadius = 12
        })
        
        // Load the button to save the (changed) data
        alertPupUp.addAction(UIAlertAction(title: buttonTitleDone, style: UIAlertAction.Style.default, handler: { UIAlertAction  in
            
            // Get the text that's inside the textField
            self.textFieldText = alertPupUp.textFields![0].text!
            
            // Save the text if it is not empty or the same as it was before
            // TODO: Register the new data to Firebase
            if self.textFieldText != self.currentDeviceName && self.textFieldText != "" {
                let index = self.deviceIndexPosition
                devices[index].deviceName = self.textFieldText
                print(devices[index].deviceName)
            }
        }))
        
        // Load the Cancell button to close the pop up without any changes to save
        alertPupUp.addAction(UIAlertAction(title: buttonTitleCancell, style: UIAlertAction.Style.default, handler: nil))
        
        // Load the pop up on the given viewcontroller (set variable VC)
        VC.present(alertPupUp, animated: true, completion: nil)
        
    }
    
}
