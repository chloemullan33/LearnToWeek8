//
//  File.swift
//  learntoios
//
//  Created by Chloe Mullan on 02/07/2018.
//  Copyright © 2018 Chloe Mullan. All rights reserved.
//

import Foundation
import UIKit
import Firebase

class LoginViewController: UIViewController {
    
    @IBOutlet weak var usernameField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    
    @IBAction func loginButton(_ sender: Any) {
        
        if self.usernameField.text == "" || self.passwordField.text == "" {
        
        //Alert to tell the user that there was an error because they didn't fill anything in the textfields
        let alertController = UIAlertController(title: "Error", message: "Please enter an email and password.", preferredStyle: .alert)
        
        let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        alertController.addAction(defaultAction)
        
        self.present(alertController, animated: true, completion: nil)
        
    } else {
    
            Auth.auth().signIn(withEmail: self.usernameField.text!, password: self.passwordField.text!) { (user, error) in
    
                if error == nil {
    
                    //Print into the console if successfully logged in
                    print("You have successfully logged in")
    
                    //Go to the HomeViewController if the login is sucessful
                    let vc = self.storyboard?.instantiateViewController(withIdentifier: "home")
                    self.present(vc!, animated: true, completion: nil)
    
                } else {
    
                    //Tells the user that there is an error and then gets firebase to tell them the error
                    let alertController = UIAlertController(title: "Error", message: error?.localizedDescription, preferredStyle: .alert)
    
                    let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                    alertController.addAction(defaultAction)
    
                    self.present(alertController, animated: true, completion: nil)
                }
            }
        }
    }
}
