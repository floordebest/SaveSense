//
//  changeNameAlert.swift
//  SaveSense
//
//  Created by Floor de Best on 26/11/2018.
//  Copyright © 2018 dBest Innovations. All rights reserved.
//

import Foundation
import UIKit

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
    
    func setupAlert(on VC: UIViewController) {
        let alertPupUp = UIAlertController(title: title, message: nil, preferredStyle: UIAlertController.Style.alert)
        
        alertPupUp.addTextField(configurationHandler: { (textField: UITextField!) -> Void in
            textField.placeholder = self.currentDeviceName
            textField.layer.cornerRadius = 12
        })
        
        alertPupUp.addAction(UIAlertAction(title: buttonTitleDone, style: UIAlertAction.Style.default, handler: { UIAlertAction  in
            //let textFieldInput = textFieldChangeName.text
            self.textFieldText = alertPupUp.textFields![0].text!
            
            if self.textFieldText != self.currentDeviceName && self.textFieldText != "" {
                let index = self.deviceIndexPosition
                devices[index].deviceName = self.textFieldText
                print(devices[index].deviceName)
            }
        }))
        
        alertPupUp.addAction(UIAlertAction(title: buttonTitleCancell, style: UIAlertAction.Style.default, handler: nil))
        
        VC.present(alertPupUp, animated: true, completion: nil)
        
    }
    
}
