//
//  ProductManager.swift
//  MeliChallenge
//
//  Created by Santiago Goycoechea on 15/4/23.
//

import Foundation

class ProductManager {
    static func search(query: String, completion: @escaping (Result<ProductsData, NetworkError>) -> Void) {
        APIClient.searchProducts(query: query, completion: completion)
    }
    
    static func getProduct(with id: String, completion: @escaping (Result<Product, NetworkError>) -> Void) {
        APIClient.getProduct(with: id, completion: completion)
    }
}
