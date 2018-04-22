//
//  SignUpViewController.swift
//  veNDor
//
//  Created by Roann Yanes on 4/4/18.
//  Copyright © 2018 veNDor Team. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase
import FirebaseAuth
import KeychainSwift
import SwiftKeychainWrapper


class SignUpViewController: UIViewController {
    @IBOutlet weak var fullNameField: UITextField!
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var confirmPasswordField: UITextField!
    var userUID: String!
    
//    override func viewDidAppear(_ animated: Bool) {
//        if let _ = KeychainWrapper.standard.string(forKey: "uid") {
//            performSegue(withIdentifier: "signInSegue", sender: nil)
//        }
//    }
    
    func setUser() {
        let userData = [
            "username": fullNameField!
        ]
        KeychainWrapper.standard.set(self.userUID, forKey: "uid")
        let location = Database.database().reference().child("users").child(userUID)
        location.setValue(userData)
        dismiss(animated: true, completion: nil)
    }

    @IBAction func onSignUpPressed(_ sender: Any) {
        guard let fullName = fullNameField.text, fullName != "",
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
                if let user = user {
                    self.userUID = user.uid
                }
                guard let user = user else { return }
                print(user.email ?? "Missing Email")
                print(user.uid)

                self.performSegue(withIdentifier: "signUpSegue", sender: nil)
            })
        }
}

