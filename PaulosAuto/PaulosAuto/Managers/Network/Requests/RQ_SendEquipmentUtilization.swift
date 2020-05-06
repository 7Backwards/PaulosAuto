//
//  RQ_SendEquipmentUtilization.swift
//  PaulosAuto
//
//  Created by Gonçalo Neves on 21/04/2020.
//  Copyright © 2020 Gonçalo Neves. All rights reserved.
//

import Foundation

class RQ_SendEquipmentUtilization {
    
    
    func repos(serialNumber: String, currentHours: Int, _ completion: @escaping (EquipmentModel?, Error?) -> Void ) {
        
        let request = URLRequest(url: (ApiConstants.sendEquipmentUtilization)!)
        let url = request.url
        let equipmentUtilization = EquipmentUtilizationPOST(horasAtuais: currentHours, serialNumber: String(serialNumber))
        let parameters = equipmentUtilization.convertToDictionary()
        
        
        Networking.fetchAPIData(url: url!, method: "POST", params: parameters, headers: nil) { (result: Result<EquipmentModel, Error>) in
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
