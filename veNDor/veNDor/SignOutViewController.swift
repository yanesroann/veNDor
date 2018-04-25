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
    
    var currentUser = KeychainWrapper.standard.string(forKey: "uid")
    
//    @IBOutlet weak var namelabel: UILabel!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //guard let username = Auth.auth().currentUser?.displayName else {return}
        let userData = Database.database().reference().child("users").child(currentUser!)
        userData.observeSingleEvent(of: .value, with: { (snapshot) in
            let data = snapshot.value as! Dictionary<String, AnyObject>
            let name = data["username"]
            let email = data["email"]
            self.nameLabel.text = name as? String
            self.emailLabel.text = email as? String
        })
 
        
        
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
