//
//  SignInViewController.swift
//  veNDor
//
//  Created by Roann Yanes on 4/8/18.
//  Copyright © 2018 veNDor Team. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase
import SwiftKeychainWrapper
import FirebaseAuth

class SignInViewController: UIViewController {

        
    @IBOutlet weak var emailField:UITextField!
    @IBOutlet weak var passwordField:UITextField!
    var userUID: String!

    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
//    override func viewDidAppear(_ animated: Bool) {
//        if let _ = KeychainWrapper.standard.string(forKey: "uid") {
//            performSegue(withIdentifier: "signInSegue", sender: nil)
//        }
//    }
//    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "signUpPage" {
            if let destination = segue.destination as? SignUpViewController {
                if self.userUID != nil {
                    destination.userUID = userUID
                }
                if self.emailField.text != nil {
                    destination.emailField = emailField
                }
                if self.passwordField.text != nil {
                    destination.passwordField = passwordField
                }
            }
        }
        
//        if segue.identifier == "signInSegue" {
//            if let destination = segue.destination as? SignOutViewController {
//                if self.userUID != nil {
//                    guard let fullName = Auth.auth().currentUser?.displayName else { return }
//                }
//            }
//        }
    }
    
    @IBAction func onSignInPressed(_ sender: Any) {
        guard let email = emailField.text, email != "",
            let password = passwordField.text, password != ""
            else {
                AlertController.showAlert(self, title: "Error while signing in!", message: "Please enter valid email and password.")
                return
        }
        Auth.auth().signIn(withEmail: email, password: password, completion: { (user, error) in
            if error == nil {
                self.userUID = user?.uid
                KeychainWrapper.standard.set(self.userUID, forKey: "uid")
                if let u = Auth.auth().currentUser {
                    if u.isEmailVerified {
                        self.performSegue(withIdentifier: "signInSegue", sender: nil)
                    }
                    else if !(u.isEmailVerified) {
                        AlertController.showAlert(self, title: "Error", message: "Sorry. Your email address has not yet been verified. We will send another email to verify your account to \(email).")
                        Auth.auth().currentUser?.sendEmailVerification(completion: { (error) in
                            if error != nil {
                                AlertController.showAlert(self, title: "Email Verification!", message: "Email verification failed to send: \(error!.localizedDescription)")
                            } else {
                                AlertController.showAlert(self, title: "Email Verification!", message: "Email verification has been sent. Please tap on the link in the email to verify your account before you can use the features in the app.")
                            }
                        })
                        return
                    }
                }
            }
            else {
                AlertController.showAlert(self, title: "User not found!", message: "Please create an account.")
                self.performSegue(withIdentifier: "signUpPage", sender: nil)
            }
            guard let user = user else { return }
            print(user.email ?? "Missing email")
            print(user.displayName ?? "Missing display name")
            print(user.uid)
        })
    }
}




