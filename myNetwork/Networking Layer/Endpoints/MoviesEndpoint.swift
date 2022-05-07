//
//  MoviesEndpoint.swift
//  myNetwork
//
//  Created by mac on 07.05.2022.
//

import Foundation

enum MoviesEndpoint {
    case topRated
    case movieDetail(id: Int)
}

extension MoviesEndpoint: Endpoint {
    
    var path: String {
        switch self {
        case .topRated:
            return "movie/top_rated"
        case .movieDetail(let id):
            return "movie/\(id)"
        }
    }

    var method: RequestMethod {
        switch self {
        case .topRated, .movieDetail:
            return .get
        }
    }

    var header: [String: String]? {
        // Access Token to use in Bearer header
        let accessToken = "Your TMDB Access Token here!!!!!!!"
        switch self {
        case .topRated, .movieDetail:
            return [
                "Authorization": "Bearer \(accessToken)",
                "Content-Type": "application/json;charset=utf-8"
            ]
        }
    }

    var body: [String: String]? {
        switch self {
        case .topRated, .movieDetail:
            return nil
        }
    }
}

