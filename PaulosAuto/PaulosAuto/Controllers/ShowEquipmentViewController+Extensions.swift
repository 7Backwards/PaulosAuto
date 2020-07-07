//
//  ShowEquipmentViewController+Extensions.swift
//  PaulosAuto
//
//  Created by Gonçalo Neves on 25/04/2020.
//  Copyright © 2020 Gonçalo Neves. All rights reserved.
//

import UIKit


extension ShowEquipmentViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = historyCollectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewHistoryEquipmentCell", for: indexPath) as! CollectionViewHistoryEquipmentCell
        
        if let description = historyEquipment[indexPath.row].description {
            
            cell.descriptionIncidentLabel.text = description
            
        }
        
        if let date = historyEquipment[indexPath.row].date {
            
            cell.dateIncidentLabel.text = getFormattedDate(date: date, format: "dd/MM/yyyy")
        }
        
        if let description = historyEquipment[indexPath.row].finalized {
            
            if description {
                
                cell.endedLabel.text = "Finalizado"
            }
            else {
                
                cell.endedLabel.text = "A decorrer"
            }
            
        }
        cell.cellView.setCardView()
        return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return self.historyEquipment.count
    }
}





