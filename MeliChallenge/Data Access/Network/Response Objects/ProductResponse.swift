//
//  ProductResponse.swift
//  MeliChallenge
//
//  Created by Santiago Goycoechea on 16/4/23.
//

import Foundation

struct ProductResponse: Codable {
    let code: Int
    let product: Product?
    
    enum CodingKeys: String, CodingKey {
        case code = "code"
        case product = "body"
    }
}
