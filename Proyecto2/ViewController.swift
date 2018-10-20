//
//  ViewController.swift
//  Proyecto2
//
//  Created by Ikani Lab on 19/10/18.
//  Copyright © 2018 Ikani Lab. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func viewDidAppear(_ animated: Bool) {
        
        let isUserLoggedIn = UserDefaults.standard.bool(forKey: "isUserLoggedin")
        
        if(!isUserLoggedIn){
            
        self.performSegue(withIdentifier: "loginView", sender: self)
            
        }
    }

    @IBAction func Logout(_ sender: Any) {
        
        UserDefaults.standard.set(false, forKey: "isUserLoggedin")
        UserDefaults.standard.synchronize()
        
        self.performSegue(withIdentifier: "loginView", sender: self)
        
    }
    
    
    
}

