//
//  EquipmentHistoryModel.swift
//
//  Created by Gonçalo Neves on 25/04/2020
//  Copyright (c) . All rights reserved.
//

import Foundation

class EquipmentHistoryModel: Codable {
    
    enum CodingKeys: String, CodingKey {
        
        case intervencoes = "intervencoes"
        case descricaoIntervencao = "descricaoIntervencao"
        case finalizada = "finalizada"
    }
    
    var intervencoes: [InterventionsModel]?
    var descricaoIntervencao: [String]?
    var finalizada: Bool?
    
    init (intervencoes: [InterventionsModel]?, descricaoIntervencao: [String]?, finalizada: Bool?) {
      self.intervencoes = intervencoes
      self.descricaoIntervencao = descricaoIntervencao
      self.finalizada = finalizada
    }
    
    required init(from decoder: Decoder) throws {
      let container = try decoder.container(keyedBy: CodingKeys.self)
      intervencoes = try container.decodeIfPresent([InterventionsModel].self, forKey: .intervencoes)
      descricaoIntervencao = try container.decodeIfPresent([String].self, forKey: .descricaoIntervencao)
      finalizada = try container.decodeIfPresent(Bool.self, forKey: .finalizada)
    }
    
}
