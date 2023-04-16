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
    static func searchProducts(query: String, completion: @escaping (Result<ProductsData, NetworkError>) -> Void) {
        let concreteRequest = ProductRouter.search(query: query).obtainRequest()
        concreteRequest.responseDecodable { (response: AFDataResponse<SearchResponse>) in
            handleDecodableResponse(response: response) { result in
                switch result {
                case .success(let queryResponse):
                    completion(.success(ProductsData(products: queryResponse.results, totalProducts: queryResponse.paging.total)))
                case .failure(let error):
                    completion(.failure(error))
                }
            }
        }
    }
    
    static func getProduct(with id: String, completion: @escaping (Result<Product, NetworkError>) -> Void) {
        let concreteRequest = ProductRouter.getProduct(id: id).obtainRequest()
        concreteRequest.responseDecodable { (response: AFDataResponse<[ProductResponse]>) in
            handleDecodableResponse(response: response) { result in
                switch result {
                case .success(let queryResponse):
                    guard queryResponse.count == 1,
                          queryResponse[0].code == StatusCode.ok.rawValue,
                    let product = queryResponse[0].product else {
                        completion(.failure(NetworkError(error: StatusCode(rawValue: queryResponse[0].code) ?? StatusCode.unknown)))
                        return
                    }
                    completion(.success(product))
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
