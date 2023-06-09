//
//  Product.swift
//  MeliChallenge
//
//  Created by Santiago Goycoechea on 15/4/23.
//

import Foundation

struct Product: Codable {
    let id: String
    let title: String?
    let condition: String?
    let thumbnail: String?
    let currencyId: String?
    let price: Float?
    let soldQuantity: Int?
    let pictures: [Picture]?
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case title = "title"
        case condition = "condition"
        case thumbnail = "thumbnail"
        case currencyId = "currency_id"
        case price = "price"
        case soldQuantity = "sold_quantity"
        case pictures = "pictures"
    }
}

struct Picture: Codable {
    let id: String
    let url: String?
    let secureUrl: String?
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case url = "url"
        case secureUrl = "secure_url"
    }
}
