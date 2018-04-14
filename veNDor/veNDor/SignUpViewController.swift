//
//  SignUpViewController.swift
//  veNDor
//
//  Created by Roann Yanes on 4/4/18.
//  Copyright © 2018 veNDor Team. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth

class SignUpViewController: UIViewController {

    @IBOutlet weak var firstNameField: UITextField!
    @IBOutlet weak var lastNameField: UITextField!
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var confirmPasswordField: UITextField!
    @IBAction func onSignUpPressed(_ sender: Any) {
        guard let firstName = firstNameField.text, firstName != "",
            let lastName = lastNameField.text, lastName != "",
            let email = emailField.text, email != "",
            let password = passwordField.text, password != "",
            let confirmPassword = confirmPasswordField.text, confirmPassword == password
            else {
                AlertController.showAlert(self, title: "Error while signing up!", message: "Please make sure all fields are filled out and reconfirm password.")
                return
        }
        
        Auth.auth().createUser(withEmail: email, password: password, completion: { (user, error) in
            guard error == nil else {
                AlertController.showAlert(self, title: "Error!", message: error!.localizedDescription)
                return
            }
            guard let user = user else {return}
            print(user.email ?? "Missing Email")
            print(user.uid)
            
            let changeRequest = user.createProfileChangeRequest()
            changeRequest.displayName = firstName
            changeRequest.commitChanges(completion: { (error) in
                guard error == nil else {
                    AlertController.showAlert(self, title: "Error!", message: error!.localizedDescription)
                    return
                }
                self.performSegue(withIdentifier: "signUpSegue", sender: nil)
            })
        })
    }
}

