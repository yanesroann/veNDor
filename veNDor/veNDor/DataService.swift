//
//  DataService.swift
//  veNDorStarterApp
//
//  Created by Roann Yanes on 2/25/18.
//  Copyright © 2018 Roann Yanes. All rights reserved.
//

import Foundation
import Firebase
import FirebaseDatabase
import KeychainSwift


class DataService {
    private var _keychain = KeychainSwift()
    //private var _refDatabase = Database.database().reference()
    
    var keyChain: KeychainSwift {
        get {
            return _keychain
        } set {
            _keychain = newValue
        }
    }
}
