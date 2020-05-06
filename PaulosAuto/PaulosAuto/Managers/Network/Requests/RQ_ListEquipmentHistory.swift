//
//  RQ_ListEquipmentHistory.swift
//  PaulosAuto
//
//  Created by Gonçalo Neves on 21/04/2020.
//  Copyright © 2020 Gonçalo Neves. All rights reserved.
//

import Foundation

class RQ_ListEquipmentHistory {
    
    
    func repos(serialNumber: String, _ completion: @escaping ([EquipmentHistoryModel]?, Error?) -> Void ) {
        
        let request = URLRequest(url: (ApiConstants.listEquipmentHistoryURL?.appendingPathComponent(serialNumber))!)
        let url = request.url
        
        NetworkManager.fetchAPIData(url: url!) { (result: Result<[EquipmentHistoryModel], Error>) in
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
