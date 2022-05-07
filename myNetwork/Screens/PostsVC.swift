//
//  PostsVCViewController.swift
//  myNetwork
//
//  Created by mac on 07.05.2022.
//

import UIKit

class PostsVC: UIViewController {
    
    // MARK: Properties
    
    //private set - закрыта запись, internal get - открыто считывание
    private(set) var posts: [Post] = []
    private let service: PostsServiceable
    
    
    
    init(service: PostsServiceable) {
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
            case .success(let posts):
                self.posts = posts
                
                print(self.posts)
                
            case .failure(let error):
                print(error)
            }
        }
        
        // Do any additional setup after loading the view.
    }
    
    private func fetchData(completion: @escaping (Result<[Post], RequestError>) -> Void) {
        Task(priority: .background) {
            let result = await service.retrievePosts()
            completion(result)
        }
    }
    
    
    
    
}

