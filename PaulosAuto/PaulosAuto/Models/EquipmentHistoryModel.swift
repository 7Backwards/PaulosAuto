//
//  EquipmentHistoryModel.swift
//
//  Created by Gonçalo Neves on 25/04/2020
//  Copyright (c) . All rights reserved.
//

import Foundation

class EquipmentHistoryModel: Codable {

  enum CodingKeys: String, CodingKey {
    
    case description = "descricaoIntervencao"
    case endedState = "finalizada"
    case date = "dataIntervencao"
  }

  var description: String?
  var endedState: Bool?
  var date: Date?

  init (description: String?, endedState: Bool?, date: String?) {
    
    self.description = description
    self.endedState = endedState
    
    if let date = date {
        
        if let date = ApiConstants.dateFormatter.date(from: date) {
            
            self.date = date
        }
    }
  }

  required convenience init(from decoder: Decoder) throws {
    
    let container = try decoder.container(keyedBy: CodingKeys.self)
    let description = try container.decodeIfPresent(String.self, forKey: .description)
    let endedState = try container.decodeIfPresent(Bool.self, forKey: .endedState)
    let dateString = try container.decodeIfPresent(String.self, forKey: .date)
    
    self.init(description: description, endedState: endedState, date: dateString)
  }

}
