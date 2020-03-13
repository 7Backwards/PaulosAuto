//
//  CollectionViewEquipamentos.swift
//  PaulosAuto
//
//  Created by Gonçalo Neves on 12/03/2020.
//  Copyright © 2020 Gonçalo Neves. All rights reserved.
//

import UIKit

class CollectionViewEquipamentos: UICollectionViewCell {
    

    @IBOutlet weak var cellView: UIView!
    @IBOutlet weak var modeloEquipamento: UILabel!
    @IBOutlet weak var imageEquipamento: UIImageView!

     
    override func awakeFromNib() {
        super.awakeFromNib()
        imageEquipamento.layer.cornerRadius = 3
        imageEquipamento.layer.masksToBounds = true
        modeloEquipamento.layer.cornerRadius = 3
        modeloEquipamento.layer.masksToBounds = true
        cellView.layer.cornerRadius = 3
        cellView.layer.masksToBounds = true
    }
}
