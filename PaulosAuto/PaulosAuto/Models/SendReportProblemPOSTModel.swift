//
//  ReportProblemPOSTModel.swift
//
//  Created by Gonçalo Neves on 23/05/2020
//  Copyright (c) . All rights reserved.
//

import Foundation
import UIKit

class SendReportProblemPOSTModel {
    
    enum CodingKeys: String, CodingKey {
        
        case serialNumber = "serialNumber"
        case images = "images"
        case descricao = "descricao"
        case videos = "videos"
        case numeroCliente = "numeroCliente"
        case email = "email"
    }
    
    var email: String?
    var serialNumber: String?
    var images: [ImageModel]?
    var descricao: String?
    var videos: [VideoModel]?
    
    init (email: String?, serialNumber: String?, images: [ImageModel]?, descricao: String?, videos: [VideoModel]?) {
        
        self.email = email
        self.serialNumber = serialNumber
        self.images = images
        self.descricao = descricao
        self.videos = videos
    }
    
    func convertToMultipart() -> Data {
        
        var requestData = Data()
        let boundary = ApiConstants.boundary
        let lineBreak = "\r\n"
        
        requestData.append("\r\n--\(boundary)\r\n" .data(using: .utf8)!)
        requestData.append("content-disposition: form-data; name= \"\(CodingKeys.email.rawValue)\" \(lineBreak + lineBreak)" .data(using: .utf8)!)
        requestData.append("\(String(self.email!))".data(using: .utf8)!)
        
        
        requestData.append("\r\n--\(boundary)\r\n" .data(using: .utf8)!)
        requestData.append("content-disposition: form-data; name= \"\(CodingKeys.serialNumber.rawValue)\" \(lineBreak + lineBreak)".data(using: .utf8)!)
        requestData.append("\(String(self.serialNumber!))".data(using: .utf8)!)
        
        
        requestData.append("\r\n--\(boundary)\r\n" .data(using: .utf8)!)
        requestData.append("content-disposition: form-data; name= \"\(CodingKeys.descricao.rawValue)\" \(lineBreak + lineBreak)".data(using: .utf8)!)
        requestData.append("\(self.descricao!)".data(using: .utf8)!)
        
        
        if let imagens = images {
            
                for i in imagens {
                
                    requestData.append("\r\n--\(boundary)\r\n" .data(using: .utf8)!)
                    requestData.append("content-disposition: form-data; name= \"\(CodingKeys.images.rawValue)\"; filename=\"\(String(i.name!))\" \(lineBreak)".data(using: .utf8)!)
                    requestData.append("Content-Type: image/jpeg\r\n\r\n".data(using: .utf8)!)
                    requestData.append(i.data!)
                    requestData.append("\r\n".data(using: .utf8)!)
            }
        }
        
        if let videos = videos {
            
                for i in videos {
                    
                    requestData.append("\r\n--\(boundary)\r\n" .data(using: .utf8)!)
                    requestData.append("content-disposition: form-data; name= \"\(CodingKeys.videos.rawValue)\"; filename=\"\(String(i.name!))\" \(lineBreak)".data(using: .utf8)!)
                    requestData.append("Content-Type: video/mp4\r\n\r\n".data(using: .utf8)!)
                    requestData.append(i.data!)
                    requestData.append("\r\n".data(using: .utf8)!)
            }
        }
        
        requestData.append("\r\n--\(boundary)--\r\n".data(using: .utf8)!)
        return requestData
    }
    
}
