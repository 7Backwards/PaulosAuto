//
//  CollectionViewEquipamentosCell.swift
//  PaulosAuto
//
//  Created by Gonçalo Neves on 12/03/2020.
//  Copyright © 2020 Gonçalo Neves. All rights reserved.
//

import UIKit

class CollectionViewEquipamentosCell: UICollectionViewCell {
    
    // MARK: - Outlets
    
    @IBOutlet weak var cellView: UIView!
    @IBOutlet weak var modeloEquipamento: UILabel!
    @IBOutlet weak var imageEquipamento: UIImageView!
    @IBOutlet weak var utilizacaoEquipamento: UILabel!
    @IBOutlet weak var numeroSerieEquipamento: UILabel!
    @IBOutlet weak var stackViewCell: UIStackView!
    
    
    var listarEquipamentoController = ListarEquipamentoController()
    
<<<<<<< Updated upstream
   
=======
    override func awakeFromNib() {
        super.awakeFromNib()
        stackViewCell.axis = .vertical
    }
    
    func setHorizontalStackView() {
        
        stackViewCell.axis = .horizontal
    }
    
>>>>>>> Stashed changes
    func setVerticalStackView() {
        
        stackViewCell.axis = .vertical
    }
<<<<<<< Updated upstream
    
    func setHorizontalStackView() {
        
        stackViewCell.axis = .horizontal
    }

=======
    
    
>>>>>>> Stashed changes
    
}
