//
//  Constants.swift
//  veNDorStarterApp
//
//  Created by Roann Yanes on 2/24/18.
//  Copyright © 2018 Roann Yanes. All rights reserved.
//

import Foundation
import Firebase

struct Constants
{
    struct refs
    {
        static let databaseRoot = Database.database().reference()
        static let databaseChats = databaseRoot.child("chats")
    }
}
