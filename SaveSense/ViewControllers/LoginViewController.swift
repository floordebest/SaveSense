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
    
    // Animates the pop-up of the 'cardview' for login
    func animateShowLoginCardView() {
        setupLoginCardView()
        loginViewBottomConstraint.constant = 200
        UIView.animate(withDuration: 0.6, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 5, options: .curveEaseOut, animations: {
            self.view.layoutIfNeeded()
        }, completion: nil)
    }
    
    // Animates the pop-up of the 'cardview' for registering
    func animateShowRegisterCardView() {
        setupRegisterView()
        registerViewCenterConstraint.constant = 0
        UIView.animate(withDuration: 0.6, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 5, options: .curveEaseOut, animations: {
            self.view.layoutIfNeeded()
        }, completion: nil)
    }
    
    // Animates the switching between registering and login 'cardview'
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
    
    // Function when the button is pressed to go to the login 'cardview'
    @objc func toLoginButtonPressed(sender: UIButton!) {
        animateShowLoginCardView()
    }
    
    // Function when the button is pressed to go to the registering 'cardview'
    @objc func toRegisterButtonPressed(sender: UIButton!){
        animateShowRegisterCardView()
    }
    
    // Function when someone clicks on the text ('Don't have an account yet..?')on the login cardview to go to register cardview
    @objc func tapRegisterText(sender:UITapGestureRecognizer) {
        animateSwitchRegisterAndLogin(from: "login")
    }
    
    // Function when someone clicks on the text ('Allready have an account?...') on the register cardview to go to the login cardview
    @objc func tapLoginText(sender:UITapGestureRecognizer) {
        animateSwitchRegisterAndLogin(from: "register")
    }
    
    // Function when the keyboard is on screen and someone taps around the keyboard to hide the keyboard
    @objc func hideKeyboard(sender:UITapGestureRecognizer) {
        view.endEditing(true)
    }
    
    // Function to go to the main view (home view controller) after pushing login button
    // TODO: Implement Firebase account check on login
    @objc func loginButtonPressed() {
        //Login
        let homeView = HomeViewController()
        self.present(homeView, animated: true, completion: nil)
    }
    
    // Function to send registered account data to Firebase to create an account
    // TODO: Implement sending data to firebase, receive account ID and save it to device and go to main screen
    @objc func registerButtonPressed() {
        //Register
    }

    // Function voor demo purpose to get out of the loading screen when the screen is tapped
    // NOT ACTIVE RIGHT NOW
    @objc func tappert(sender:UITapGestureRecognizer) {
        quitLoading = true
        print("clicked screen")
    }
    
    // Listens if there is a touch on the screen
    func registerTouch() {
        let tapper = UITapGestureRecognizer(target: self, action: #selector(LoginViewController.tappert))
        logoView.isUserInteractionEnabled = true
        view.addGestureRecognizer(tapper)
    }
    
}
