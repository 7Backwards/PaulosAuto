//
//  InvoiceModel.swift
//
//  Created by Gonçalo Neves on 25/04/2020
//  Copyright (c) . All rights reserved.
//

import Foundation

class InvoiceModel: Codable {

  enum CodingKeys: String, CodingKey {
    case issueDate = "issueDate"
    case paidAmount = "paidAmount"
    case totalAmount = "totalAmount"
    case dueDate = "dueDate"
  }

  var issueDate: Date?
  var paidAmount: Int?
  var totalAmount: Int?
  var dueDate: Date?

  init (issueDate: String?, paidAmount: Int?, totalAmount: Int?, dueDate: String?) {
    
    self.paidAmount = paidAmount
    self.totalAmount = totalAmount
    
    if let dueDate = dueDate {
        
        if let date = ApiConstants.dateFormatter.date(from: dueDate) {
            
            self.dueDate = date
        }
    }
    
    if let issueDate = issueDate {
        
        if let date = ApiConstants.dateFormatter.date(from: issueDate) {
            
            self.issueDate = date
        }
    }
  }

  required convenience init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    let issueDateString = try container.decodeIfPresent(String.self, forKey: .issueDate)
    let paidAmount = try container.decodeIfPresent(Int.self, forKey: .paidAmount)
    let totalAmount = try container.decodeIfPresent(Int.self, forKey: .totalAmount)
    let dueDateString = try container.decodeIfPresent(String.self, forKey: .dueDate)
    
    self.init(issueDate: issueDateString, paidAmount: paidAmount, totalAmount: totalAmount, dueDate: dueDateString)
  }

}
