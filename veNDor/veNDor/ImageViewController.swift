//
//  ImageViewController.swift
//  veNDor
//
//  Created by West   on 4/14/18.
//  Copyright © 2018 veNDor Team. All rights reserved.
//

import UIKit
import Firebase
import SwiftyJSON
import SwiftKeychainWrapper

class ImageViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate, UIPickerViewDataSource, UIPickerViewDelegate {

    @IBOutlet weak var imagepicker: UIImageView!
    @IBOutlet weak var ItemDescription: UITextField!
    @IBOutlet weak var ItemPrice: UITextField!
    
    var email: String!
    var currentUser = KeychainWrapper.standard.string(forKey: "uid")
    
    var tempCat = "Furniture"
    @IBOutlet weak var pickerView: UIPickerView!
    
    
    let pickerDataSource = ["Furniture", "Clothing", "Tickets", "Lease/Sublease", "Rides", "Textbooks", "Bikes"]
    @IBAction func UploadPressed(_ sender: UIButton) {
        if ItemDescription.text != ""  && ItemPrice.text != "" && imagepicker != nil {
            let PriceInt:Int? = Int(ItemPrice.text!)
            let newPost = Post(image: imagepicker.image!,
                               caption: ItemDescription.text!,
                               catagory: tempCat,
                               price: PriceInt!,
                               email: self.email)
            newPost.save()
            self.performSegue(withIdentifier: "GoToFeed", sender: nil)
        }
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerDataSource.count;
    }
    
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerDataSource[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
         tempCat = pickerDataSource[row]
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pickerView!.dataSource = self
        pickerView!.delegate = self

        let userData = Database.database().reference().child("users").child(currentUser!)
        userData.observeSingleEvent(of: .value, with: { (snapshot) in
            let data = snapshot.value as! Dictionary<String, AnyObject>
            let email_real = data["email"]
            self.email = email_real as! String
        })
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
