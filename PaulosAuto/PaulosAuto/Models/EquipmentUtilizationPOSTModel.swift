//
//  EquipmentUtilizationPOST.swift
//
//  Created by Gonçalo Neves on 01/05/2020
//  Copyright (c) . All rights reserved.
//

import Foundation

class EquipmentUtilizationPOSTModel: Codable {
    
    enum CodingKeys: String, CodingKey {
        case horasAtuais = "horasAtuais"
        case serialNumber = "serialNumber"
    }
    
    var horasAtuais: Int
    var serialNumber: String
    
    init (horasAtuais: Int, serialNumber: String) {
        self.horasAtuais = horasAtuais
        self.serialNumber = serialNumber
    }
    
    func convertToDictionary() -> [String : Any] {
        let dic: [String: Any] = [CodingKeys.horasAtuais.stringValue : self.horasAtuais, CodingKeys.serialNumber.stringValue : self.serialNumber]
        return dic
    }
}
