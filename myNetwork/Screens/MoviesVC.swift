//
//  MoviesVC.swift
//  myNetwork
//
//  Created by mac on 07.05.2022.
//

import UIKit

final class MoviesVC: UIViewController {
    
    // MARK: Properties
        
        //private set - закрыта запись, internal get - открыто считывание
        private(set) var movies: [Movie] = []
        private let service: MoviesServiceable
    

    
    init(service: MoviesServiceable) {
        self.service = service
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        fetchData { [weak self] result in
                    guard let self = self else { return }
                    switch result {
                    case .success(let response):
                        self.movies = response.results

                        print(self.movies)
                        
                    case .failure(let error):
                        print(error)
                    }
                }
       
    }
    
    
    private func fetchData(completion: @escaping (Result<TopRated, RequestError>) -> Void) {
        Task(priority: .background) {
            let result = await service.getTopRated()
            completion(result)
        }
    }
    
    
    
    
    
    
}

