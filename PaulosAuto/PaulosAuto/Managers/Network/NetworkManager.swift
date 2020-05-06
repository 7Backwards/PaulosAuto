//
//  ClientNetworking.swift
//  PaulosAuto
//
//  Created by Gonçalo Neves on 20/04/2020.
//  Copyright © 2020 Gonçalo Neves. All rights reserved.
//

import Foundation
import UIKit


class NetworkManager: NSObject {
    
    
    // MARK: - Singleton
    
    
    let sharedInstance = NetworkManager()
    
    private override init() {
        
        super.init()
    }
    
    class func fetchAPIData<T: Codable>( url: URL,
                                         method: String? = nil,
                                         params: [String: Any]? = nil,
                                         headers: String? = nil,
                                         completion: @escaping ((Result<T, Error>) -> ())) {
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = method
        urlRequest.setValue("Application/json", forHTTPHeaderField: "Content-Type")
        if let params = params {
            
            guard let httpBody =
                try? JSONSerialization.data(withJSONObject: params, options: [])
                else {
                    
                    return
            }
            urlRequest.httpBody = httpBody
        }
        urlRequest.timeoutInterval = 20
        let session = URLSession(configuration: .default)
        let dataTask = session.dataTask(with: urlRequest) { data, response, error in
            
            guard error == nil else {
                
                completion(.failure(error!))
                return
            }
            guard response != nil else {
                
                return
            }
            guard let data = data else {
                
                return
            }
            DispatchQueue.main.async {

                let response = try! JSONDecoder().decode(T.self, from: data)
                completion(.success(response))
            }
        }
        dataTask.resume()
    }
}



