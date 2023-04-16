//
//  ProductRouter.swift
//  MeliChallenge
//
//  Created by Santiago Goycoechea on 15/4/23.
//

import Foundation
import Alamofire

public enum ProductRouter {
    case search(query: String)
    case getProduct(id: String)
    
    var method: HTTPMethod {
        switch self {
        case .search, .getProduct:
            return .get
        }
    }
    
    var path: String {
        switch self {
        case .search:
            return "search"
        case .getProduct:
            return "items"
        }
    }
    
    var parameters: [String: Any]? {
        switch self {
        case .search(let query):
            return ["q": query]
        case .getProduct(let id):
            return ["ids": id]
        }
    }
    
    var useSiteId: Bool {
        switch self {
        case .search:
            return true
        case .getProduct:
            return false
        }
    }
    
    public func obtainRequest() -> DataRequest {
        return RequestFactory.generateRequest(path: path, httpMethod: method, body: parameters, useSiteId: useSiteId, contentType: "application/json")
    }
}
