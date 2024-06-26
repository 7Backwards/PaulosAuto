//
//  RQ_TokenAuthentication.swift
//  PaulosAuto
//
//  Created by Gonçalo Neves on 21/04/2020.
//  Copyright © 2020 Gonçalo Neves. All rights reserved.
//

import Foundation

class RQ_TokenAuthentication {
    
    
    // MARK: - Public
    
    
    func repos( _ completion: @escaping (TokenResponseModel?, Error?) -> Void ) {
        
        
        let request = URLRequest(url: (ApiConstants.testTokenURL)!)
        let url = request.url
        
        if let data = UserDefaults.standard.value(forKey:"user") as? Data {
            
            let user = try? PropertyListDecoder().decode(UserModel.self, from: data)
        
            if let accessToken = user?.token {
                
                NetworkManager.fetchAPIData(url: url!,
                                            method: "GET",
                                            params: nil,
                                            multipartParams: nil,
                                            headers: nil,
                                            accessToken: accessToken) { (result: Result<TokenResponseModel, Error>) in
                    switch result {

                    case .success(let data):
                        completion(data,nil)

                        
                    case .failure(let error):
                        completion(nil,error)

                        
                    }
                }
            }
        }
    }

}
