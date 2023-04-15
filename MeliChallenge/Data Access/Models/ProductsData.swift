//
//  ProductsData.swift
//  MeliChallenge
//
//  Created by Santiago Goycoechea on 15/4/23.
//

import Foundation

struct ProductsData: Codable {
    let products: [Product]
    let totalProducts: Int
}
