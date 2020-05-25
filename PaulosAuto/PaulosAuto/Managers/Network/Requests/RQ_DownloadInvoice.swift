//
//  RQ_DownloadInvoice.swift
//  PaulosAuto
//
//  Created by Gonçalo Neves on 13/05/2020.
//  Copyright © 2020 Gonçalo Neves. All rights reserved.
//

import Foundation

class RQ_DownloadInvoice {
    
    
    func repos(id: Int, _ completion: @escaping ([InvoiceDownloadModel]?, Error?) -> Void ) {
        
        let request = URLRequest(url: (ApiConstants.downloadInvoiceURL?.appendingPathComponent("\(id)"))!)
        let url = request.url
        
        NetworkManager.fetchAPIData(url: url!) { (result: Result<([InvoiceDownloadModel]), Error>) in
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
