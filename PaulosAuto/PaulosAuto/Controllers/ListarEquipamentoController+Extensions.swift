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
    
    
    // MARK: - Public
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if(searchActive) {
            
            return filteredEquipamentos.count
        }
        else {
            
            return equipamentos.count
        }
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        
        if isGridFlowLayoutUsed {
            let cellGrid = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewEquipamentosCell", for: indexPath) as! CollectionViewEquipamentosCell
            cellGrid.setVerticalStackView()
            
            if searchActive {
                
                if let imageName = filteredEquipamentos[indexPath.row].imagem {
                    
                    cellGrid.imageEquipamento.contentMode = .scaleAspectFit
                    cellGrid.imageEquipamento.image = UIImage(named: imageName)
                }
                if let modeloText = filteredEquipamentos[indexPath.row].modelo {
                    
                    cellGrid.modeloEquipamento.text = modeloText
                }
                if let utilizacaoText = filteredEquipamentos[indexPath.row].utilizacao {
                    
                    cellGrid.utilizacaoEquipamento.text = "Utilização: \(utilizacaoText) H"
                }
                
                if let numeroSerieText = filteredEquipamentos[indexPath.row].serialNumber {
                    
                    cellGrid.numeroSerieEquipamento.text = "N.Série: \(numeroSerieText)"
                }
                
            }
            else {
                if let imageName = equipamentos[indexPath.row].imagem {
                    
                    cellGrid.imageEquipamento.contentMode = .scaleAspectFit
                    cellGrid.imageEquipamento.image = UIImage(named: imageName)
                }
                if let modeloText = equipamentos[indexPath.row].modelo {
                    
                    cellGrid.modeloEquipamento.text = modeloText
                }
                if let utilizacaoText = equipamentos[indexPath.row].utilizacao {
                    
                    cellGrid.utilizacaoEquipamento.text = "Utilização: \(utilizacaoText) H"
                }
                if let numeroSerieText = equipamentos[indexPath.row].serialNumber {
                    
                    cellGrid.numeroSerieEquipamento.text = "N.Série: \(numeroSerieText)"
                }
            }
            cellGrid.cellView.setCardView(view: cellGrid.cellView)
            return cellGrid
            
        }
        else {
            let cellList = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewEquipamentosCell", for: indexPath) as! CollectionViewEquipamentosCell
            cellList.setHorizontalStackView()
            
            if searchActive {
                
                if let imageName = filteredEquipamentos[indexPath.row].imagem {
                    
                    cellList.imageEquipamento.contentMode = .scaleAspectFit
                    cellList.imageEquipamento.image = UIImage(named: imageName)
                }
                if let modeloText = filteredEquipamentos[indexPath.row].modelo {
                    
                    cellList.modeloEquipamento.text = modeloText
                }
                if let utilizacaoText = filteredEquipamentos[indexPath.row].utilizacao {
                    
                    cellList.utilizacaoEquipamento.text = "Utilização: \(utilizacaoText) H"
                }
                
                if let numeroSerieText = filteredEquipamentos[indexPath.row].serialNumber {
                    
                    cellList.numeroSerieEquipamento.text = "N.Série: \(numeroSerieText)"
                }
                
            }
            else {
                if let imageName = equipamentos[indexPath.row].imagem {
                    
                    cellList.imageEquipamento.contentMode = .scaleAspectFit
                    cellList.imageEquipamento.image = UIImage(named: imageName)
                }
                if let modeloText = equipamentos[indexPath.row].modelo {
                    
                    cellList.modeloEquipamento.text = modeloText
                }
                if let utilizacaoText = equipamentos[indexPath.row].utilizacao {
                    
                    cellList.utilizacaoEquipamento.text = "Utilização: \(utilizacaoText) H"
                }
                if let numeroSerieText = equipamentos[indexPath.row].serialNumber {
                    
                    cellList.numeroSerieEquipamento.text = "N.Série: \(numeroSerieText)"
                }
            }
            cellList.cellView.setCardView(view: cellList.cellView)
            
            return cellList
        }
        
    }
}

extension ListarEquipamentoController: UICollectionViewDelegate {
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as?
            ShowEquipamentoViewController, let index =
            collectionView.indexPathsForSelectedItems?.first {
            destination.equipamento = equipamentos[index.row]
        }
    }
    
    
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






