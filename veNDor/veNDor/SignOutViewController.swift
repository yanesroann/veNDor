//
//  SignOutViewController.swift
//  veNDor
//
//  Created by Roann Yanes on 4/8/18.
//  Copyright © 2018 veNDor Team. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth
import SwiftKeychainWrapper

class SignOutViewController: UIViewController {
    
    
//    @IBOutlet weak var namelabel: UILabel!
    
    let user = Auth.auth().currentUser
    if let user = self.user {
        // The user's ID, unique to the Firebase project.
        // Do NOT use this value to authenticate with your backend server,
        // if you have one. Use getTokenWithCompletion:completion: instead.
        let uid = self.user.uid
        let email = self.user.email
        // ...
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    
    }
        
//        // Do any additional setup after loading the view.
//        guard let fullName = Auth.auth().currentUser?.displayName else { return }
//        namelabel.text = "Hello, \(fullName)!"
//    }

    
    @IBAction func onSignOutPressed(_ sender: Any) {
        do {
            try Auth.auth().signOut()
            performSegue(withIdentifier: "signOutSegue", sender: nil)
        } catch let signOutError as NSError {
            print ("Error signing out: %@", signOutError)
        }
        //KeychainWrapper.standard.removeObject(forKey: "key")
        //dismiss(animated: true, completion: nil)
        
    }
}
