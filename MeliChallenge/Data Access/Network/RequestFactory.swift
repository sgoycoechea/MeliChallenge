//
//  RequestFactory.swift
//  MeliChallenge
//
//  Created by Santiago Goycoechea on 15/4/23.
//

import Foundation
import Alamofire

class RequestFactory: NSObject {
    
    // MARK: - Private Methods
    
    private static func generateURLRequest(path: String, httpMethod: HTTPMethod, body: [String: Any]?, contentType: String) -> URLRequest {
        var request = try! URLRequest(url: "https://" + Constants.serverIp + "/" + path, method: httpMethod)
        if let body = body {
            request.httpBody = try? JSONSerialization.data(withJSONObject: body)
        }
        return request
    }
    
    // MARK: - Public Methods
    
    public static func generateRequest(path: String, httpMethod: HTTPMethod, body: [String: Any]?, contentType: String) -> DataRequest {
        guard httpMethod != .get || body == nil else {
            // Alamofire doesn't allow GET requests with body
            return AF.request("https://" + Constants.serverIp + "/sites/" + Constants.siteId + "/" + path,
                              method: httpMethod,
                              parameters: body,
                              encoding: URLEncoding())
    }
        
        let urlRequest = generateURLRequest(path: path, httpMethod: httpMethod, body: body, contentType: contentType)
        
        return AF.request(urlRequest)
    }
}
