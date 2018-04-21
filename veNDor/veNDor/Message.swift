//
//  Message.swift
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


class Message {
    private var _message: String!
    private var _sender: String!
    private var _messageKey: String!
    private var _messageRef: DatabaseReference!
    var currentUser = KeychainWrapper.standard.string(forKey: "uid")
    
    var message: String {
        return _message
    }
    
    var sender: String {
        return _sender
    }
    
    var messageKey: String {
        return _messageKey
    }
    
    init(message: String, sender: String) {
        _message = message
        _sender = sender
    }
    
    init(messageKey: String, postData: Dictionary<String, AnyObject>) {
        
    }
}
