//
//  messageDetailCell.swift
//  veNDor
//
//  Created by Roann Yanes on 4/18/18.
//  Copyright © 2018 veNDor Team. All rights reserved.
//

import UIKit
import Firebase
import FirebaseStorage
import FirebaseDatabase
import KeychainSwift
import SwiftKeychainWrapper

class messageDetailCell: UITableViewCell {
    
    @IBOutlet weak var recipientName: UILabel!
    @IBOutlet weak var chatPeview: UILabel!
    
    var messageDetail: MessageDetail!
    var userPostKey: DatabaseReference!
    var currentUser = KeychainWrapper.standard.string(forKey: "uid")


    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configureCell(messageDetail: MessageDetail) {
        self.messageDetail = messageDetail
        
        let recipientData = Database.database().reference().child("users").child(messageDetail.recipient)
        
        recipientData.observeSingleEvent(of: .value, with: { (snapshot) in
            let data = snapshot.value as! Dictionary<String, AnyObject>
            let name = data["name"]
            self.recipientName.text = name as? String
        })
    }

}
