//
//  ListarequipmentController+Extensions.swift
//  PaulosAuto
//
//  Created by Gonçalo Neves on 23/03/2020.
//  Copyright © 2020 Gonçalo Neves. All rights reserved.
//

import Foundation
import UIKit


extension ListEquipamentViewController: UICollectionViewDataSource {
    
    
    // MARK: - Public
    
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if(searchActive) {
            
            if(smpActive) {
                smpAndSearchFilter()
                return smpAndSearchFilterArray.count
            }
            else {
                return searchFilteredEquipaments.count
            }
            
        }
        else {
            
            if(smpActive) {
                smpfilterArray()
                return smpFilterArray.count
            }
            else {
                return equipments.count
            }
        }
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewEquipmentsCell", for: indexPath) as! CollectionViewEquipmentsCell
        
        
        if searchActive {
            
            if smpActive {
                
                if let imageName = smpAndSearchFilterArray[indexPath.row].image {
                    
                    cell.equipamentImageView.image = UIImage(named: imageName)
                }
                
                if let plateEquipment = smpAndSearchFilterArray[indexPath.row].plate {
                    
                    cell.plateEquipmentLabel.text = plateEquipment
                }
                
                if let yearequipment = smpAndSearchFilterArray[indexPath.row].year {
                    
                    cell.yearEquipamentLabel.text = "\(yearequipment)"
                }
                
                if let modelText = smpAndSearchFilterArray[indexPath.row].model {
                    
                    cell.modelEquipamentLabel.text = modelText
                }
                if let currentHoursText = smpAndSearchFilterArray[indexPath.row].currentHours {
                    
                    cell.currenthoursEquipamentLabel.text = "\(currentHoursText) H"
                }
                
                if let numeroSerieText = smpAndSearchFilterArray[indexPath.row].serialNumber {
                    
                    cell.serialNumberEquipamentLabel.text = "\(numeroSerieText)"
                }
                cell.smpLabel.alpha = 1
            }
            else {
                
                if let imageName = searchFilteredEquipaments[indexPath.row].image {
                    
                    cell.equipamentImageView.image = UIImage(named: imageName)
                }
                
                if let plateEquipment = searchFilteredEquipaments[indexPath.row].plate {
                    
                    cell.plateEquipmentLabel.text = plateEquipment
                }
                
                if let yearequipment = searchFilteredEquipaments[indexPath.row].year {
                    
                    cell.yearEquipamentLabel.text = "\(yearequipment)"
                }
                
                if let modelText = searchFilteredEquipaments[indexPath.row].model {
                    
                    cell.modelEquipamentLabel.text = modelText
                }
                if let currentHoursText = searchFilteredEquipaments[indexPath.row].currentHours {
                    
                    cell.currenthoursEquipamentLabel.text = "\(currentHoursText) H"
                }
                
                if let numeroSerieText = searchFilteredEquipaments[indexPath.row].serialNumber {
                    
                    cell.serialNumberEquipamentLabel.text = "\(numeroSerieText)"
                }
                if searchFilteredEquipaments[indexPath.row].smp == true {
                    
                    cell.smpLabel.alpha = 1
                }
                else {
                    cell.smpLabel.alpha = 0
                }
            }
        }
        else {
            if smpActive {
                
                if let imageName = smpFilterArray[indexPath.row].image {
                    
                    cell.equipamentImageView.image = UIImage(named: imageName)
                }
                
                if let plateEquipment = smpFilterArray[indexPath.row].plate {
                    
                    cell.plateEquipmentLabel.text = plateEquipment
                }
                
                if let yearequipment = smpFilterArray[indexPath.row].year {
                    
                    cell.yearEquipamentLabel.text = "\(yearequipment)"
                }
                
                if let modelText = smpFilterArray[indexPath.row].model {
                    
                    cell.modelEquipamentLabel.text = modelText
                }
                if let currentHoursText = smpFilterArray[indexPath.row].currentHours {
                    
                    cell.currenthoursEquipamentLabel.text = "\(currentHoursText) H"
                }
                
                if let numeroSerieText = smpFilterArray[indexPath.row].serialNumber {
                    
                    cell.serialNumberEquipamentLabel.text = "\(numeroSerieText)"
                }
                cell.smpLabel.alpha = 1
                
            }
            else {
                
                if let imageName = equipments[indexPath.row].image {
                    
                    cell.equipamentImageView.image = UIImage(named: imageName)
                }
                
                if let plateEquipment = equipments[indexPath.row].plate {
                    
                    cell.plateEquipmentLabel.text = plateEquipment
                }
                
                if let yearequipment = equipments[indexPath.row].year {
                    
                    cell.yearEquipamentLabel.text = "\(yearequipment)"
                }
                
                if let modelText = equipments[indexPath.row].model {
                    
                    cell.modelEquipamentLabel.text = modelText
                }
                if let currentHoursText = equipments[indexPath.row].currentHours {
                    
                    cell.currenthoursEquipamentLabel.text = "\(currentHoursText) H"
                }
                
                if let numeroSerieText = equipments[indexPath.row].serialNumber {
                    
                    cell.serialNumberEquipamentLabel.text = "\(numeroSerieText)"
                }
                if equipments[indexPath.row].smp == true {
                    
                    cell.smpLabel.alpha = 1
                }
                else {
                    cell.smpLabel.alpha = 0
                }
                
            }
            
            
        }
        cell.cellView.setCardView(view: cell.cellView)
        return cell
        
    }
    
    
    
    
}
extension ListEquipamentViewController: UICollectionViewDelegate {
    
    // MARK: - Public
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        
        if(searchActive) {
            
            if(smpActive) {
                
                if let destination = segue.destination as?
                    ShowEquipamentViewController, let index =
                    collectionView.indexPathsForSelectedItems?.first {
                    destination.equipment = smpAndSearchFilterArray[index.row]
                    
                }
            }
            else {
                if let destination = segue.destination as?
                    ShowEquipamentViewController, let index =
                    collectionView.indexPathsForSelectedItems?.first {
                    destination.equipment = searchFilteredEquipaments[index.row]
                    
                }
                
            }
            
        }
        else {
            
            if(smpActive) {
                
                if let destination = segue.destination as?
                    ShowEquipamentViewController, let index =
                    collectionView.indexPathsForSelectedItems?.first {
                    destination.equipment = smpFilterArray[index.row]
                    
                }
            }
            else {
                
                if let destination = segue.destination as?
                    ShowEquipamentViewController, let index =
                    collectionView.indexPathsForSelectedItems?.first {
                    destination.equipment = equipments[index.row]
                    
                }
            }
        }
        
    }
    
    
}

extension ListEquipamentViewController: UISearchBarDelegate {
    
    // MARK: - Public
    
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        searchActive = true;
    }
    
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        searchActive = false;
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchActive = false;
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchActive = false;
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        searchFilteredEquipaments = equipments.filter { (equipment) -> Bool in
            return equipment.serialNumber?.range(of: searchText, options: [ .caseInsensitive ]) != nil
        }
        searchActive = !searchFilteredEquipaments.isEmpty
        self.collectionView.reloadData()
    }
}






