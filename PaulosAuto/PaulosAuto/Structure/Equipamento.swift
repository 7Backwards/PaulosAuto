//
//  Equipamento.swift
//  PaulosAuto
//
//  Created by Neves on 14/03/2020.
//  Copyright © 2020 Gonçalo Neves. All rights reserved.
//

import Foundation

struct equipamento: Decodable {
    
    var modelo : String?
    var serialNumber : String?
    var utilizacao : Int?
    var imagem : String?
    var tipo : String?
    
    init(modelo:String,serialnumber:String,utilizacao:Int,imagem:String,tipo:String){
        
        self.modelo = modelo
        self.serialNumber = serialnumber
        self.utilizacao = utilizacao
        self.imagem = imagem
        self.tipo = tipo
    }
}
