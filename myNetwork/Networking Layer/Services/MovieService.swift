//
//  MovieService.swift
//  myNetwork
//
//  Created by mac on 07.05.2022.
//

import Foundation

//Интерфейсы - сервиса Movie
//Сервис - это объект с бизнес-логика (Запросы на Movies)

protocol MoviesServiceable {
    func getTopRated() async -> Result<TopRated, RequestError>
    func getMovieDetail(id: Int) async -> Result<Movie, RequestError>
}

//Реализация сервиса
struct MoviesService: HTTPClient, MoviesServiceable {
    
    func getTopRated() async -> Result<TopRated, RequestError> {
        return await sendRequest(endpoint: MoviesEndpoint.topRated, responseModel: TopRated.self)
    }
    
    func getMovieDetail(id: Int) async -> Result<Movie, RequestError> {
        return await sendRequest(endpoint: MoviesEndpoint.movieDetail(id: id), responseModel: Movie.self)
    }
}
