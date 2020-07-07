//
//  EquipmentUtilizationPOST.swift
//
//  Created by Gonçalo Neves on 13/05/2020
//  Copyright (c) . All rights reserved.
//

import Foundation

class LogInPOSTModel: Codable {
    
    enum CodingKeys: String, CodingKey {
        case email = "Email"
        case password = "Password"
    }
    
    var email: String
    var password: String
    
    init (email: String, password: String) {
        
        self.email = email
        self.password = password
    }
    
    func convertToDictionary() -> [String : Any] {
        
        let dic: [String: Any] = [CodingKeys.email.stringValue : self.email, CodingKeys.password.stringValue : self.password]
        return dic
    }
}
