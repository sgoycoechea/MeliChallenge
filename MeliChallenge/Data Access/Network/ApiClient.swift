//
//  ApiClient.swift
//  MeliChallenge
//
//  Created by Santiago Goycoechea on 15/4/23.
//

import Foundation
import Alamofire

class APIClient {

    // MARK: - Product Methods
    static func searchProducts(query: String, completion: @escaping (Result<[Product], NetworkError>) -> Void) {
        let concreteRequest = ProductRouter.search(query: query).obtainRequest()
        concreteRequest.responseDecodable { (response: AFDataResponse<QueryResponse<Product>>) in
            handleDecodableResponse(response: response) { result in
                switch result {
                case .success(let queryResponse):
                    completion(.success(queryResponse.results))
                case .failure(let error):
                    completion(.failure(error))
                }
            }
        }
    }
    
    // MARK: - Private methods
    static private func handleDecodableResponse<T: Codable>(response: AFDataResponse<T>, completion: @escaping (Result<T, NetworkError>) -> Void) {
        switch response.result {
        case .success(let decodable):
            completion(.success(decodable))
        case .failure(let error):
            completion(.failure(NetworkError(error: error as NSError)))
        }
    }
}
