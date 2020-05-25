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
    static let listEquipmentURL = base?.appendingPathComponent("equipamentos/")
    static let listEquipmentHistoryURL = base?.appendingPathComponent("intervencoes/")
    static let listInvoicesURL = base?.appendingPathComponent("faturas/")
    static let sendEquipmentUtilizationURL =
        base?.appendingPathComponent("utilizacao")
    static let downloadInvoiceURL =
        base?.appendingPathComponent("listaDocumentos/")
    static let loginURL = base?.appendingPathComponent("login")
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
}

enum Result<T,Error> {
    
    case success(T)
    case failure(APPError)
}

