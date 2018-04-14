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
        Auth.auth().signIn(withEmail: email, password: password) { (user, error) in
            if error == nil {
                self.CompleteSignIn(id: user!.uid)
                self.performSegue(withIdentifier: "signInSegue", sender: nil)
            }
            else {
                AlertController.showAlert(self, title: "Error!", message: error!.localizedDescription)
                return
            }
            guard let user = user else { return }
            print(user.email ?? "Missing email")
            print(user.displayName ?? "Missing display name")
            print(user.uid)
        }
    }
}




