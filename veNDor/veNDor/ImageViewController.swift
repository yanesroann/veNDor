//
//  ImageViewController.swift
//  veNDor
//
//  Created by West   on 4/14/18.
//  Copyright © 2018 veNDor Team. All rights reserved.
//

import UIKit
import Firebase

class ImageViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var imagepicker: UIImageView!
    @IBOutlet weak var ItemDescription: UITextField!
    @IBOutlet weak var ItemCatagory: UITextField!
    @IBOutlet weak var ItemPrice: UITextField!
    var textViewPlaceholderText = "Describe your item here"
    
    @IBAction func UploadPressed(_ sender: UIButton) {
        if ItemDescription.text != textViewPlaceholderText && ItemCatagory.text != "" && ItemPrice.text != "" && imagepicker != nil {
            let newPost = Post(image: imagepicker.image!, caption: ItemDescription.text!)
            //newPost.save()
            self.dismiss(animated: true, completion: nil)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ItemDescription.text = textViewPlaceholderText
        ItemDescription.textColor = .lightGray
        //ItemDescription.delegate = self as! UITextFieldDelegate
    }

    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        let image = info[UIImagePickerControllerOriginalImage] as! UIImage
            imagepicker.image = image
            dismiss(animated: true, completion: nil)
        /*THE IMAGE STORAGE STUFF
         if let imageData = UIImageJPEGRepresentation(image, 0.5) {
            let storage = Storage.storage().reference().child("images")
            storage.putData(imageData)
        } */
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let controller = UIImagePickerController()
        controller.delegate = self
        controller.sourceType = .photoLibrary
        present(controller, animated:true, completion:nil)
    }
}
