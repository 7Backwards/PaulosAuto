//
//  EquipmentModel.swift
//
//  Created by Gonçalo Neves on 21/04/2020
//  Copyright (c) . All rights reserved.
//

import Foundation

class EquipmentModel: Codable {
    
    func isValid() -> Bool {
        return true
    }
    

  enum CodingKeys: String, CodingKey {
    
    case model = "model"
    case serialNumber = "serialNumber"
    case year = "year"
    case currentHours = "currentHours"
    case smp = "smp"
    case brand = "brand"
    case plate = "plate"
    case type = "type"
    case dateAssignment = "dateAssignment"
    case dateStartAssignment = "dateStartASsignment"
    case image = "image"
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
  var dateStartAssignment: String?
  var dateEndAssignment: String?
  var image: String?

    init (model: String?, serialNumber: String?, year: Int?, currentHours: Int?, smp: Bool?, brand: String?, plate: String?, type: String?, dateAssignment: String, dateStartAssignment: String,image: String?) {
    
    self.model = model
    self.serialNumber = serialNumber
    self.year = year
    self.currentHours = currentHours
    self.smp = smp
    self.brand = brand
    self.plate = plate
    self.type = type
        self.dateAssignment = dateAssignment
        self.dateStartAssignment = dateStartAssignment
    self.image = image
        
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "dd/MM/yyyy"
    
//    if let date = dateFormatter.date(from: dateAssignment) {
//
//        self.dateAssignment = date
//    }
//
//    if let date = dateFormatter.date(from: dateStartAssignment) {
//
//        self.dateStartAssignment = date
//    }
//
//        if let date = dateFormatter.date(from:  "01/01/2100") {
//
//        self.dateEndAssignment = date
//    }
    
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
    dateStartAssignment = try container.decodeIfPresent(String.self, forKey: .dateStartAssignment)
    image = try container.decodeIfPresent(String.self, forKey: .image)
  }

}
