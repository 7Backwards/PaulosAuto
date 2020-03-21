//
//  CollectionViewEquipamentosCell+Extensions.swift
//  PaulosAuto
//
//  Created by Neves on 17/03/2020.
//  Copyright © 2020 Gonçalo Neves. All rights reserved.
//

import Foundation
import UIKit

extension CollectionViewEquipamentosCell: UICollectionViewDataSource {
    
    func setHorizontalStackView() {
        
           stackViewCell.axis = .horizontal
       }
       
       func setVerticalStackView() {
        
           stackViewCell.axis = .vertical
       }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if(listarEquipamentoController.searchActive) {
            
            return listarEquipamentoController.filteredEquipamentos.count
        }
        else {
            
            return listarEquipamentoController.equipamentos.count
        }
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewEquipamentosCell", for: indexPath) as! CollectionViewEquipamentosCell
        if listarEquipamentoController.isGridFlowLayoutUsed {
            
            cell.setVerticalStackView()
        }
        else {
            
            cell.setHorizontalStackView()
        }
        if listarEquipamentoController.searchActive {
            
            if let imageName = listarEquipamentoController.filteredEquipamentos[indexPath.row].imagem {
                
                cell.imageEquipamento.contentMode = .scaleAspectFit
                cell.imageEquipamento.image = UIImage(named: imageName)
            }
            if let modeloText = listarEquipamentoController.filteredEquipamentos[indexPath.row].modelo {
                
                cell.modeloEquipamento.text = modeloText
            }
            if let utilizacaoText = listarEquipamentoController.filteredEquipamentos[indexPath.row].utilizacao {
                
                cell.utilizacaoEquipamento.text = "Utilização: \(utilizacaoText) H"
            }
            
            if let numeroSerieText = listarEquipamentoController.filteredEquipamentos[indexPath.row].serialNumber {
                
                cell.numeroSerieEquipamento.text = "N.Série: \(numeroSerieText)"
            }
            
        }
        else {
            if let imageName = listarEquipamentoController.equipamentos[indexPath.row].imagem {
                
                cell.imageEquipamento.contentMode = .scaleAspectFit
                cell.imageEquipamento.image = UIImage(named: imageName)
            }
            if let modeloText = listarEquipamentoController.equipamentos[indexPath.row].modelo {
                
                cell.modeloEquipamento.text = modeloText
            }
            if let utilizacaoText = listarEquipamentoController.equipamentos[indexPath.row].utilizacao {
                
                cell.utilizacaoEquipamento.text = "Utilização: \(utilizacaoText) H"
            }
            if let numeroSerieText = listarEquipamentoController.equipamentos[indexPath.row].serialNumber {
                
                cell.numeroSerieEquipamento.text = "N.Série: \(numeroSerieText)"
            }
        }
        cell.cellView.setCardView(view: cell.cellView)
        
        return cell
    }
    

}
