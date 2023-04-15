//
//  Constants.swift
//  MeliChallenge
//
//  Created by Santiago Goycoechea on 15/4/23.
//

import Foundation

class Constants {
    
    struct Networking {
        static let serverIp: String = "api.mercadolibre.com"
        static let siteId: String = "MLA"
    }
    
    struct Segues {
        static let showProductList = "showProductList"
    }
    
    struct Errors {
        static let serverError: String = "Error"
        static let unknownError: String = "Un error inesperado ha ocurrido"
        static let cellError: String = "Identificador de celda incorrecto"
    }
    
}
