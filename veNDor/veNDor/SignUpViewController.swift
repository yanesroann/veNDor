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
import JSQMessagesViewController
//import KeychainSwift

class SignUpViewController: UIViewController {


    @IBOutlet weak var fullNameField: UITextField!
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var confirmPasswordField: UITextField!
    @IBAction func onSignUpPressed(_ sender: Any) {
//        guard let fullName = fullNameField.text, fullName != "",
//            let email = emailField.text, email != "",
//            let password = passwordField.text, password != "",
//            let confirmPassword = confirmPasswordField.text, confirmPassword == password
//            else {
//                AlertController.showAlert(self, title: "Error while signing up!", message: "Please make sure all fields are filled out and reconfirm password.")
//                return
//        }
//
//        Auth.auth().createUser(withEmail: email, password: password, completion: { (user, error) in
//            guard error == nil else {
//                AlertController.showAlert(self, title: "Error!", message: error!.localizedDescription)
//                return
//            }
//            guard let user = user else {return}
//            print(user.email ?? "Missing Email")
//            print(user.uid)
//
//            let changeRequest = user.createProfileChangeRequest()
//            changeRequest.displayName = fullName
//            changeRequest.commitChanges(completion: { (error) in
//                guard error == nil else {
//                    AlertController.showAlert(self, title: "Error!", message: error!.localizedDescription)
//                    return
//                }
//                self.performSegue(withIdentifier: "signUpSegue", sender: nil)
//            })
//        })
    }
}

