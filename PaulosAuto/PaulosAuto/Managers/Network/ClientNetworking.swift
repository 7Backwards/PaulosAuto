//
//  ClientNetworking.swift
//  PaulosAuto
//
//  Created by Gonçalo Neves on 20/04/2020.
//  Copyright © 2020 Gonçalo Neves. All rights reserved.
//

import Foundation
import UIKit

class ClientNetworking {
    
    typealias WebServiceResponse = ([String: Any]?, Error?) -> Void
    typealias fetchAPIDataSuccessResponse = (Equipment?) -> Void
    typealias fetchAPIDataFailureResponse = (Error?) -> Void
    
    func fetchAPIData(_ url: URL,_ successBlock : @escaping fetchAPIDataSuccessResponse,_ failureBlock: @escaping fetchAPIDataFailureResponse) {
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let data = data {
                
                do {
                    
                    let estruturaData = try JSONDecoder().decode(Equipment.self, from: data)
                    successBlock(estruturaData)
                }catch {
                    
                    failureBlock(error)
                }
            }
        }.resume()
    }
}
