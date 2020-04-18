//
//  ListEquipmentViewController+Extensions.swift
//  PaulosAuto
//
//  Created by Gonçalo Neves on 23/03/2020.
//  Copyright © 2020 Gonçalo Neves. All rights reserved.
//

import UIKit


extension ListEquipmentViewController : DataDelegate {
    

    // MARK: - Public
    
    
    func updateActiveOrderByFiltered(newOrderBy: Int) {
        
        self.activeOrderByFiltered = newOrderBy
    }
    
    
    func updateActiveCategoryFiltered(newActiveCategory: String? ) {
        
        self.activeCategoryFiltered = newActiveCategory
    }
    
    func reloadCollectionView() {
        
        self.collectionView.reloadData()
    }
}


extension ListEquipmentViewController : UICollectionViewDataSource {
    
    
    // MARK: - Public
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if(searchActive && !searchFilteredEquipments.isEmpty) {
            
            if(smpActive) {
                
                smpAndSearchFilter()
                return self.filtercategory(equipmentArray: smpAndSearchFilteredEquipments).count
                
            }
            else {
                return self.filtercategory(equipmentArray: searchFilteredEquipments).count
                
            }
            
        }
        else {
            
            if(smpActive) {
                
                smpfilterArray()
                return self.filtercategory(equipmentArray: smpFilteredEquipments).count
                
            }
            else {
                
                return self.filtercategory(equipmentArray: equipments).count
            }
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewEquipmentsCell", for: indexPath) as! CollectionViewEquipmentsCell
        
        if (searchActive && !searchFilteredEquipments.isEmpty) {
            
            if smpActive {
                
                var equipmentsFilteredAndOrdered : [Equipment]
                
                equipmentsFilteredAndOrdered = self.filtercategory(equipmentArray: smpAndSearchFilteredEquipments)
                
                if let imageName = equipmentsFilteredAndOrdered[indexPath.row].image {
                    
                    cell.EquipmentImageView.image = UIImage(named: imageName)
                }
                
                if let plateEquipment = equipmentsFilteredAndOrdered[indexPath.row].plate {
                    
                    cell.plateEquipmentLabel.text = plateEquipment
                }
                
                if let yearequipment = equipmentsFilteredAndOrdered[indexPath.row].year {
                    
                    cell.yearEquipmentLabel.text = "\(yearequipment)"
                }
                
                if let modelText = equipmentsFilteredAndOrdered[indexPath.row].model {
                    
                    cell.modelEquipmentLabel.text = modelText
                }
                if let currentHoursText = equipmentsFilteredAndOrdered[indexPath.row].currentHours {
                    
                    cell.currenthoursEquipmentLabel.text = "\(currentHoursText) H"
                }
                
                if let numeroSerieText = equipmentsFilteredAndOrdered[indexPath.row].serialNumber {
                    
                    cell.serialNumberEquipmentLabel.text = "\(numeroSerieText)"
                }
                cell.smpLabel.alpha = 1
            }
            else {
                
                var equipmentsFilteredAndOrdered : [Equipment]
                
                equipmentsFilteredAndOrdered = self.filtercategory(equipmentArray: searchFilteredEquipments)
                
                if let imageName = equipmentsFilteredAndOrdered[indexPath.row].image {
                    
                    cell.EquipmentImageView.image = UIImage(named: imageName)
                }
                
                if let plateEquipment = equipmentsFilteredAndOrdered[indexPath.row].plate {
                    
                    cell.plateEquipmentLabel.text = plateEquipment
                }
                
                if let yearequipment = equipmentsFilteredAndOrdered[indexPath.row].year {
                    
                    cell.yearEquipmentLabel.text = "\(yearequipment)"
                }
                
                if let modelText = equipmentsFilteredAndOrdered[indexPath.row].model {
                    
                    cell.modelEquipmentLabel.text = modelText
                }
                if let currentHoursText = equipmentsFilteredAndOrdered[indexPath.row].currentHours {
                    
                    cell.currenthoursEquipmentLabel.text = "\(currentHoursText) H"
                }
                
                if let numeroSerieText = equipmentsFilteredAndOrdered[indexPath.row].serialNumber {
                    
                    cell.serialNumberEquipmentLabel.text = "\(numeroSerieText)"
                }
                if equipmentsFilteredAndOrdered[indexPath.row].smp == true {
                    
                    cell.smpLabel.alpha = 1
                }
                else {
                    
                    cell.smpLabel.alpha = 0
                }
            }
        }
        else {
            if smpActive {
                
                var equipmentsFilteredAndOrdered : [Equipment]
                
                equipmentsFilteredAndOrdered = self.filtercategory(equipmentArray: smpFilteredEquipments)
                
                if let imageName = equipmentsFilteredAndOrdered[indexPath.row].image {
                    
                    cell.EquipmentImageView.image = UIImage(named: imageName)
                }
                
                if let plateEquipment = equipmentsFilteredAndOrdered[indexPath.row].plate {
                    
                    cell.plateEquipmentLabel.text = plateEquipment
                }
                
                if let yearequipment = equipmentsFilteredAndOrdered[indexPath.row].year {
                    
                    cell.yearEquipmentLabel.text = "\(yearequipment)"
                }
                
                if let modelText = equipmentsFilteredAndOrdered[indexPath.row].model {
                    
                    cell.modelEquipmentLabel.text = modelText
                }
                if let currentHoursText = equipmentsFilteredAndOrdered[indexPath.row].currentHours {
                    
                    cell.currenthoursEquipmentLabel.text = "\(currentHoursText) H"
                }
                
                if let numeroSerieText = equipmentsFilteredAndOrdered[indexPath.row].serialNumber {
                    
                    cell.serialNumberEquipmentLabel.text = "\(numeroSerieText)"
                }
                cell.smpLabel.alpha = 1
                
            }
            else {
                
                var equipmentsFilteredAndOrdered : [Equipment]
                
                equipmentsFilteredAndOrdered = self.filtercategory(equipmentArray: equipments)
                
                
                if let imageName = equipmentsFilteredAndOrdered[indexPath.row].image {
                    
                    cell.EquipmentImageView.image = UIImage(named: imageName)
                }
                
                if let plateEquipment = equipmentsFilteredAndOrdered[indexPath.row].plate {
                    
                    cell.plateEquipmentLabel.text = plateEquipment
                }
                
                if let yearequipment = equipmentsFilteredAndOrdered[indexPath.row].year {
                    
                    cell.yearEquipmentLabel.text = "\(yearequipment)"
                }
                
                if let modelText = equipmentsFilteredAndOrdered[indexPath.row].model {
                    
                    cell.modelEquipmentLabel.text = modelText
                }
                if let currentHoursText = equipmentsFilteredAndOrdered[indexPath.row].currentHours {
                    
                    cell.currenthoursEquipmentLabel.text = "\(currentHoursText) H"
                }
                
                if let numeroSerieText = equipmentsFilteredAndOrdered[indexPath.row].serialNumber {
                    
                    cell.serialNumberEquipmentLabel.text = "\(numeroSerieText)"
                }
                if equipmentsFilteredAndOrdered[indexPath.row].smp == true {
                    
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
                
                var equipmentsFilteredAndOrdered : [Equipment]
                
                equipmentsFilteredAndOrdered = self.filtercategory(equipmentArray: smpAndSearchFilteredEquipments)
                
                if let destination = segue.destination as?
                    ShowEquipmentViewController, let index =
                    collectionView.indexPathsForSelectedItems?.first {
                    
                    destination.equipment = equipmentsFilteredAndOrdered[index.row]
                }
            }
            else {
                
                var equipmentsFilteredAndOrdered : [Equipment]
                
                equipmentsFilteredAndOrdered = self.filtercategory(equipmentArray: searchFilteredEquipments)
                
                if let destination = segue.destination as?
                    ShowEquipmentViewController, let index =
                    collectionView.indexPathsForSelectedItems?.first {
                    
                    destination.equipment = equipmentsFilteredAndOrdered[index.row]
                }
            }
        }
        else {
            
            if(smpActive) {
                
                var equipmentsFilteredAndOrdered : [Equipment]
                
                equipmentsFilteredAndOrdered = self.filtercategory(equipmentArray: smpFilteredEquipments)
                
                if let destination = segue.destination as?
                    ShowEquipmentViewController, let index =
                    collectionView.indexPathsForSelectedItems?.first {
                    
                    destination.equipment = equipmentsFilteredAndOrdered[index.row]
                }
            }
            else {
                
                var equipmentsFilteredAndOrdered : [Equipment]
                
                equipmentsFilteredAndOrdered = self.filtercategory(equipmentArray: equipments)
                
                if let destination = segue.destination as?
                    ShowEquipmentViewController, let index =
                    collectionView.indexPathsForSelectedItems?.first {
                    
                    destination.equipment = equipmentsFilteredAndOrdered[index.row]
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






