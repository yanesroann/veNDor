//
//  MessagesCell.swift
//  veNDor
//
//  Created by Roann Yanes on 4/21/18.
//  Copyright © 2018 veNDor Team. All rights reserved.
//

import UIKit
import KeychainSwift
import SwiftKeychainWrapper

class MessagesCell: UITableViewCell {
    
    @IBOutlet weak var receivedMessageLabel: UILabel!
    @IBOutlet weak var receivedMessageView: UIView!
    @IBOutlet weak var sentMessageLabel: UILabel!
    @IBOutlet weak var sentMessageView: UIView!
    
    var message: Message!
    
    var currentUser = KeychainWrapper.standard.string(forKey: "uid")

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configCell(message: Message) {
        self.message = message
        if message.sender == currentUser {
            sentMessageView.isHidden = false
            sentMessageLabel.text = message.message
            receivedMessageLabel.text = ""
            receivedMessageLabel.isHidden = true
        } else {
            sentMessageView.isHidden = true
            sentMessageLabel.text = ""
            receivedMessageLabel.text = message.message
            receivedMessageLabel.isHidden = false
        }
    }

}
