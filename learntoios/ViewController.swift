//
//  ViewController.swift
//  learntoios
//
//  Created by Chloe Mullan on 29/06/2018.
//  Copyright © 2018 Chloe Mullan. All rights reserved.
//

import UIKit
import Firebase

class ViewController: UIViewController {
    
    //Textfields for email and password
    @IBOutlet weak var emailAddress: UITextField!
    @IBOutlet weak var password: UITextField!
    
    //button for registration
    @IBAction func registerButton(_ sender: UIButton) {
        let email = emailAddress.text
        let password = self.password.text

        Auth.auth().createUser(withEmail: email!, password: password!, completion: { (user, error) in
            if error == nil {
                let vc = self.storyboard?.instantiateViewController(withIdentifier: "home")
                self.present(vc!, animated: true, completion: nil)
                
            } else {
                let alertController = UIAlertController(title: "Error", message: error?.localizedDescription, preferredStyle: .alert)
                
                let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                alertController.addAction(defaultAction)
                
                self.present(alertController, animated: true, completion: nil)
            }
        })
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //initialising firebase
        if FirebaseApp.app() == nil {
            FirebaseApp.configure()
        }
    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

