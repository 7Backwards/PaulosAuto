//
//  FilterShowEquipamentoViewController.swift
//  PaulosAuto
//
//  Created by Gonçalo Neves on 27/03/2020.
//  Copyright © 2020 Gonçalo Neves. All rights reserved.
//

import UIKit

class FilterShowEquipamentViewController: ViewController {
    
   
    @IBOutlet weak var handlerView: UIView!
    
    override func viewDidLoad() {
        
        handlerView.layer.masksToBounds = true
        handlerView.layer.cornerRadius = 3
    }
    
}
