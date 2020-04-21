//
//  EquipmentModel.swift
//
//  Created by Gonçalo Neves on 21/04/2020
//  Copyright (c) . All rights reserved.
//

import Foundation

class EquipmentModel: Codable {

  enum CodingKeys: String, CodingKey {
    
    case model
    case serialNumber
    case year
    case currentHours
    case smp
    case brand
    case plate
    case type
    case dateAssignment
    case dateStartASsignment
  }

  var model: String?
  var serialNumber: String?
  var year: Int?
  var currentHours: Int?
  var smp: Bool?
  var brand: String?
  var plate: String?
  var type: String?
  var dateAssignment: String?
  var dateStartASsignment: String?

  init (model: String?, serialNumber: String?, year: Int?, currentHours: Int?, smp: Bool?, brand: String?, plate: String?, type: String?, dateAssignment: String?, dateStartASsignment: String?) {
    
    self.model = model
    self.serialNumber = serialNumber
    self.year = year
    self.currentHours = currentHours
    self.smp = smp
    self.brand = brand
    self.plate = plate
    self.type = type
    self.dateAssignment = dateAssignment
    self.dateStartASsignment = dateStartASsignment
  }

  required init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    model = try container.decodeIfPresent(String.self, forKey: .model)
    serialNumber = try container.decodeIfPresent(String.self, forKey: .serialNumber)
    year = try container.decodeIfPresent(Int.self, forKey: .year)
    currentHours = try container.decodeIfPresent(Int.self, forKey: .currentHours)
    smp = try container.decodeIfPresent(Bool.self, forKey: .smp)
    brand = try container.decodeIfPresent(String.self, forKey: .brand)
    plate = try container.decodeIfPresent(String.self, forKey: .plate)
    type = try container.decodeIfPresent(String.self, forKey: .type)
    dateAssignment = try container.decodeIfPresent(String.self, forKey: .dateAssignment)
    dateStartASsignment = try container.decodeIfPresent(String.self, forKey: .dateStartASsignment)
  }

}
