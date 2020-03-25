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
            
            if(smpFilter) {
                smpfilterSearchArray()
                return smpFilterSearchArray.count
            }
            else {
                return filteredEquipamentos.count
            }
            
        }
        else {
            
            if(smpFilter) {
                smpfilterArray()
                return smpFilterArray.count
            }
            else {
                return equipamentos.count
            }
        }
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewEquipamentosCell", for: indexPath) as! CollectionViewEquipamentosCell
        
        
        if searchActive {
            
            if smpFilter {
            
                if let imageName = smpFilterSearchArray[indexPath.row].imagem {
                    
                    cell.imageEquipamento.image = UIImage(named: imageName)
                }
                if let anoEquipamento = smpFilterSearchArray[indexPath.row].ano {
                    
                    cell.anoEquipamento.text = "\(anoEquipamento)"
                }
                
                if let modeloText = smpFilterSearchArray[indexPath.row].modelo {
                    
                    cell.modeloEquipamento.text = modeloText
                }
                if let utilizacaoText = smpFilterSearchArray[indexPath.row].utilizacao {
                    
                    cell.utilizacaoEquipamento.text = "\(utilizacaoText) H"
                }
                
                if let numeroSerieText = smpFilterSearchArray[indexPath.row].serialNumber {
                    
                    cell.numeroSerieEquipamento.text = "\(numeroSerieText)"
                }
                cell.ativoContrato.alpha = 1
            }
            else {
                
                if let imageName = filteredEquipamentos[indexPath.row].imagem {
                    
                    cell.imageEquipamento.image = UIImage(named: imageName)
                }
                if let anoEquipamento = filteredEquipamentos[indexPath.row].ano {
                    
                    cell.anoEquipamento.text = "\(anoEquipamento)"
                }
                
                if let modeloText = filteredEquipamentos[indexPath.row].modelo {
                    
                    cell.modeloEquipamento.text = modeloText
                }
                if let utilizacaoText = filteredEquipamentos[indexPath.row].utilizacao {
                    
                    cell.utilizacaoEquipamento.text = "\(utilizacaoText) H"
                }
                
                if let numeroSerieText = filteredEquipamentos[indexPath.row].serialNumber {
                    
                    cell.numeroSerieEquipamento.text = "\(numeroSerieText)"
                }
                if filteredEquipamentos[indexPath.row].ativo == true {
                    
                    cell.ativoContrato.alpha = 1
                }
                else {
                    cell.ativoContrato.alpha = 0
                }
            }
        }
        else {
            if smpFilter {
                
                if let imageName = smpFilterArray[indexPath.row].imagem {
                    
                    cell.imageEquipamento.image = UIImage(named: imageName)
                }
                if let anoEquipamento = smpFilterArray[indexPath.row].ano {
                    
                    cell.anoEquipamento.text = "\(anoEquipamento)"
                }
                
                if let modeloText = smpFilterArray[indexPath.row].modelo {
                    
                    cell.modeloEquipamento.text = modeloText
                }
                if let utilizacaoText = smpFilterArray[indexPath.row].utilizacao {
                    
                    cell.utilizacaoEquipamento.text = "\(utilizacaoText) H"
                }
                
                if let numeroSerieText = smpFilterArray[indexPath.row].serialNumber {
                    
                    cell.numeroSerieEquipamento.text = "\(numeroSerieText)"
                }
                    cell.ativoContrato.alpha = 1
                
            }
            else {
                
                if let imageName = equipamentos[indexPath.row].imagem {
                    
                    cell.imageEquipamento.image = UIImage(named: imageName)
                }
                if let anoEquipamento = equipamentos[indexPath.row].ano {
                    
                    cell.anoEquipamento.text = "\(anoEquipamento)"
                }
                
                if let modeloText = equipamentos[indexPath.row].modelo {
                    
                    cell.modeloEquipamento.text = modeloText
                }
                if let utilizacaoText = equipamentos[indexPath.row].utilizacao {
                    
                    cell.utilizacaoEquipamento.text = "\(utilizacaoText) H"
                }
                
                if let numeroSerieText = equipamentos[indexPath.row].serialNumber {
                    
                    cell.numeroSerieEquipamento.text = "\(numeroSerieText)"
                }
                if equipamentos[indexPath.row].ativo == true {
                    
                    cell.ativoContrato.alpha = 1
                }
                else {
                    cell.ativoContrato.alpha = 0
                }
                
            }
            
            
        }
        cell.cellView.setCardView(view: cell.cellView)
        return cell
        
    }
    
    
    
    
}
extension ListarEquipamentoController: UICollectionViewDelegate {
    
    // MARK: - Public
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as?
            ShowEquipamentoViewController, let index =
            collectionView.indexPathsForSelectedItems?.first {
            destination.equipamento = equipamentos[index.row]
            
        }
    }
    
    
}

extension ListarEquipamentoController: UISearchBarDelegate {
    
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
        
        filteredEquipamentos = equipamentos.filter { (equipamento) -> Bool in
            return equipamento.serialNumber?.range(of: searchText, options: [ .caseInsensitive ]) != nil
        }
        searchActive = !filteredEquipamentos.isEmpty
        self.collectionView.reloadData()
    }
}






