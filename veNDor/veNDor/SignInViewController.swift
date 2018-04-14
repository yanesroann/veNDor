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
import JSQMessagesViewController
import KeychainSwift

class SignInViewController: UIViewController {

    let keyChain = DataService().keyChain
        
    @IBOutlet weak var emailField:UITextField!
    @IBOutlet weak var passwordField:UITextField!
        
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // user sign in and email authentication
    override func viewDidAppear(_ animated: Bool) {
        let keyChain = DataService().keyChain
        if keyChain.get("uid") != nil {
            performSegue(withIdentifier: "signInSegue", sender: nil)
        }
    }
    
    func CompleteSignIn(id: String) {
        let keyChain = DataService().keyChain
        keyChain.set(id, forKey: "uid")
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
                self.CompleteSignIn(id: user!.uid)
                self.performSegue(withIdentifier: "signInSegue", sender: nil)
            }
            else {
                AlertController.showAlert(self, title: "Error!", message: error!.localizedDescription)
                self.performSegue(withIdentifier: "newUserSegue", sender: nil)
                return
            }
            if error != nil {
                print("Error: \(String(describing:error!.localizedDescription))")
                return
            }
            Auth.auth().currentUser?.sendEmailVerification(completion: { (error) in
                if error != nil {
                    AlertController.showAlert(self, title: "Email Verification!", message: "Email verification failed to send: \(error!.localizedDescription)")
                } else {
                    AlertController.showAlert(self, title: "Email Verification!", message: "Email verification has been sent. Please tap on the link in the email to verify ypur account before you can use the features in the app.")
                }
            })
            guard let user = user else { return }
            print(user.email ?? "Missing email")
            print(user.displayName ?? "Missing display name")
            print(user.uid)
        })
    }
}




