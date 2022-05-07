//
//  PostsService.swift
//  myNetwork
//
//  Created by mac on 07.05.2022.
//

import Foundation

//Post -> Endpoint, Service
//Comment -> Endpoint, Service
//User -> Endpoint, Service


protocol PostsServiceable {
    func retrievePosts() async -> Result<[Post], RequestError>
    func createPost(post: Post) async -> Result<Post, RequestError>
}

//Реализация сервиса
struct PostsService: HTTPClient, PostsServiceable {

    func retrievePosts() async -> Result<[Post], RequestError> {
        return await sendRequest(endpoint: PostsEndpoint.retrieve, responseModel: [Post].self)
    }
    
    func createPost(post: Post) async -> Result<Post, RequestError> {
        
        //let post = Post(userId: 1, id: 1, title: "123", body: "123")
        
        return await sendRequest(endpoint: PostsEndpoint.createPost(post), responseModel: Post.self)
    }
}
