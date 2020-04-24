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
    case dateStartAssignment = "dateStartAssignment"
    case dateEndAssignment = "dateEndAssignment"
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
  var dateAssignment: Date?
  var dateStartAssignment: Date?
  var dateEndAssignment: Date?
  var image: String?

    init (model: String?, serialNumber: String?, year: Int?, currentHours: Int?, smp: Bool?, brand: String?, plate: String?, type: String?, dateAssignment: String?, dateStartAssignment: String?, dateEndAssignment: String?, image: String?) {
    
    self.model = model
    self.serialNumber = serialNumber
    self.year = year
    self.currentHours = currentHours
    self.smp = smp
    self.brand = brand
    self.plate = plate
    self.type = type
    self.image = image
        
    let dateFormatter = DateFormatter()
      dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"
    
        if let dateAssignment = dateAssignment {
            
            if let date = dateFormatter.date(from: dateAssignment) {

                self.dateAssignment = date
            }
        }
    

    if let dateStartAssignment = dateStartAssignment {
        
        if let date = dateFormatter.date(from: dateStartAssignment) {

            self.dateStartAssignment = date
        }
    }
        
    if let dateEndAssignment = dateEndAssignment {
        
        if let date = dateFormatter.date(from: dateEndAssignment) {

            self.dateEndAssignment = date
        }
    }
    
  }

    static let formatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"
        return formatter
    }()
    
    required convenience init(from decoder: Decoder) throws {
        

        
    let container = try decoder.container(keyedBy: CodingKeys.self)
    let model = try container.decodeIfPresent(String.self, forKey: .model)
    let serialNumber = try container.decodeIfPresent(String.self, forKey: .serialNumber)
    let year = try container.decodeIfPresent(Int.self, forKey: .year)
    let currentHours = try container.decodeIfPresent(Int.self, forKey: .currentHours)
    let smp = try container.decodeIfPresent(Bool.self, forKey: .smp)
    let brand = try container.decodeIfPresent(String.self, forKey: .brand)
    let plate = try container.decodeIfPresent(String.self, forKey: .plate)
    let type = try container.decodeIfPresent(String.self, forKey: .type)
    let dateAssignmentString = try container.decodeIfPresent(String.self, forKey: .dateAssignment)
    let dateStartAssignmentString = (try container.decodeIfPresent(String.self, forKey: .dateStartAssignment))
    let dateEndAssignmentString = (try container.decodeIfPresent(String.self, forKey: .dateEndAssignment))
    let image = try container.decodeIfPresent(String.self, forKey: .image)
    self.init(model: model, serialNumber: serialNumber, year: year, currentHours: currentHours, smp: smp, brand: brand, plate: plate, type: type, dateAssignment: dateAssignmentString, dateStartAssignment: dateStartAssignmentString, dateEndAssignment: dateEndAssignmentString, image: image)
  }
    
    

}
