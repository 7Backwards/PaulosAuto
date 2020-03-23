//
//  ListarEquipamentoController+Extensions.swift
//  PaulosAuto
//
//  Created by Gonçalo Neves on 23/03/2020.
//  Copyright © 2020 Gonçalo Neves. All rights reserved.
//

import Foundation
import UIKit


extension ListarEquipamentoController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if(searchActive) {
            
            return filteredEquipamentos.count
        }
        else {
            
            return equipamentos.count
        }
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewEquipamentosCell", for: indexPath) as! CollectionViewEquipamentosCell
        if isGridFlowLayoutUsed {
            
            cell.setVerticalStackView()
        }
        else {
            
            cell.setHorizontalStackView()
        }
        if searchActive {
            
            if let imageName = filteredEquipamentos[indexPath.row].imagem {
                
                cell.imageEquipamento.contentMode = .scaleAspectFit
                cell.imageEquipamento.image = UIImage(named: imageName)
            }
            if let modeloText = filteredEquipamentos[indexPath.row].modelo {
                
                cell.modeloEquipamento.text = modeloText
            }
            if let utilizacaoText = filteredEquipamentos[indexPath.row].utilizacao {
                
                cell.utilizacaoEquipamento.text = "Utilização: \(utilizacaoText) H"
            }
            
            if let numeroSerieText = filteredEquipamentos[indexPath.row].serialNumber {
                
                cell.numeroSerieEquipamento.text = "N.Série: \(numeroSerieText)"
            }
            
        }
        else {
            if let imageName = equipamentos[indexPath.row].imagem {
                
                cell.imageEquipamento.contentMode = .scaleAspectFit
                cell.imageEquipamento.image = UIImage(named: imageName)
            }
            if let modeloText = equipamentos[indexPath.row].modelo {
                
                cell.modeloEquipamento.text = modeloText
            }
            if let utilizacaoText = equipamentos[indexPath.row].utilizacao {
                
                cell.utilizacaoEquipamento.text = "Utilização: \(utilizacaoText) H"
            }
            if let numeroSerieText = equipamentos[indexPath.row].serialNumber {
                
                cell.numeroSerieEquipamento.text = "N.Série: \(numeroSerieText)"
            }
        }
        cell.cellView.setCardView(view: cell.cellView)
        
        return cell
    }
}
    
    extension ListarEquipamentoController: UICollectionViewDelegate {
        
        
    }
    
    extension ListarEquipamentoController: UISearchBarDelegate {
        
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
               
               filteredEquipamentos = equipamentos.filter { (equipamento) -> Bool in
                   return equipamento.serialNumber?.range(of: searchText, options: [ .caseInsensitive ]) != nil
               }
               searchActive = !filteredEquipamentos.isEmpty
               self.collectionView.reloadData()
           }
    }
    

