//
//  PhotoTableViewCell.swift
//  veNDor
//
//  Created by West   on 4/22/18.
//  Copyright © 2018 veNDor Team. All rights reserved.
//

import UIKit
import Firebase

class PhotoTableViewCell: UITableViewCell {

    @IBOutlet weak var DisplayPhoto: UIImageView!
    @IBOutlet weak var DisplayDescription: UILabel!
    @IBOutlet weak var DisplayPrice: UILabel!
    @IBOutlet weak var DisplayCatagory: UILabel!
    
    var post: Post! {
        didSet {
            self.updateUI()
        }
    }
    func updateUI(){
        self.DisplayDescription.text = post.caption
        self.DisplayPrice.text = post.caption
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
