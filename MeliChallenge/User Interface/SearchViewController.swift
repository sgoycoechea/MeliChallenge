//
//  SearchViewController.swift
//  MeliChallenge
//
//  Created by Santiago Goycoechea on 15/4/23.
//

import UIKit
import SVProgressHUD

class SearchViewController: UIViewController {

    @IBOutlet weak var searchTextField: UITextField!
    
    @IBAction func search(_ sender: Any) {
        guard let query = searchTextField.text, !query.isEmpty else {
            self.showMessage(title: "Campo vacío", message: "Por favor ingrese un texto para buscar")
            return
        }
        SVProgressHUD.show()
        ProductManager.search(query: query) { result in
            SVProgressHUD.dismiss()
            switch result {
            case .success:
                print("show products")
            case .failure:
                self.showMessage(title: "Error", message: "Lo sentimos, ha ocurrido un error inesperado")
            }
        }
    }
}
