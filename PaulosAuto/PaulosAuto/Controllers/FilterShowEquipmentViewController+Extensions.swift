//
//  FilterShowEquipmentViewController+Extensions.swift
//  PaulosAuto
//
//  Created by Gonçalo Neves on 23/03/2020.
//  Copyright © 2020 Gonçalo Neves. All rights reserved.
//

import Foundation
import UIKit


extension FilterShowEquipmentViewController: UICollectionViewDataSource {
    
    
    // MARK: - Public
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return self.categoryEquipments.count
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewCategoriesCell", for: indexPath) as! CollectionViewCategoriesCell
        

        
        for category in activeCategoryFiltered {
            
            if categoryEquipments[indexPath.row] == category {
                
                cell.cellView.backgroundColor = .redTransparent5
                cell.cellView.layer.masksToBounds = true
                cell.cellView.layer.cornerRadius = 20
                cell.categoryLabel.textColor = .RedPaulosAuto
                cell.checkImageView.isHidden = false
                return cell
            }
        }
        cell.cellView.backgroundColor = .blackTransparent
        cell.cellView.layer.masksToBounds = true
        cell.cellView.layer.cornerRadius = 20
        cell.categoryLabel.textColor = .black
        cell.categoryLabel.text = categoryEquipments[indexPath.row]
        cell.checkImageView.isHidden = true
        return cell
    }
}

extension FilterShowEquipmentViewController : UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        var i = 0
        for category in activeCategoryFiltered {
            
            if categoryEquipments[indexPath.row] == category {
                
                activeCategoryFiltered.remove(at: i)
                self.collectionView.reloadData()
                refreshListEquipmentCollectionView()
                return
            }
            i+=1
        }
        
        self.activeCategoryFiltered.append(categoryEquipments[indexPath.row])
        self.collectionView.reloadData()
        refreshListEquipmentCollectionView()
        
        
    }
}


extension FilterShowEquipmentViewController : UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize
    {
        if ( heightCell == 0) {
            
            heightCell = (self.collectionView!.frame.height - 3 * 10)/4
        }
        
        let width  = self.collectionView!.frame.width
        return CGSize(width: width, height: heightCell)
    }
    
}

