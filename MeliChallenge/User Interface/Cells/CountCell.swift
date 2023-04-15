//
//  ProductCell.swift
//  MeliChallenge
//
//  Created by Santiago Goycoechea on 15/4/23.
//

import UIKit

class CountCell: UITableViewCell {

    @IBOutlet weak var countLabel: UILabel!
    
    func setupCell(count: Int) {
        self.isUserInteractionEnabled = false
        countLabel.text = String(count) + " productos"
    }
}
