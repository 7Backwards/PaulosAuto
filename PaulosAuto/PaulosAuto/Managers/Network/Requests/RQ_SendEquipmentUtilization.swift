//
//  RQ_SendEquipmentUtilization.swift
//  PaulosAuto
//
//  Created by Gonçalo Neves on 21/04/2020.
//  Copyright © 2020 Gonçalo Neves. All rights reserved.
//

import Foundation

class RQ_SendEquipmentUtilization {
    
    
    func repos(serialNumber: String, _ completion: @escaping ([String]?, Error?) -> Void ) {
        
        let request = URLRequest(url: (ApiConstants.listEquipmentHistoryURL?.appendingPathComponent(serialNumber))!)
        let url = request.url
        
        Networking.fetchAPIData(url: url!) { (result: Result<[String], Error>) in
            switch result {
                
            case .success(let data):
                print(result)
                completion(data,nil)

            case .failure(let error):
                print(result)
                completion(nil,error)

            }
        }
    }
}
