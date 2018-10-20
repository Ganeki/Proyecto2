//
//  RegisterViewController.swift
//  Proyecto2
//
//  Created by Ikani Lab on 19/10/18.
//  Copyright © 2018 Ikani Lab. All rights reserved.
//

import UIKit

class RegisterViewController: UIViewController {
    @IBOutlet weak var UserName: UITextField!
    @IBOutlet weak var UserPassword: UITextField!
    @IBOutlet weak var RepeatPassword: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func registerButton(_ sender: Any) {
    
        let userNameText = UserName.text
        let userPasswordText = UserPassword.text
        let repeatPasswordText = RepeatPassword.text
        
        //Check for empty fields
        if (userNameText!.isEmpty || userPasswordText!.isEmpty || repeatPasswordText!.isEmpty){
            //Display alert message
            
            displayAlert(userMessage: "All fields are required")
            
            return
        }
        
        //Check if passwords match
        
        if (userPasswordText != repeatPasswordText){
            
            displayAlert(userMessage: "Passwords do not match")
            return
        }
        
        //Store Data
        
        UserDefaults.standard.set(userNameText, forKey: "userNameText")
        UserDefaults.standard.set(userPasswordText, forKey: "userPasswordText")
        UserDefaults.standard.synchronize()
        
        //Display alert message with confirmation
        
        
        let myAlert = UIAlertController(title: "Alert", message: "Registration is succesful", preferredStyle: UIAlertController.Style.alert)
        
        let okAction = UIAlertAction(title: "OK", style: UIAlertAction.Style.default){ action in
            
            self.dismiss(animated: true, completion: nil)
            
        }
        
        myAlert.addAction(okAction)
        self.present(myAlert, animated: true, completion: nil)
    
        
    }
    
    func displayAlert(userMessage: String){
        
        let myAlert = UIAlertController(title: "Alert", message: userMessage, preferredStyle: UIAlertController.Style.alert)
        
        let okAction = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil)
        
        myAlert.addAction(okAction)
        
        self.present(myAlert, animated: true, completion: nil)
    }

}
