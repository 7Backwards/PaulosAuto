//
//  InvoiceViewController+Extensions.swift
//  PaulosAuto
//
//  Created by Gonçalo Neves on 23/03/2020.
//  Copyright © 2020 Gonçalo Neves. All rights reserved.
//

import UIKit


extension InvoiceViewController : UICollectionViewDataSource {
    
    
    // MARK: - Public
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return self.invoices.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewInvoicesCell", for: indexPath) as! CollectionViewInvoicesCell
        
        if let  totalAmount = invoices[indexPath.row].totalAmount {
            
            cell.totalAmountLabel.text = String(totalAmount)
            
        }
        
        if let dueDate = invoices[indexPath.row].dueDate {
            
            cell.dueDateLabel.text = getFormattedDate(date: dueDate, format: "dd/MM/yyyy")
        }
        
        if let issueDate = invoices[indexPath.row].issueDate {
            
            cell.issueDateLabel.text = getFormattedDate(date: issueDate, format: "dd/MM/yyyy")
        }
        
        if let paidAmount = invoices[indexPath.row].paidAmount {
            
            cell.paidAmountLabel.text = String(paidAmount)
            
        }
        
        cell.button.tintColor = .RedPaulosAuto
        
        cell.button.tag = indexPath.row
        cell.button.addTarget(self, action: #selector(didTapMyButton), for: .touchUpInside)
        
        cell.cellView.setCardView()
        return cell
    }
    

    
}






