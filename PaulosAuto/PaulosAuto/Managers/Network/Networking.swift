//
//  ClientNetworking.swift
//  PaulosAuto
//
//  Created by Gonçalo Neves on 20/04/2020.
//  Copyright © 2020 Gonçalo Neves. All rights reserved.
//

import Foundation
import UIKit


class Networking: NSObject {
    
    
    // MARK: - Singleton
    

    let sharedInstance = Networking()
    
    private override init() {
        
        super.init()
    }
    
    class func fetchAPIData<T: Codable>( url: URL,
                                         method: String? = nil,
                                         params: String? = nil,
                                         headers: String? = nil,
                                         completion: @escaping (Result<[T], Error>) -> ()) {
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = method
        
        let session = URLSession(configuration: .default)
        let dataTask = session.dataTask(with: urlRequest) { data, response, error in
            
            guard error == nil else {
                completion(.failure(error!))
                print(error?.localizedDescription)
                return
            }
            guard response != nil else {
                return
            }
            guard let data = data else {
                return
            }
            let responseObject = try! JSONDecoder().decode([T].self, from: data)

            DispatchQueue.main.async {
                
                completion(.success(responseObject))

            }
        }
        dataTask.resume()
    }
}



