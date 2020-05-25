//
//  ReportProblemResponseModel.swift
//
//  Created by Gonçalo Neves on 23/05/2020
//  Copyright (c) . All rights reserved.
//

import Foundation

class ReportProblemResponseModel: Codable {

  enum CodingKeys: String, CodingKey {
    case idRegisto
    case serialNumber
    case imagens
    case descricao
    case videos
    case numeroCliente
  }

  var idRegisto: Int?
  var serialNumber: String?
  var imagens: [String]?
  var descricao: String?
  var videos: [String]?
  var numeroCliente: Int?

  init (idRegisto: Int?, serialNumber: String?, imagens: [String]?, descricao: String?, videos: [String]?, numeroCliente: Int?) {
    
    self.idRegisto = idRegisto
    self.serialNumber = serialNumber
    self.imagens = imagens
    self.descricao = descricao
    self.videos = videos
    self.numeroCliente = numeroCliente
  }

  required init(from decoder: Decoder) throws {
    
    let container = try decoder.container(keyedBy: CodingKeys.self)
    idRegisto = try container.decodeIfPresent(Int.self, forKey: .idRegisto)
    serialNumber = try container.decodeIfPresent(String.self, forKey: .serialNumber)
    imagens = try container.decodeIfPresent([String].self, forKey: .imagens)
    descricao = try container.decodeIfPresent(String.self, forKey: .descricao)
    videos = try container.decodeIfPresent([String].self, forKey: .videos)
    numeroCliente = try container.decodeIfPresent(Int.self, forKey: .numeroCliente)
  }

}
