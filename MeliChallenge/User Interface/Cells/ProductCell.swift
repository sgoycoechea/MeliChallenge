//
//  ProductCell.swift
//  MeliChallenge
//
//  Created by Santiago Goycoechea on 15/4/23.
//

import UIKit

class ProductCell: UITableViewCell {

    @IBOutlet weak var thumbnailImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    
    func setupCell(product: Product) {
        titleLabel.text = product.title?.trimmingCharacters(in: .whitespacesAndNewlines)
        priceLabel.text = (product.currencyId ?? "") + " " + String(format: "%.0f", product.price ?? 0)
        if let thumbnail = product.thumbnail {
            downloadImage(from: URL(string: thumbnail)!)
        }
    }
    
    func getData(from url: URL, completion: @escaping (Data?, URLResponse?, Error?) -> ()) {
        URLSession.shared.dataTask(with: url, completionHandler: completion).resume()
    }
    
    func downloadImage(from url: URL) {
        getData(from: url) { data, response, error in
            guard let data = data, error == nil else { return }
            DispatchQueue.main.async() { [weak self] in
                self?.thumbnailImageView.image = UIImage(data: data)
            }
        }
    }

}
