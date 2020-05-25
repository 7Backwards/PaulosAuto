//
//  RQ_SendReportProblem.swift
//  PaulosAuto
//
//  Created by Gonçalo Neves on 21/04/2020.
//  Copyright © 2020 Gonçalo Neves. All rights reserved.
//

import Foundation

class RQ_SendReportProblem {
    
    
    func repos(reportProblemPOST : ReportProblemPOSTModel, _ completion: @escaping (ReportProblemResponseModel?, Error?) -> Void ) {
        
        var requestData = Data()
        
        requestData = reportProblemPOST.convertToMultipart()
        
        let request = URLRequest(url: (ApiConstants.problemReportURL)!)
        let url = request.url
    
        let headers = "multipart/form-data"
        
        NetworkManager.fetchAPIData(url: url!,
                                    method: "POST",
                                    params: nil,
                                    multipartParams: requestData,
                                    headers: headers) { (result: Result<ReportProblemResponseModel, Error>) in
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
