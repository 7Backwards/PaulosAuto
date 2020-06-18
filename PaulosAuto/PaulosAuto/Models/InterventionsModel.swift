//
//  InterventionsModel.swift
//  PaulosAuto
//
//  Created by Neves on 18/06/2020.
//  Copyright © 2020 Gonçalo Neves. All rights reserved.
//

import UIKit

class InterventionsModel: Codable {
    
    enum CodingKeys: String, CodingKey {
        case dateIntervention = "data"
        case hours = "horas"
    }
    
    var dateIntervention: Date?
    var hours: Int?
    
    init (dateIntervention: String?, hours: Int?) {
        
        self.hours = hours
        if let date = dateIntervention {
            
            if let date = ApiConstants.dateFormatter.date(from: date) {
                
                self.dateIntervention = date
            }
        }
    }
    
    required convenience init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let dateInterventionString = try container.decodeIfPresent(String.self, forKey: .dateIntervention)
        let hours = try container.decodeIfPresent(Int.self, forKey: .hours)
        self.init(dateIntervention: dateInterventionString, hours: hours)
    }
    
}
