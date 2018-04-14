//
//  AlertController.swift
//  veNDor
//
//  Created by Roann Yanes on 4/8/18.
//  Copyright © 2018 veNDor Team. All rights reserved.
//

import UIKit

class AlertController {
    static func showAlert(_ inViewController: UIViewController, title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(action)
        inViewController.present(alert, animated: true, completion: nil)
    }
}
