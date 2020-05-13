//
//  User.swift
//
//  Created by Gonçalo Neves on 13/05/2020
//  Copyright (c) . All rights reserved.
//

import Foundation

class UserModel: Codable {

  enum CodingKeys: String, CodingKey {
    case name
    case roles
    case email
    case token
    case password
  }

  var name: String?
  var roles: [String]?
  var email: String?
  var token: String?
  var password: String?

  init (name: String?, roles: [String]?, email: String?, token: String?, password: String?) {
    self.name = name
    self.roles = roles
    self.email = email
    self.token = token
    self.password = password
  }

  required init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    name = try container.decodeIfPresent(String.self, forKey: .name)
    roles = try container.decodeIfPresent([String].self, forKey: .roles)
    email = try container.decodeIfPresent(String.self, forKey: .email)
    token = try container.decodeIfPresent(String.self, forKey: .token)
    password = try container.decodeIfPresent(String.self, forKey: .password)
  }

}
