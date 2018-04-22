//
//  PostData.swift
//  veNDor
//
//  Created by West   on 4/14/18.
//  Copyright © 2018 veNDor Team. All rights reserved.
//

import Foundation
import UIKit
import Firebase
import SwiftyJSON

class Post {
    private var image: UIImage!
    var caption: String!
    var catagory: String!
    //var downloadURL: String?
    var price: Int?
    
    
    init(image: UIImage, caption: String, catagory:String, price:Int) {
        self.image = image
        self.caption = caption
        self.catagory = catagory
        self.price = price
    }
    
     init(snapshot: DataSnapshot) {
        let json = JSON(snapshot.value)
        self.caption = json["caption"].stringValue
        self.catagory = json["catagory"].stringValue
        self.price = json["price"].intValue
    }

    func save() {
        let newPostRef = Database.database().reference().child("posts").childByAutoId()
        let newPostKey = newPostRef.key
        
        if let imageData = UIImageJPEGRepresentation(image, 0.5) {
            let storage = Storage.storage().reference().child("images/\(newPostKey)")
            storage.putData(imageData).observe(.success, handler: { (snapshot) in
                let postDictionary = [
                    "caption" : self.caption,
                    "catagory" : self.catagory,
                    "price" : self.price!
                    ] as! DataSnapshot
                
                newPostRef.setValue(postDictionary)
            })
        }
    }
}
