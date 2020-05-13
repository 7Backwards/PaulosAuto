//
//  InvoiceDownloadModel.swift
//
//  Created by Gonçalo Neves on 13/05/2020
//  Copyright (c) . All rights reserved.
//

import Foundation

class InvoiceDownloadModel: Codable {

  enum CodingKeys: String, CodingKey {
    case ano
    case diario
    case fileName
    case diarioObra
    case numero
    case numeroObra
    case pathToDoc
  }

  var ano: Int?
  var diario: String?
  var fileName: String?
  var diarioObra: String?
  var numero: Int?
  var numeroObra: Int?
  var pathToDoc: String?

  init (ano: Int?, diario: String?, fileName: String?, diarioObra: String?, numero: Int?, numeroObra: Int?, pathToDoc: String?) {
    self.ano = ano
    self.diario = diario
    self.fileName = fileName
    self.diarioObra = diarioObra
    self.numero = numero
    self.numeroObra = numeroObra
    self.pathToDoc = pathToDoc
  }

  required init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    ano = try container.decodeIfPresent(Int.self, forKey: .ano)
    diario = try container.decodeIfPresent(String.self, forKey: .diario)
    fileName = try container.decodeIfPresent(String.self, forKey: .fileName)
    diarioObra = try container.decodeIfPresent(String.self, forKey: .diarioObra)
    numero = try container.decodeIfPresent(Int.self, forKey: .numero)
    numeroObra = try container.decodeIfPresent(Int.self, forKey: .numeroObra)
    pathToDoc = try container.decodeIfPresent(String.self, forKey: .pathToDoc)
  }

}
