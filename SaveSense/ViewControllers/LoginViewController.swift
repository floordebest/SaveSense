//
//  LoginViewController.swift
//  SaveSense
//
//  Created by Floor de Best on 20/11/2018.
//  Copyright © 2018 dBest Innovations. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    let toLoginButton     =       customButton()
    let toRegisterButton  =       customButton()
    
    let logoView            =       UIImageView()
    let satelliteView       =       UIView()
    let satelliteImageView  =       UIImageView()
    
    let watchLogo: UIImage  = #imageLiteral(resourceName: "watchIconWhiteBackground.png")
    let satelliteImage: UIImage = #imageLiteral(resourceName: "satelliteIcon.png")
    
    let loginCardView       =       UIView()
    let loginTopTextLabel   =       UILabel()
    let loginEmailTextField =       UITextField()
    let loginPasswordTextField =    UITextField()
    let loginButton         =       customButton()
    let registerTextLink    =       UILabel()
    
    let registerCardView    =       UIView()
    let registerTopTextLabel    =   UILabel()
    let registerEmailTextField  =   UITextField()
    let registerPasswordTextField = UITextField()
    let registerButton      =       customButton()
    let loginTextLink       =       UILabel()
    
    var quitLoading: Bool   =   false
    
    
    var loginViewBottomConstraint: NSLayoutConstraint!
    var registerViewCenterConstraint: NSLayoutConstraint!
   
    var logoViewTopAnchor: NSLayoutConstraint!
    var logoViewWidth: NSLayoutConstraint!
    var logoViewHeight: NSLayoutConstraint!
    var logoInCenter: NSLayoutConstraint!
  
    //let homeViewController = UIViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Load screen with logo and buttons to go to login or register
        loadLogo()
        
        //Listens for clicks on the buttons on the load screen
        toLoginButton.addTarget(self, action: #selector(toLoginButtonPressed), for: .touchUpInside)
        toRegisterButton.addTarget(self, action: #selector(toRegisterButtonPressed), for: .touchUpInside)
        
        //Listens for clicks on the CardView buttons for login and register
        loginButton.addTarget(self, action: #selector(loginButtonPressed), for: .touchUpInside)
        registerButton.addTarget(self, action: #selector(registerButtonPressed), for: .touchUpInside)
    }
    
    func animateShowLoginCardView() {
        setupLoginCardView()
        loginViewBottomConstraint.constant = 200
        UIView.animate(withDuration: 0.6, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 5, options: .curveEaseOut, animations: {
            self.view.layoutIfNeeded()
        }, completion: nil)
    }
    
    func animateShowRegisterCardView() {
        setupRegisterView()
        registerViewCenterConstraint.constant = 0
        UIView.animate(withDuration: 0.6, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 5, options: .curveEaseOut, animations: {
            self.view.layoutIfNeeded()
        }, completion: nil)
    }
    
    func animateSwitchRegisterAndLogin(from: String) {
        if from == "login" {
            loginViewBottomConstraint.constant = 700
            UIView.animate(withDuration: 0.3, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 5, options: .curveEaseOut, animations: {
                self.view.layoutIfNeeded()
            }, completion: { (finished: Bool) in
                self.animateShowRegisterCardView()
            })
        } else if from == "register" {
            registerViewCenterConstraint.constant = 400
            UIView.animate(withDuration: 0.3, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 5, options: .curveEaseOut, animations: {
                self.view.layoutIfNeeded()
            }, completion: { (finished: Bool) in
                self.animateShowLoginCardView()
            })
        }
    }
    
    @objc func toLoginButtonPressed(sender: UIButton!) {
        animateShowLoginCardView()
    }
    
    @objc func toRegisterButtonPressed(sender: UIButton!){
        animateShowRegisterCardView()
    }
    
    @objc func tapRegisterText(sender:UITapGestureRecognizer) {
        animateSwitchRegisterAndLogin(from: "login")
    }
    
    @objc func tapLoginText(sender:UITapGestureRecognizer) {
        animateSwitchRegisterAndLogin(from: "register")
    }
    
    @objc func hideKeyboard(sender:UITapGestureRecognizer) {
        view.endEditing(true)
    }
    
    @objc func tappert(sender:UITapGestureRecognizer) {
        quitLoading = true
        print("clicked screen")
    }
    
    @objc func loginButtonPressed() {
        //Login
        let homeView = HomeViewController()
        self.present(homeView, animated: true, completion: nil)
    }
    
    @objc func registerButtonPressed() {
        //Register
    }

}
