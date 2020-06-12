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
    case paidAmount = "paidAmmount"
    case totalAmount = "totalAmmount"
    case dueDate = "dueDate"
    case docURL = "docURL"
    case diario = "diario"
    case ano = "ano"
  }

  var issueDate: Date?
  var paidAmount: Double?
  var totalAmount: Double?
  var dueDate: Date?
  var docURL: String?
  var diario: String?
  var ano: String?

    init (issueDate: String?, paidAmount: Double?, totalAmount: Double?, dueDate: String?, docURL: String?, diario: String?, ano: String?) {
    
    self.paidAmount = paidAmount
    self.totalAmount = totalAmount
    self.docURL = docURL
    self.diario = diario
    self.ano = ano
        
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
    let paidAmount = try container.decodeIfPresent(Double.self, forKey: .paidAmount)
    let totalAmount = try container.decodeIfPresent(Double.self, forKey: .totalAmount)
    let dueDateString = try container.decodeIfPresent(String.self, forKey: .dueDate)
    let docURLString = try container.decodeIfPresent(String.self, forKey: .docURL)
    let diarioString = try container.decodeIfPresent(String.self, forKey: .diario)
    let anoString = try container.decodeIfPresent(String.self, forKey: .ano)
    
    self.init(issueDate: issueDateString, paidAmount: paidAmount, totalAmount: totalAmount, dueDate: dueDateString, docURL: docURLString, diario: diarioString, ano: anoString)
  }

}
