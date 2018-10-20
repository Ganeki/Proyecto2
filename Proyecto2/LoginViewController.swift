//
//  LoginViewController.swift
//  Proyecto2
//
//  Created by Ikani Lab on 19/10/18.
//  Copyright © 2018 Ikani Lab. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var nameText: UITextField!
    
    @IBOutlet weak var passText: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func loginButton(_ sender: Any) {
      
        let userNameText = nameText.text
        let userPasswordText = passText.text
        
        let nameStored = UserDefaults.standard.string(forKey: "userNameText")
        let passStored = UserDefaults.standard.string(forKey: "userPasswordText")
        
        
        if (userNameText!.isEmpty || userPasswordText!.isEmpty){
            //Display alert message
            
            displayAlert(userMessage: "All fields are required")
            
            return
        }
        
        
        if(nameStored == userNameText){
            
            if(passStored == userPasswordText){
                //Login is Succesful
                UserDefaults.standard.set(true, forKey: "isUserLoggedin")
                UserDefaults.standard.synchronize()
                
                self.dismiss(animated: true, completion: nil)
                
            }
        }else{
            
            displayAlert(userMessage: "Something goes wrong. Try again.")
            
            return
        }
        
    }
    
    func displayAlert(userMessage: String){
        
        let myAlert = UIAlertController(title: "Alert", message: userMessage, preferredStyle: UIAlertController.Style.alert)
        
        let okAction = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil)
        
        myAlert.addAction(okAction)
        
        self.present(myAlert, animated: true, completion: nil)
    }

}
