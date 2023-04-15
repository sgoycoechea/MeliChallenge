//
//  Extensions.swift
//  MeliChallenge
//
//  Created by Santiago Goycoechea on 15/4/23.
//

import UIKit

extension UIViewController {
    func showMessage(title: String, message: String) {
        let dialogMessage = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Ok", style: .default)
        dialogMessage.addAction(okAction)
        self.present(dialogMessage, animated: true, completion: nil)
    }
}
