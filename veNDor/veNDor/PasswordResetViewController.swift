//
//  PasswordResetViewController.swift
//  veNDor
//
//  Created by klutz1 on 4/21/18.
//  Copyright © 2018 veNDor Team. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase
import SwiftKeychainWrapper
import FirebaseAuth

class PasswordResetViewController: UIViewController {

    @IBOutlet weak var emailField: UITextField!

    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onResetPassword(_ sender: Any) {
        guard let email = emailField.text, email != ""
            else {
                AlertController.showAlert(self, title: "Error while signing in!", message: "Please enter valid email.")
                return
        }
        Auth.auth().sendPasswordReset(withEmail: email) { (error) in
            if error != nil {
                AlertController.showAlert(self, title: "Password Reset!", message: "Password reset failed to send: \(error!.localizedDescription)")
            }
        }
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
