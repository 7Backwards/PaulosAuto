//
//  UserModel.swift
//
//  Created by Neves on 10/06/2020
//  Copyright (c) . All rights reserved.
//

import Foundation

class UserModel: Codable {

  enum CodingKeys: String, CodingKey {
    case equipamentos
    case roles
    case name
    case email
    case token
  }

  var equipamentos: [String]?
  var roles: [String]?
  var name: String?
  var email: String?
  var token: String?

  init (equipamentos: [String]?, roles: [String]?, name: String?, email: String?, token: String?) {
    self.equipamentos = equipamentos
    self.roles = roles
    self.name = name
    self.email = email
    self.token = token
  }

  required init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    equipamentos = try container.decodeIfPresent([String].self, forKey: .equipamentos)
    roles = try container.decodeIfPresent([String].self, forKey: .roles)
    name = try container.decodeIfPresent(String.self, forKey: .name)
    email = try container.decodeIfPresent(String.self, forKey: .email)
    token = try container.decodeIfPresent(String.self, forKey: .token)
  }

}
