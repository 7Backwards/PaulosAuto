//
//  ListarequipmentController+Extensions.swift
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
        
        cell.categoryLabel.text = categoryEquipments[indexPath.row]
        
        if categoryEquipments[indexPath.row] == activeCategoryFiltered {
            
            cell.cellView.backgroundColor = UIColor(red: 222/255.0, green: 63/255.0, blue: 63/255.0, alpha: 0.05)
            cell.cellView.layer.masksToBounds = true
            cell.cellView.layer.cornerRadius = 20
            cell.categoryLabel.textColor = UIColor(red: 214/255.0, green: 4/255.0, blue: 3/255.0, alpha: 1)
            cell.checkImageView.isHidden = false
        }
        else {
            
            cell.cellView.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.05)
            cell.cellView.layer.masksToBounds = true
            cell.cellView.layer.cornerRadius = 20
            cell.categoryLabel.textColor = .black
            cell.checkImageView.isHidden = true
        }
        
        
        return cell
    }
    
    
    
    
}

extension FilterShowEquipmentViewController : UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        if self.activeCategoryFiltered == categoryEquipments[indexPath.row] {
            
            self.activeCategoryFiltered = nil
        }
        else {
            
            self.activeCategoryFiltered = categoryEquipments[indexPath.row]
        }
        self.collectionView.reloadData()
        
        if let delegate = self.delegate {
            
            delegate.updateActiveCategoryFiltered(newActiveCategory: self.activeCategoryFiltered)
            delegate.reloadCollectionView()
        }
        
        

    }
        
        
        
        
        
        
}

