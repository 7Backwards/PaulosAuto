//
//  RQ_ListEquipments.swift
//  PaulosAuto
//
//  Created by Gonçalo Neves on 21/04/2020.
//  Copyright © 2020 Gonçalo Neves. All rights reserved.
//

import Foundation

class RQ_ListEquipments {
    
    
    // MARK: - Public
    
    
    func repos(username: Int, _ completion: @escaping ([EquipmentModel]?, Error?) -> Void ) {
        
        let request = URLRequest(url: (ApiConstants.listEquipmentURL?.appendingPathComponent(String(username)))!)
        let url = request.url
        

        NetworkManager.fetchAPIData(url: url!) { (result: Result<[EquipmentModel], Error>) in
            switch result {
                
            case .success(let data):
                completion(data,nil)

                
            case .failure(let error):
                completion(nil,error)

                
            }
        }
    }
}
