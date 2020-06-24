//
//  SendReportProblemResponseModel.swift
//
//  Created by Neves on 23/06/2020
//  Copyright (c) . All rights reserved.
//

import Foundation

class SendReportProblemResponseModel: Codable {

  enum CodingKeys: String, CodingKey {
    case email = "email"
    case id = "id"
    case nuMSERIE = "nuM_SERIE"
    case nuMCLIENTE = "nuM_CLIENTE"
    case descricao = "descricao"
    case dataRegisto = "dataRegisto"
    case contACLIENTE = "contA_CLIENTE"
  }

  var email: String?
  var id: Int?
  var nuMSERIE: String?
  var nuMCLIENTE: Int?
  var descricao: String?
  var dataRegisto: String?
  var contACLIENTE: String?

  init (email: String?, id: Int?, nuMSERIE: String?, nuMCLIENTE: Int?, descricao: String?, dataRegisto: String?, contACLIENTE: String?) {
    self.email = email
    self.id = id
    self.nuMSERIE = nuMSERIE
    self.nuMCLIENTE = nuMCLIENTE
    self.descricao = descricao
    self.dataRegisto = dataRegisto
    self.contACLIENTE = contACLIENTE
  }

  required init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    email = try container.decodeIfPresent(String.self, forKey: .email)
    id = try container.decodeIfPresent(Int.self, forKey: .id)
    nuMSERIE = try container.decodeIfPresent(String.self, forKey: .nuMSERIE)
    nuMCLIENTE = try container.decodeIfPresent(Int.self, forKey: .nuMCLIENTE)
    descricao = try container.decodeIfPresent(String.self, forKey: .descricao)
    dataRegisto = try container.decodeIfPresent(String.self, forKey: .dataRegisto)
    contACLIENTE = try container.decodeIfPresent(String.self, forKey: .contACLIENTE)
  }

}
