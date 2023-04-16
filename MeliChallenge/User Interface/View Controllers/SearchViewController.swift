//
//  SearchViewController.swift
//  MeliChallenge
//
//  Created by Santiago Goycoechea on 15/4/23.
//

import UIKit
import SVProgressHUD

class SearchViewController: UIViewController, UITextFieldDelegate {

    var products: [Product]?
    var query: String?
    var totalProducts: Int?
    
    @IBOutlet weak var searchTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchTextField.delegate = self
    }
    
    @IBAction func search(_ sender: Any) {
        search()
    }
    
    // MARK: - UITextFieldDelegate

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        search()
        return true
    }
    
    // MARK: - Private methods
    
    private func search() {
        guard let query = searchTextField.text, !query.isEmpty else {
            self.showMessage(title: "Campo vacío", message: "Por favor ingrese un texto para buscar")
            return
        }
        self.query = query
        SVProgressHUD.show()
        ProductManager.search(query: query) { result in
            SVProgressHUD.dismiss()
            switch result {
            case .success(let productsData):
                guard productsData.totalProducts > 0 else {
                    self.showMessage(title: "Búsqueda vacía", message: "No encontramos ningún producto con ese nombre")
                    return
                }
                self.products = productsData.products
                self.totalProducts = productsData.totalProducts
                self.performSegue(withIdentifier: Constants.Segues.showProductList, sender: nil)
            case .failure:
                self.showMessage(title: Constants.Errors.error, message: Constants.Errors.unexpectedError)
            }
        }
    }
    
    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        if segue.identifier == Constants.Segues.showProductList {
            let productsTableViewController = segue.destination as! ProductsTableViewController
            productsTableViewController.products = products
            productsTableViewController.totalProducts = totalProducts
            productsTableViewController.query = query
        }
    }
}
