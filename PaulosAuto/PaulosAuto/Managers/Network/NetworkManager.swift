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
    
    
    // MARK: - Constants
    
    
    let sharedInstance = NetworkManager()
    
    
    // MARK: - Override inherited functions
    
    
    private override init() {
        
        super.init()
    }
    
    
    // MARK: - Public
    
    class func fetchAPIData<T: Codable>( url: URL,
                                         method: String? = nil,
                                         params: [String: Any]? = nil,
                                         multipartParams: Data? = nil,
                                         headers: String? = nil,
                                         accessToken: String? = nil,
                                         completion: @escaping ((Result<T, Error>) -> ())) {
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = method
        let session = URLSession(configuration: .default)
        
        
        if accessToken != nil {
            
            urlRequest.addValue("Bearer \(String(accessToken!))", forHTTPHeaderField: "Authorization")
        }
        
        if headers == "multipart/form-data" {
            
            urlRequest.setValue("multipart/form-data; boundary=\(ApiConstants.boundary)", forHTTPHeaderField: "content-type")
            urlRequest.httpBody = multipartParams
            urlRequest.setValue("\(multipartParams?.count ?? 0)", forHTTPHeaderField: "Content-Length")

//            session.uploadTask(with: urlRequest, from: multipartParams, completionHandler: { responseData, response, error in
//                if error == nil {
//                    let jsonData = try? JSONSerialization.jsonObject(with: responseData!, options: .allowFragments)
//                    if let json = jsonData as? [String: Any] {
//                        print(json)
//                    }
//                }
//                else {
//                    print("erro")
//                }
//            }).resume()
//
//            return
        }
        else {
            
            urlRequest.setValue(headers, forHTTPHeaderField: "Content-Type")
        }
        if let params = params  {
            
            
            guard let httpBody =
                try? JSONSerialization.data(withJSONObject: params, options: [])
                else {
                    
                    return
            }
            urlRequest.httpBody = httpBody
        }
        
        urlRequest.timeoutInterval = 20
        
        let dataTask = session.dataTask(with: urlRequest) { data, response, error in
            
            guard error == nil else {
                
                completion(.failure(APPError.networkError(error!)))
                return
            }
            guard response != nil else {
                
                return
            }
            
            if let data = data, let httpResponse = response as? HTTPURLResponse {
                
                switch httpResponse.statusCode {
                    
                case 200:
                    DispatchQueue.main.async {
                        
                        let response = try! JSONDecoder().decode(T.self, from: data)
                        completion(.success(response))
                    }
                    
                    
                case 413:
                    completion(.failure(APPError.requestEntityTooLarge))
                
                    
                case 401:
                    completion(.failure(APPError.unauthorized))
                
                case 403:
                    completion(.failure(APPError.forbidden))
                    
                case 500:
                    completion(.failure(APPError.dataNotFound))
                    
                    
                default:
                    
                    break
                }
            }
        }
        dataTask.resume()
    }
}



