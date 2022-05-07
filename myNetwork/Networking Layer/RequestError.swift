//
//  RequestError.swift
//  myNetwork
//
//  Created by mac on 07.05.2022.
//

import Foundation

//Модели для ошибок запроса

enum RequestError: Error {
    case decode
    case invalidURL
    case noResponse
    case unauthorized
    case unexpectedStatusCode
    case unknown
    
    var customMessage: String {
        switch self {
        case .decode:
            return "Decode error"
        case .unauthorized:
            return "Session expired"
        default:
            return "Unknown error"
        }
    }
}
