//
//  EquipmentHistoryModel.swift
//
//  Created by Gonçalo Neves on 25/04/2020
//  Copyright (c) . All rights reserved.
//

import Foundation

struct EquipmentHistory {
    
    
    var date: Date?
    var description: String?
    var finalized: Bool?
    var hours: Int?
    
    init (date: Date?, description: String?, finalized: Bool?, hours: Int?) {
     
        self.date = date
        self.description = description
        self.finalized = finalized
        self.hours = hours
    }
    
    init(){}
    
    
}
