//
//  ListReportProblemViewController+Extensions.swift
//  PaulosAuto
//
//  Created by Neves on 15/06/2020.
//  Copyright © 2020 Gonçalo Neves. All rights reserved.
//

import Foundation
import UIKit


extension ListReportProblemViewController : UICollectionViewDataSource {
    
    
    // MARK: - Public
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return self.problemsReported.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewListReportProblemCell", for: indexPath) as! CollectionViewListReportProblemCell
        
        if let serialNumber = problemsReported[indexPath.row].serialNumber {
            
            cell.serialNumberLabel.text = serialNumber
            
        }
        
        if let date = problemsReported[indexPath.row].date {
            
            cell.dateLabel.text = getFormattedDate(date: date, format: "dd/MM/yyyy")
        }
        
        
        cell.cellView.setCardView()
        return cell
    }
}

extension ListReportProblemViewController: UICollectionViewDelegate {
    
    
    // MARK: - Public
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if let destination = segue.destination as?
            ReportProblemInfoViewController, let index =
            collectionView.indexPathsForSelectedItems?.first {
            
            destination.problemReported = problemsReported[index.row]
        }
    }
    
    
    
    
}


