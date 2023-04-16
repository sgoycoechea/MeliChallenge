//
//  ProductsTableViewController.swift
//  MeliChallenge
//
//  Created by Santiago Goycoechea on 15/4/23.
//

import UIKit
import SVProgressHUD

private struct CellKeys {
    static let productCell = "productCell"
    static let countCell = "countCell"
}

class ProductsTableViewController: UITableViewController {

    var products: [Product]!
    var totalProducts: Int!
    var selectedProduct: Product?
    
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
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard indexPath.section == 1 else { return }
        getProductAndShowDetails(id: products[indexPath.row].id)
    }
    
    // MARK: - Private methods
    
    private func getProductAndShowDetails(id: String) {
        SVProgressHUD.show()
        ProductManager.getProduct(with: id) { result in
            SVProgressHUD.dismiss()
            switch result {
            case .success(let product):
                self.selectedProduct = product
                self.performSegue(withIdentifier: Constants.Segues.showProduct, sender: self.tableView)
            case .failure:
                self.showMessage(title: Constants.Errors.error, message: Constants.Errors.unexpectedError)
            }
        }
    }
    
    
    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        if segue.identifier == Constants.Segues.showProduct {
            let productViewController = segue.destination as! ProductViewController
            productViewController.product = selectedProduct
        }
    }
    
}
