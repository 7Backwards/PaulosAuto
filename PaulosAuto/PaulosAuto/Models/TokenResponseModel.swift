//
//  TokenResponseModel.swift
//
//  Created by Neves on 27/05/2020
//  Copyright (c) . All rights reserved.
//

import Foundation

class TokenResponseModel: Codable {

  enum CodingKeys: String, CodingKey {
    case message
  }

  var message: String?

  init (message: String?) {
    self.message = message
  }

  required init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    message = try container.decodeIfPresent(String.self, forKey: .message)
  }

}
