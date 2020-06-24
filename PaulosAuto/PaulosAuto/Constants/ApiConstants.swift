//
//  ApiConstants.swift
//  PaulosAuto
//
//  Created by Gonçalo Neves on 21/04/2020.
//  Copyright © 2020 Gonçalo Neves. All rights reserved.
//

import Foundation


struct ApiConstants {
    
    static let baseAPI = URL(string: "http://192.168.1.53:5080/")
    static let listEquipmentURL = baseAPI?.appendingPathComponent("PaulosAutoAPI/clientes/equipamentos_v2/")
    static let listEquipmentHistoryURL = baseAPI?.appendingPathComponent("PaulosAutoAPI/equipamentos/intervencoes/")
    static let listInvoicesURL = baseAPI?.appendingPathComponent("PaulosAutoAPI/clientes/faturas/")
    static let listReportProblemURL = baseAPI?.appendingPathComponent("PaulosAutoAPI/equipamentos/avarias/")
    static let sendEquipmentUtilizationURL =
        baseAPI?.appendingPathComponent("PaulosAutoAPI/equipamentos/utilizacao")
    static let loginURL = baseAPI?.appendingPathComponent("Autenticacao/login")
    static let testTokenURL = baseAPI?.appendingPathComponent("Autenticacao/checkAll")
    static let testTokenAdminURL = baseAPI?.appendingPathComponent("Autenticacao/checkAdmin")
    static let problemReportURL = baseAPI?.appendingPathComponent("PaulosAutoAPI/equipamentos/avarias")
    static let dateFormatter : DateFormatter = {
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"
        return dateFormatter
    }()
    static let boundary = "------------------------\(UUID().uuidString)"
    
    
}

enum APPError: Error {
    
    case networkError(Error)
    case dataNotFound
    case jsonParsingError(Error)
    case invalidStatusCode(Int)
    case requestEntityTooLarge
    case unauthorized
    case forbidden
}

enum Result<T,Error> {
    
    case success(T)
    case failure(APPError)
}

