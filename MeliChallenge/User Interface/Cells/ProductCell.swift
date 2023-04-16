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
            thumbnailImageView.downloaded(from: thumbnail)
        }
    }
}
