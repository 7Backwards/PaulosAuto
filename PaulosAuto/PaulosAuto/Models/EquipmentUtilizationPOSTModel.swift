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
        case email = "email"
    }
    
    var horasAtuais: Int
    var serialNumber: String
    var email: String
    
    init (horasAtuais: Int, serialNumber: String, email: String) {
        
        self.horasAtuais = horasAtuais
        self.serialNumber = serialNumber
        self.email = email
    }
    
    func convertToDictionary() -> [String : Any] {
        
        let dic: [String: Any] = [CodingKeys.horasAtuais.stringValue : self.horasAtuais, CodingKeys.serialNumber.stringValue : self.serialNumber, CodingKeys.email.stringValue : self.email]
        return dic
    }
}
