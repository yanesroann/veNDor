//
//  PhotoTableViewCell.swift
//  veNDor
//
//  Created by West   on 4/22/18.
//  Copyright © 2018 veNDor Team. All rights reserved.
//

import UIKit
import Firebase
import SwiftyJSON

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
        self.DisplayCatagory.text = post.catagory
        let x: String! = String(describing: post.price)

        self.DisplayPrice.text = x
        
        if let imageDownloadURL = post.downloadURL {
            let imageStorageRef = Storage.storage().reference(forURL: imageDownloadURL)
            imageStorageRef.getData(maxSize: 2 * 1024 * 1024) { [weak self] (data, error) in
                if let error = error {
                    print("******** \(error)")
                } else {
                    if let imageData = data {
                        let image = UIImage(data: imageData)
                        DispatchQueue.main.async {
                            self?.DisplayPhoto.image = image
                        }
                    }
                }
            }
        }
    }
    
}
    /* override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    } */
