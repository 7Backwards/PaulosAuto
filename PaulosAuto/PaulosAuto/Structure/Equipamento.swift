//
//  Equipamento.swift
//  PaulosAuto
//
//  Created by Neves on 14/03/2020.
//  Copyright © 2020 Gonçalo Neves. All rights reserved.
//

import Foundation

struct equipamento: Decodable {
    
    
    // MARK: - Properties
    
    
    var marca : String?
    var modelo : String?
    var tipo : String?
    var serialNumber : String?
    var matricula : String?
    var utilizacao : Int?
    var imagem : String?
    var ano : Int?
    var dataContrato : String?
    var datainicioContrato : String?
    var datafimContrato : String?
    var ativo : Bool?
    
    
    // MARK: - Functions
    
    
    init(marca : String?,modelo : String?,tipo : String?,serialNumber : String?,matricula : String?,utilizacao : Int?,imagem : String?,ano : Int?,dataContrato : String?,datainicioContrato : String?,datafimContrato : String?,ativo : Bool?){
        
        self.marca = marca
        self.modelo = modelo
        self.tipo = tipo
        self.serialNumber = serialNumber
        self.matricula = matricula
        self.utilizacao = utilizacao
        self.imagem = imagem
        self.ano = ano
        self.dataContrato = dataContrato
        self.datainicioContrato = datainicioContrato
        self.datafimContrato = datafimContrato
        self.ativo = ativo
    }
}
