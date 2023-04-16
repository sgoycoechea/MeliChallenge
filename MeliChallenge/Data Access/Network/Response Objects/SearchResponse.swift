//
//  QueryResponse.swift
//  MeliChallenge
//
//  Created by Santiago Goycoechea on 15/4/23.
//

import Foundation

struct SearchResponse: Codable {
    let siteId: String
    let results: [Product]
    let paging: PagingData
    
    enum CodingKeys: String, CodingKey {
        case siteId = "site_id"
        case results = "results"
        case paging = "paging"
    }
}

struct PagingData: Codable {
    let total: Int
    let offset: Int
    let limit: Int
    let primaryResults: Int?
    
    enum CodingKeys: String, CodingKey {
        case total = "total"
        case offset = "offset"
        case limit = "limit"
        case primaryResults = "primary_results"
    }
}
