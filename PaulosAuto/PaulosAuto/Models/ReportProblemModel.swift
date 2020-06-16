//
//  ReportProblemResponseModel.swift
//
//  Created by Gonçalo Neves on 23/05/2020
//  Copyright (c) . All rights reserved.
//

import Foundation

class ReportProblemModel: Codable {
    
    enum CodingKeys: String, CodingKey {
        
        case description = "descricao"
        case images = "imagens"
        case client = "cliente"
        case date = "dataRegisto"
        case videos = "videos"
        case email = "email"
    }
    
    var description: String?
    var images: [String]?
    var client: String?
    var date: Date?
    var videos: [String]?
    var email: String?
    var serialNumber: String?
    
    init (description: String?, images: [String]?, client: String?, date: String?, videos: [String]?, email: String?) {
        self.description = description
        self.images = images
        self.client = client
        self.videos = videos
        self.email = email
        
        if let date = date {
            
            if let date = ApiConstants.dateFormatter.date(from: date) {
                
                self.date = date
            }
        }
    }
    
    required convenience init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let descriptionString = try container.decodeIfPresent(String.self, forKey: .description)
        let imagesStrings = try container.decodeIfPresent([String].self, forKey: .images)
        let clientString = try container.decodeIfPresent(String.self, forKey: .client)
        let dateString = try container.decodeIfPresent(String.self, forKey: .date)
        let videosStrings = try container.decodeIfPresent([String].self, forKey: .videos)
        let emailString = try container.decodeIfPresent(String.self, forKey: .email)
        
        self.init(description: descriptionString, images: imagesStrings, client: clientString, date: dateString, videos: videosStrings, email: emailString)
        
    }
}
