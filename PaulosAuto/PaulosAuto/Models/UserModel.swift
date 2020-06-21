//
//  UserModel.swift
//
//  Created by Neves on 10/06/2020
//  Copyright (c) . All rights reserved.
//

import Foundation

class UserModel: Codable {

  enum CodingKeys: String, CodingKey {
    case equipments = "equipamentos"
    case roles = "roles"
    case name = "name"
    case email = "email"
    case token = "token"
    case num_client = "nuM_CLIENTE"
  }

  var equipments: [String]?
  var roles: [String]?
  var name: String?
  var email: String?
  var token: String?
  var num_client: Int?

    init (equipments: [String]?, roles: [String]?, name: String?, email: String?, token: String?, num_client: Int?) {
    self.equipments = equipments
    self.roles = roles
    self.name = name
    self.email = email
    self.token = token
    self.num_client = num_client
  }

  required init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    equipments = try container.decodeIfPresent([String].self, forKey: .equipments)
    roles = try container.decodeIfPresent([String].self, forKey: .roles)
    name = try container.decodeIfPresent(String.self, forKey: .name)
    email = try container.decodeIfPresent(String.self, forKey: .email)
    token = try container.decodeIfPresent(String.self, forKey: .token)
    num_client = try container.decodeIfPresent(Int.self, forKey: .num_client)
  }

}
