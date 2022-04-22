//
//  ViewController.swift
//  TestNetworkRequest
//
//  Created by mac on 20.04.2022.
//

import UIKit

class ViewController: UIViewController {
    
    let postService = PostService()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
//        postService.getData(userId: 1234) { posts in
//            print(type(of: posts))
//            print(posts)
//        }
        
        //postService.postData()
        //postService.putData()
        //postService.patchData()
        //postService.deleteData()
    }
}

struct Post: Decodable {
    var userId: Int
    var id: Int
    var title: String
    var body: String
}

// https://jsonplaceholder.typicode.com/posts?userId=1

class PostService {
    let baseURL = "https://jsonplaceholder.typicode.com"
    let path = "/posts"
    let parameter = "?userId=1"
    let numberOfPost = "/1"
    
    // MARK: GET method
    func getData(userId: Int, completion: @escaping ([Post]) -> ()) {
        
        let endpointURL = "\(baseURL)\(path)\(parameter)"
        
        guard let url = URL(string: endpointURL) else { return }
        
        print(type(of: url))
        
        var urlRequest = URLRequest(url: url)
        
        urlRequest.httpMethod = "GET"
        
        URLSession.shared.dataTask(with: urlRequest) { data, response, error in
            
            guard let data = data, error == nil else { return }
            
            let decoder = JSONDecoder()
            let posts = try? decoder.decode(Array<Post>.self, from: data)
            //            decoder.decode([Post].self, from: data)
            
            print(type(of: posts))
            
            completion(posts ?? [])
            
        }.resume()
    }
    
// MARK: POST method
    func postData() {
        
        // 1. инициализируем сессию
        let session = URLSession(configuration: .default)
        
        // 2. собираем URL
        let endpointURL = "\(baseURL)\(path)"
        guard let url = URL(string: endpointURL) else { return }
        
        // 3. создаем URLRequest (тут информация о запросе)
        var request = URLRequest(url: url)
        
        // хэдеры (1.нужен ли " charset=utf-8"? результат такой же и без него;
        //         2. setValue/addValue)
        request.addValue("application/json; charset=utf-8", forHTTPHeaderField: "Content-Type")
        // тип метода
        request.httpMethod = "POST"
        // передаем параметры в тело
        let parameters = ["title": "foo",
                          "body": "bar",
                          "userId": 1] as [String : Any]
        // не понял, что представляют options и почему это массив?
        guard let httpBody = try? JSONSerialization.data(withJSONObject: parameters, options: []) else { return }
        request.httpBody = httpBody
        
        // 4. выполняем URLRequest с помощью dataTask
        let task = session.dataTask(with: request) { data, response, error in
            
            guard let data = data, error == nil else { return }
            
            do {
                let json = try JSONSerialization.jsonObject(with: data, options: [])
                print(json)
            } catch {
                print(error.localizedDescription)
            }
        }
        task.resume()
    }
    
    // MARK: PUT method
    func putData() {
        
        // 1.
        let session = URLSession(configuration: .default)
        
        // 2.
        let endpointURL = "\(baseURL)\(path)\(numberOfPost)"
        guard let url = URL(string: endpointURL) else { return }
        
        // 3.
        var request = URLRequest(url: url)
        
        request.setValue("application/json; charset=utf-8", forHTTPHeaderField: "Content-Type")
        
        request.httpMethod = "PUT"
        
        let parameters = ["id": 1,
                          "title": "foo",
                          "body": "bar",
                          "userId": 1] as [String : Any]
        guard let httpBody = try? JSONSerialization.data(withJSONObject: parameters, options: []) else { return }
        request.httpBody = httpBody
        
        // 4.
        let task = session.dataTask(with: request) { data, response, error in
            
            guard let data = data, error == nil else { return }
            
            do {
                let json = try JSONSerialization.jsonObject(with: data, options: [])
                print(json)
            } catch {
                print(error.localizedDescription)
            }
        }
        task.resume()
    }
    
    // MARK: PATCH method
    func patchData() {
        
        // 1.
        let session = URLSession(configuration: .default)
        
        // 2.
        let endpointURL = "\(baseURL)\(path)\(numberOfPost)"
        guard let url = URL(string: endpointURL) else { return }
        
        // 3.
        var request = URLRequest(url: url)
        
        request.setValue("application/json; charset=utf-8", forHTTPHeaderField: "Content-Type")
       
        request.httpMethod = "PATCH"
    
        let parameters = ["title": "foo"]
        guard let httpBody = try? JSONSerialization.data(withJSONObject: parameters, options: []) else { return }
        request.httpBody = httpBody
        
        // 4.
        let task = session.dataTask(with: request) { data, response, error in
            
            guard let data = data, error == nil else { return }
            
            do {
                let json = try JSONSerialization.jsonObject(with: data, options: [])
                print(json)
            } catch {
                print(error.localizedDescription)
            }
        }
        task.resume()
    }
    
    // MARK: DELETE method
    func deleteData() {
        
        // 1.
        let session = URLSession(configuration: .default)
        
        // 2.
        let endpointURL = "\(baseURL)\(path)\(numberOfPost)"
        guard let url = URL(string: endpointURL) else { return }
        
        // 3.
        var request = URLRequest(url: url)
       
        request.httpMethod = "DELETE"
        
        // 4.
        let task = session.dataTask(with: request) { data, response, error in
            
            guard let data = data, error == nil else { return }
            
            do {
                let json = try JSONSerialization.jsonObject(with: data, options: [])
                print(json)
            } catch {
                print(error.localizedDescription)
            }
        }
        task.resume()
    }
}


