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
    
    
    func updateActiveCategoryFiltered(newActiveCategory: [String] ) {
        
        self.activeCategoryFiltered = newActiveCategory
    }
    
    func reloadCollectionView() {
        
        self.collectionView.reloadData()
    }
}


extension ListEquipmentViewController : UICollectionViewDataSource {
    
    
    private func setCell(equipmentArray: [EquipmentModel], indexPath: IndexPath) -> CollectionViewEquipmentsCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewEquipmentsCell", for: indexPath) as! CollectionViewEquipmentsCell
        
        if !equipmentArray.isEmpty {
            
            if let imageData = equipmentArray[indexPath.row].imageData {
                
                cell.EquipmentImageView.image = UIImage(data: imageData)
                
            }
            
            if let plateEquipment = equipmentArray[indexPath.row].plate {
                
                cell.plateEquipmentLabel.text = plateEquipment
            }   
            else {
                
                cell.plateEquipmentStackView.isHidden = true
            }
            
            if let yearequipment = equipmentArray[indexPath.row].year {
                
                cell.yearEquipmentLabel.text = "\(yearequipment)"
            }
            
            if let modelText = equipmentArray[indexPath.row].model {
                
                cell.modelEquipmentLabel.text = modelText
            }
            if let currentHoursText = equipmentArray[indexPath.row].currentHours {
                
                cell.currenthoursEquipmentLabel.text = "\(currentHoursText) H"
            }
            
            if let numeroSerieText = equipmentArray[indexPath.row].serialNumber {
                
                cell.serialNumberEquipmentLabel.text = "\(numeroSerieText)"
            }
            
            if let smpActive = equipmentArray[indexPath.row].smp {
                
                if smpActive {
                    
                    cell.smpLabel.alpha = 1
                }
                else {
                    
                    cell.smpLabel.alpha = 0
                }
            }
        }
        return cell
        
    }
    
    
    // MARK: - Public
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if(searchActive) {
            
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
        
        let cell: CollectionViewEquipmentsCell
        var equipmentsFilteredAndOrdered : [EquipmentModel]
        
        if (searchActive ) {
            
            if smpActive {
                
                equipmentsFilteredAndOrdered = self.filtercategory(equipmentArray: smpAndSearchFilteredEquipments)
                cell = self.setCell(equipmentArray: equipmentsFilteredAndOrdered, indexPath: indexPath)
            }
            else {
                
                equipmentsFilteredAndOrdered = self.filtercategory(equipmentArray: searchFilteredEquipments)
                cell = self.setCell(equipmentArray: equipmentsFilteredAndOrdered, indexPath: indexPath)
            }
        }
        else {
            
            if smpActive {
                
                equipmentsFilteredAndOrdered = self.filtercategory(equipmentArray: smpFilteredEquipments)
                cell = self.setCell(equipmentArray: equipmentsFilteredAndOrdered, indexPath: indexPath)
            }
            else {
                
                equipmentsFilteredAndOrdered = self.filtercategory(equipmentArray: equipments)
                cell = self.setCell(equipmentArray: equipmentsFilteredAndOrdered, indexPath: indexPath)
            }
        }
        cell.cellView.setCardView()
        return cell
    }
}


extension ListEquipmentViewController: UICollectionViewDelegate {
    
    
    // MARK: - Public
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if(searchActive && !searchFilteredEquipments.isEmpty) {
            
            if(smpActive) {
                
                var equipmentsFilteredAndOrdered : [EquipmentModel]
                
                equipmentsFilteredAndOrdered = self.filtercategory(equipmentArray: smpAndSearchFilteredEquipments)
                
                if let destination = segue.destination as?
                    ShowEquipmentViewController, let index =
                    collectionView.indexPathsForSelectedItems?.first {
                    
                    destination.equipment = equipmentsFilteredAndOrdered[index.row]
                }
            }
            else {
                
                var equipmentsFilteredAndOrdered : [EquipmentModel]
                
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
                
                var equipmentsFilteredAndOrdered : [EquipmentModel]
                
                equipmentsFilteredAndOrdered = self.filtercategory(equipmentArray: smpFilteredEquipments)
                
                if let destination = segue.destination as?
                    ShowEquipmentViewController, let index =
                    collectionView.indexPathsForSelectedItems?.first {
                    
                    destination.equipment = equipmentsFilteredAndOrdered[index.row]
                }
            }
            else {
                
                var equipmentsFilteredAndOrdered : [EquipmentModel]
                
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
        
        
        searchActive = !searchText.isEmpty
        self.collectionView.reloadData()
    }
}






