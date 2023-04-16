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
        var request = try! URLRequest(url: "https://" + Constants.Networking.serverIp + "/" + path, method: httpMethod)
        if let body = body {
            request.httpBody = try? JSONSerialization.data(withJSONObject: body)
        }
        return request
    }
    
    // MARK: - Public Methods
    
    public static func generateRequest(path: String, httpMethod: HTTPMethod, body: [String: Any]?, useSiteId: Bool, contentType: String) -> DataRequest {
        var domain = "https://" + Constants.Networking.serverIp
        if useSiteId {
            domain += "/sites/" + Constants.Networking.siteId
        }
        
        guard httpMethod != .get || body == nil else {
            // Alamofire doesn't allow GET requests with body
            return AF.request(domain + "/" + path,
                              method: httpMethod,
                              parameters: body,
                              encoding: URLEncoding())
        }
        
        let urlRequest = generateURLRequest(path: domain + "/" + path, httpMethod: httpMethod, body: body, contentType: contentType)
        
        return AF.request(urlRequest)
    }
}
