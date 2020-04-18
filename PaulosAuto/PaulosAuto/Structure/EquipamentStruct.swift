//
//  Equipmento.swift
//  PaulosAuto
//
//  Created by Neves on 14/03/2020.
//  Copyright © 2020 Gonçalo Neves. All rights reserved.
//

import Foundation
import UIKit


struct Equipment: Decodable {
    
    
    // MARK: - Properties
    
    
    var brand : String?
    var model : String?
    var type : String?
    var serialNumber : String?
    var plate : String?
    var currentHours : Int?
    var image : String?
    var year : Int?
    var dateAssignment : Date?
    var dateStartAssignment : Date?
    var dateEndAssignment : Date?
    var smp : Bool?
    
    
    // MARK: - Functions
    
    
    init(brand : String,model : String,type : String,serialNumber : String,plate : String,currentHours : Int,image : String,year : Int,dateAssignment : String,dateStartAssignment : String,dateEndAssignment : String,smp : Bool){
        
        self.brand = brand
        self.model = model
        self.type = type
        self.serialNumber = serialNumber
        self.plate = plate
        self.currentHours = currentHours
        self.image = image
        self.year = year
        self.smp = smp
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yyyy"
        
        if let date = dateFormatter.date(from: dateAssignment) {
            
            self.dateAssignment = date
        }
        
        if let date = dateFormatter.date(from: dateStartAssignment) {
            
            self.dateStartAssignment = date
        }
        
        if let date = dateFormatter.date(from: dateEndAssignment) {
            
            self.dateEndAssignment = date
        }
    }
}
