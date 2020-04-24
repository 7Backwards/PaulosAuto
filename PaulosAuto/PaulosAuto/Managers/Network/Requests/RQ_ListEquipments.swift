//
//  RQ_ListEquipments.swift
//  PaulosAuto
//
//  Created by Gonçalo Neves on 21/04/2020.
//  Copyright © 2020 Gonçalo Neves. All rights reserved.
//

import Foundation

class RQ_ListEquipments {
    
    
    func repos(username: Int, _ completion: @escaping ([EquipmentModel]?, Error?) -> Void ) {

        let request = URLRequest(url: ApiConstants.base.appendingPathComponent("equipamentos/1"))
        

        let url = request.url

        
        Networking.fetchAPIData(url: url!) { (result: Result<[EquipmentModel], Error>) in
            switch result {
                
            case .success(let dataEquipments):
                print(result)
                completion(dataEquipments,nil)

            case .failure(let error):
                print(result)
                completion(nil,error)

            }
        }
    }
}
