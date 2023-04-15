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
    
    var method: HTTPMethod {
        switch self {
        case .search:
            return .get
        }
    }
    
    var path: String {
        switch self {
        case .search:
            return "search"
        }
    }
    
    var parameters: [String: Any]? {
        switch self {
        case .search(let query):
            return ["q": query]
        }
    }
    
    public func obtainRequest() -> DataRequest {
        return RequestFactory.generateRequest(path: path, httpMethod: method, body: parameters, contentType: "application/json")
    }
}
