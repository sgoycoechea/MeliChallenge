//
//  ViewController.swift
//  MeliChallenge
//
//  Created by Santiago Goycoechea on 15/4/23.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        ProductManager.search(query: "Motorola%20G6") { result in
            switch result {
            case .success:
                print("show products")
            case .failure:
                print("show error message")
            }
        }
    }
}
