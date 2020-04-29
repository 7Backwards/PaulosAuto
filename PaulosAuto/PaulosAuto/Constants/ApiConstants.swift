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
    static let sendEquipmentUtilization =
        base?.appendingPathComponent("utilizacao/")
    static let dateFormatter : DateFormatter = {
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"
        return dateFormatter
    }()
}

