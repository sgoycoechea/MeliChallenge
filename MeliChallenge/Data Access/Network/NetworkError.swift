//
//  NetworkError.swift
//  MeliChallenge
//
//  Created by Santiago Goycoechea on 15/4/23.
//

import Foundation

enum StatusCode: Int {
    case parsingError = -1
    case ok = 200
    case created = 201
    case updateOk = 204
    case badRequest = 400
    case unauthorized = 401
    case forbidden = 403
    case notFound = 404
    case serviceUnavailable = 503
    case preconditionFailed = 412
    case unknown = 520
}

class NetworkError: NSError {
    var title: String = ""
    var message: String = ""
    
    init(error: NSError?) {
        super.init(domain: "", code: error?.code ?? StatusCode.unknown.rawValue, userInfo: [NSLocalizedDescriptionKey: error?.localizedDescription ?? Constants.unknownError])
        
        self.message = error?.localizedDescription ?? Constants.unknownError
        self.title = Constants.serverError
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
