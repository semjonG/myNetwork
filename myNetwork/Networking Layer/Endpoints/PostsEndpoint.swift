//
//  PostsEndpoint.swift
//  myNetwork
//
//  Created by mac on 07.05.2022.
//

import Foundation

//struct Post: Decodable {
//    var userId: Int
//    var id: Int
//    var title: String
//    var body: String
//}

enum PostsEndpoint {
    case retrieve
    case createPost(_ post: Post)
//    case updatePost(_ post: Post)
//    case updatePostTitle(_ title: String)
}

extension PostsEndpoint: Endpoint {
    
    var path: String {
        switch self {
        case .retrieve, .createPost:
            return "/posts"
        }
    }
       
    var method: RequestMethod {
        switch self {
            
        case .retrieve:
            return .get
        case .createPost:
            return .post
//        case .updatePost()
//            return .
//
//        case .topRated, .movieDetail:
//            return .get
        }
    }

    var header: [String: String]? {
        // Access Token to use in Bearer header
        let accessToken = "Your TMDB Access Token here!!!!!!!"
        switch self {
            
        default: return nil
        }
//        case .topRated, .movieDetail:
//            return [
//                "Authorization": "Bearer \(accessToken)",
//                "Content-Type": "application/json;charset=utf-8"
//            ]
//        }
    }

    var body: [String: String]? {
        switch self {
            
        default: return nil
            
//        case .retrieve, .createPost:
//            return nil
        }
    }
}

