//
//  Equipamento.swift
//  PaulosAuto
//
//  Created by Neves on 14/03/2020.
//  Copyright © 2020 Gonçalo Neves. All rights reserved.
//

import Foundation

struct equipament: Decodable {
    
    
    // MARK: - Properties
    
    
    var brand : String?
    var model : String?
    var type : String?
    var serialNumber : String?
    var plate : String?
    var currentHours : Int?
    var image : String?
    var year : Int?
    var dateAssignment : String?
    var dateStartAssignment : String?
    var dateEndAssignment : String?
    var smp : Bool?
    
    
    // MARK: - Functions
    
    
    init(brand : String?,model : String?,type : String?,serialNumber : String?,plate : String?,currentHours : Int?,image : String?,year : Int?,dateAssignment : String?,dateStartAssignment : String?,dateEndAssignment : String?,smp : Bool?){
        
        self.brand = brand
        self.model = model
        self.type = type
        self.serialNumber = serialNumber
        self.plate = plate
        self.currentHours = currentHours
        self.image = image
        self.year = year
        self.dateAssignment = dateAssignment
        self.dateStartAssignment = dateStartAssignment
        self.dateEndAssignment = dateEndAssignment
        self.smp = smp
    }
}
