//
//  Endpoint.swift
//  myNetwork
//
//  Created by mac on 07.05.2022.
//

import Foundation

//Интерфейс для HTTP запроса ()
protocol Endpoint {
    //Строковая URL
    var baseURL: String { get }
    var path: String { get }
    var method: RequestMethod { get }
    //Хедер
    var header: [String: String]? { get }
    //Боди
    var body: [String: String]? { get }
}

extension Endpoint {
    var baseURL: String {
        return "https://jsonplaceholder.typicode.com"
    }
}

enum RequestMethod: String {
    case delete = "DELETE"
    case get = "GET"
    case patch = "PATCH"
    case post = "POST"
    case put = "PUT"
}
