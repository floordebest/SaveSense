//
//  customButton.swift
//  SaveSense
//
//  Created by Floor de Best on 20/11/2018.
//  Copyright © 2018 dBest Innovations. All rights reserved.
//

import Foundation
import UIKit

class customButton: UIButton {
    
    let myColor : UIColor = .clear
    let shadowColor : UIColor = .black
    
    override init(frame: CGRect){
        super.init(frame: frame)
        
        buttonSetup()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func buttonSetup() {
        
        self.clipsToBounds = false
        self.backgroundColor = .white
        self.layer.borderWidth = 4
        self.layer.borderColor = myColor.cgColor
        self.layer.shadowOpacity = 1.0
        self.layer.shadowRadius = 0.0
        self.layer.shadowColor = shadowColor.cgColor
        self.layer.shadowOffset = CGSize(width: 0, height: 3)
        self.layer.cornerRadius = 20
        self.isSpringLoaded = true
        
    }
}
