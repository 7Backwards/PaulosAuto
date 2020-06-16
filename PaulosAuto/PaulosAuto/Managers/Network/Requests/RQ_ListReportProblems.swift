//
//  RQ_ListEquipments.swift
//  PaulosAuto
//
//  Created by Gonçalo Neves on 21/04/2020.
//  Copyright © 2020 Gonçalo Neves. All rights reserved.
//

import Foundation

class RQ_ListReportProblems {
    
    
    // MARK: - Public
    
    
    func repos(serialNumber: String, _ completion: @escaping ([ReportProblemModel]?, Error?) -> Void ) {
        
        let request = URLRequest(url: ((ApiConstants.listReportProblemURL?.appendingPathComponent(serialNumber))!))
        let url = request.url
        

        NetworkManager.fetchAPIData(url: url!) { (result: Result<[ReportProblemModel], Error>) in
            switch result {
                
            case .success(let data):
                print(result)
                completion(data,nil)

                
            case .failure(let error):
                print(result)
                completion(nil,error)

                
            }
        }
    }
}
