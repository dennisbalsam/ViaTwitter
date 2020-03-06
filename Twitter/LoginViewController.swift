//
//  LoginViewController.swift
//  Twitter
//
//  Created by user165734 on 3/1/20.
//  Copyright © 2020 Dan. All rights reserved.
//  File for logging in to your account

import UIKit

class LoginViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    // will check if user has logged in previosuly
    override func viewDidAppear(_ animated: Bool) {
        if UserDefaults.standard.bool(forKey: "userLoggedIn") {
            self.performSegue(withIdentifier: "loginToHome", sender: self)
        }
    }
    
    
    //login action
    @IBAction func onLoginButton(_ sender: Any) {
        //var for api endpoiint for token
        let tokenEndpoint = "https://api.twitter.com/oauth/request_token"
        //api call to login from api calls file
        TwitterAPICaller.client?.login(url: tokenEndpoint, success: {
            //remember user so they dont have to login next time
            UserDefaults.standard.set(true, forKey: "userLoggedIn")
            //redirect to home page
            self.performSegue(withIdentifier: "loginToHome", sender: self)
            
            
        }, failure: { (Error) in
            //print failure message
            print("could not login properly")
        })
    }
    
    
    
    
    

    

    

}
