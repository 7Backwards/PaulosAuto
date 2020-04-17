//
//  ListarequipmentController+Extensions.swift
//  PaulosAuto
//
//  Created by Gonçalo Neves on 23/03/2020.
//  Copyright © 2020 Gonçalo Neves. All rights reserved.
//

import UIKit


extension ListEquipmentViewController : DataDelegate {

    func updateActiveOrderByFiltered(newOrderBy: Int) {
        
        self.activeOrderByFiltered = newOrderBy
    }
    
    
    func updateActiveCategoryFiltered(newActiveCategory: String ) {
    
        self.activeCategoryFiltered = newActiveCategory
    }
    
}
    
extension ListEquipmentViewController : UICollectionViewDataSource {
    
    
    // MARK: - Public
    
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if(searchActive && !searchFilteredEquipments.isEmpty) {
            
            if(smpActive) {
                
                smpAndSearchFilter()
                return smpAndSearchFilteredEquipments.count
            }
            else {
                
                return searchFilteredEquipments.count
            }
            
        }
        else {
            
            if(smpActive) {
                
                smpfilterArray()
                return smpFilteredEquipments.count
            }
            else {
                
                return equipments.count
            }
        }
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewEquipmentsCell", for: indexPath) as! CollectionViewEquipmentsCell
        
        
        if (searchActive && !searchFilteredEquipments.isEmpty) {
            
            if smpActive {
                
                if let imageName = smpAndSearchFilteredEquipments[indexPath.row].image {
                    
                    cell.EquipmentImageView.image = UIImage(named: imageName)
                }
                
                if let plateEquipment = smpAndSearchFilteredEquipments[indexPath.row].plate {
                    
                    cell.plateEquipmentLabel.text = plateEquipment
                }
                
                if let yearequipment = smpAndSearchFilteredEquipments[indexPath.row].year {
                    
                    cell.yearEquipmentLabel.text = "\(yearequipment)"
                }
                
                if let modelText = smpAndSearchFilteredEquipments[indexPath.row].model {
                    
                    cell.modelEquipmentLabel.text = modelText
                }
                if let currentHoursText = smpAndSearchFilteredEquipments[indexPath.row].currentHours {
                    
                    cell.currenthoursEquipmentLabel.text = "\(currentHoursText) H"
                }
                
                if let numeroSerieText = smpAndSearchFilteredEquipments[indexPath.row].serialNumber {
                    
                    cell.serialNumberEquipmentLabel.text = "\(numeroSerieText)"
                }
                cell.smpLabel.alpha = 1
            }
            else {
                
                if let imageName = searchFilteredEquipments[indexPath.row].image {
                    
                    cell.EquipmentImageView.image = UIImage(named: imageName)
                }
                
                if let plateEquipment = searchFilteredEquipments[indexPath.row].plate {
                    
                    cell.plateEquipmentLabel.text = plateEquipment
                }
                
                if let yearequipment = searchFilteredEquipments[indexPath.row].year {
                    
                    cell.yearEquipmentLabel.text = "\(yearequipment)"
                }
                
                if let modelText = searchFilteredEquipments[indexPath.row].model {
                    
                    cell.modelEquipmentLabel.text = modelText
                }
                if let currentHoursText = searchFilteredEquipments[indexPath.row].currentHours {
                    
                    cell.currenthoursEquipmentLabel.text = "\(currentHoursText) H"
                }
                
                if let numeroSerieText = searchFilteredEquipments[indexPath.row].serialNumber {
                    
                    cell.serialNumberEquipmentLabel.text = "\(numeroSerieText)"
                }
                if searchFilteredEquipments[indexPath.row].smp == true {
                    
                    cell.smpLabel.alpha = 1
                }
                else {
                    cell.smpLabel.alpha = 0
                }
            }
        }
        else {
            if smpActive {
                
                if let imageName = smpFilteredEquipments[indexPath.row].image {
                    
                    cell.EquipmentImageView.image = UIImage(named: imageName)
                }
                
                if let plateEquipment = smpFilteredEquipments[indexPath.row].plate {
                    
                    cell.plateEquipmentLabel.text = plateEquipment
                }
                
                if let yearequipment = smpFilteredEquipments[indexPath.row].year {
                    
                    cell.yearEquipmentLabel.text = "\(yearequipment)"
                }
                
                if let modelText = smpFilteredEquipments[indexPath.row].model {
                    
                    cell.modelEquipmentLabel.text = modelText
                }
                if let currentHoursText = smpFilteredEquipments[indexPath.row].currentHours {
                    
                    cell.currenthoursEquipmentLabel.text = "\(currentHoursText) H"
                }
                
                if let numeroSerieText = smpFilteredEquipments[indexPath.row].serialNumber {
                    
                    cell.serialNumberEquipmentLabel.text = "\(numeroSerieText)"
                }
                cell.smpLabel.alpha = 1
                
            }
            else {
                
                if let imageName = equipments[indexPath.row].image {
                    
                    cell.EquipmentImageView.image = UIImage(named: imageName)
                }
                
                if let plateEquipment = equipments[indexPath.row].plate {
                    
                    cell.plateEquipmentLabel.text = plateEquipment
                }
                
                if let yearequipment = equipments[indexPath.row].year {
                    
                    cell.yearEquipmentLabel.text = "\(yearequipment)"
                }
                
                if let modelText = equipments[indexPath.row].model {
                    
                    cell.modelEquipmentLabel.text = modelText
                }
                if let currentHoursText = equipments[indexPath.row].currentHours {
                    
                    cell.currenthoursEquipmentLabel.text = "\(currentHoursText) H"
                }
                
                if let numeroSerieText = equipments[indexPath.row].serialNumber {
                    
                    cell.serialNumberEquipmentLabel.text = "\(numeroSerieText)"
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
extension ListEquipmentViewController: UICollectionViewDelegate {
    
    // MARK: - Public
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        
        if(searchActive && !searchFilteredEquipments.isEmpty) {
            
            if(smpActive) {
                
                if let destination = segue.destination as?
                    ShowEquipmentViewController, let index =
                    collectionView.indexPathsForSelectedItems?.first {
                    destination.equipment = smpAndSearchFilteredEquipments[index.row]
                    
                }
            }
            else {
                if let destination = segue.destination as?
                    ShowEquipmentViewController, let index =
                    collectionView.indexPathsForSelectedItems?.first {
                    destination.equipment = searchFilteredEquipments[index.row]
                    
                }
                
            }
            
        }
        else {
            
            if(smpActive) {
                
                if let destination = segue.destination as?
                    ShowEquipmentViewController, let index =
                    collectionView.indexPathsForSelectedItems?.first {
                    destination.equipment = smpFilteredEquipments[index.row]
                    
                }
            }
            else {
                
                if let destination = segue.destination as?
                    ShowEquipmentViewController, let index =
                    collectionView.indexPathsForSelectedItems?.first {
                    destination.equipment = equipments[index.row]
                    
                }
            }
        }
        
    }
    
    
}

extension ListEquipmentViewController: UISearchBarDelegate {
    
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
        
        searchFilteredEquipments = equipments.filter { (equipment) -> Bool in
            return equipment.serialNumber?.range(of: searchText, options: [ .caseInsensitive ]) != nil
        }
        searchActive = !searchFilteredEquipments.isEmpty
        self.collectionView.reloadData()
    }
}






