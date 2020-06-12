//
//  RQ_ListInvoices.swift
//  PaulosAuto
//
//  Created by Gonçalo Neves on 21/04/2020.
//  Copyright © 2020 Gonçalo Neves. All rights reserved.
//

import Foundation

class RQ_ListInvoices {
    
    
    // MARK: - Public
    
    
    func repos(username: Int, _ completion: @escaping ([InvoiceModel]?, Error?) -> Void ) {
        
        let urlWithClientID = ApiConstants.listInvoicesURL?.appendingPathComponent(String(username))
        let request = URLRequest(url: (urlWithClientID?.appendingPathComponent("/divida"))!)
        let url = request.url
        
        NetworkManager.fetchAPIData(url: url!) { (result: Result<[InvoiceModel], Error>) in
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
