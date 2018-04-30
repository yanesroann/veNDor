//
//  Search.swift
//  veNDor
//
//  Created by Roann Yanes on 4/21/18.
//  Copyright © 2018 veNDor Team. All rights reserved.
//

import Foundation
import Firebase
import FirebaseDatabase
import KeychainSwift
import SwiftKeychainWrapper


class Search {
    private var _username: String!
    private var _userKey: String!
    private var _userRef: DatabaseReference!
    var currentUser = KeychainWrapper.standard.string(forKey: "uid")
    
    var username: String {
        return _username
    }
    
    var userKey: String {
        return _userKey
    }
    
    init(username: String) {
        _username = username
    }
    
    var userRef: DatabaseReference {
        return _userRef
    }
    
    init(userKey: String, postData: Dictionary<String, AnyObject>) {
        _userKey = userKey
        if let username = postData["username"] as? String {
            _username = username
        }
        _userRef = Database.database().reference().child("users").child(_userKey)
    }
    
    
}
