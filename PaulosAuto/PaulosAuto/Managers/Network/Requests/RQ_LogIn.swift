//
//  RQ_LogIn.swift
//  PaulosAuto
//
//  Created by Gonçalo Neves on 13/05/2020.
//  Copyright © 2020 Gonçalo Neves. All rights reserved.
//

import Foundation

class RQ_LogIn {
    
    
    // MARK: - Public
    
    
    func repos(email: String, password: String, _ completion: @escaping (UserModel?, Error?) -> Void ) {
        
        let request = URLRequest(url: ((ApiConstants.loginURL)!))
        let url = request.url
        let logInPOST = LogInPOSTModel(email: email, password: password)
        let parameters = logInPOST.convertToDictionary()
        let headers = "application/json"
        
        NetworkManager.fetchAPIData(url: url!,
                                    method: "POST",
                                    params: parameters,
                                    headers: headers) {
                                    (result: Result<UserModel, Error>) in
            switch result {

                case .success(let data):
                    completion(data,nil)

                
                case .failure(let error):
                    completion(nil,error)

                
           }
        }
    }
}
