//
//  ProductViewController.swift
//  MeliChallenge
//
//  Created by Santiago Goycoechea on 16/4/23.
//

import UIKit

class ProductViewController: UIViewController {

    var product: Product!
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameLabel.text = product.title
        priceLabel.text = (product.currencyId ?? "") + " " + String(format: "%.0f", product.price ?? 0)
    }
    
    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        if segue.identifier == Constants.Segues.embedCarouselViewController {
            let carouselViewController = segue.destination as! CarouselPageViewController
            guard let pictures = product.pictures else { return }
            carouselViewController.pictureUrls = pictures.map({ $0.secureUrl ?? $0.url ?? "" })
        }
    }
}
