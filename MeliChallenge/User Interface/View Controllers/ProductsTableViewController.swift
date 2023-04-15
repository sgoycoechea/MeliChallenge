//
//  ProductsTableViewController.swift
//  MeliChallenge
//
//  Created by Santiago Goycoechea on 15/4/23.
//

import UIKit

private struct CellKeys {
    static let productCell = "productCell"
    static let countCell = "countCell"
}

class ProductsTableViewController: UITableViewController {

    var products: [Product]!
    var totalProducts: Int!
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return section == 0 ? 1 : products.count
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return indexPath.section == 0 ? 40 : 144
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.section == 0 {
            guard let countCell = tableView.dequeueReusableCell(withIdentifier: CellKeys.countCell, for: indexPath) as? CountCell else {
                fatalError(Constants.Errors.cellError + CellKeys.countCell)
            }

            countCell.setupCell(count: totalProducts)
            return countCell
        } else {
            guard let productCell = tableView.dequeueReusableCell(withIdentifier: CellKeys.productCell, for: indexPath) as? ProductCell else {
                fatalError(Constants.Errors.cellError + CellKeys.productCell)
            }

            productCell.setupCell(product: products[indexPath.row])
            return productCell
        }
    }
    
    
    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
    }
    
}
