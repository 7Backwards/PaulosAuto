//
//  ApiConstants.swift
//  PaulosAuto
//
//  Created by Gonçalo Neves on 21/04/2020.
//  Copyright © 2020 Gonçalo Neves. All rights reserved.
//

import Foundation


struct ApiConstants {
    
    static let base = URL(string: "http://rootfixxxer.no-ip.info:90/api/pa/")
    static let baseNewAPI = URL(string: "http://192.168.99.100:5080/")
    static let listEquipmentURL = baseNewAPI?.appendingPathComponent("PaulosAutoAPI/clientes/equipamentos_v2/")
    static let listEquipmentHistoryURL = base?.appendingPathComponent("intervencoes/")
    static let listInvoicesURL = baseNewAPI?.appendingPathComponent("PaulosAutoAPI/clientes/faturas/")
    static let sendEquipmentUtilizationURL =
        base?.appendingPathComponent("utilizacao")
    static let downloadInvoiceURL =
        base?.appendingPathComponent("listaDocumentos/")
    static let loginURL = baseNewAPI?.appendingPathComponent("Autenticacao/login")
    static let testTokenURL = base?.appendingPathComponent("testeToken")
    static let testTokenAdmin = base?.appendingPathComponent("testeTokenAdministrador")
    static let testTokenOthers = base?.appendingPathComponent("testeTokenOutros")
    static let problemReportURL = base?.appendingPathComponent("registoAvaria")
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

