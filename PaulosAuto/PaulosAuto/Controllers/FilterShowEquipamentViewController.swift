//
//  FilterShowEquipmentoViewController.swift
//  PaulosAuto
//
//  Created by Gonçalo Neves on 27/03/2020.
//  Copyright © 2020 Gonçalo Neves. All rights reserved.
//

import UIKit

class FilterShowEquipmentViewController: ViewController {
    
    
    // MARK: - Outlets
    
    
    @IBOutlet weak var handlerView: UIView!
    @IBOutlet weak var orderByView: UIView!
    @IBOutlet weak var CategoryView: UIView!
    @IBOutlet weak var segmentControl: UISegmentedControl!
    
    
    // MARK: - Public
    
    
    override func viewDidLoad() {
        
        handlerView.layer.masksToBounds = true
        handlerView.layer.cornerRadius = 3
        view.addGestureRecognizer(UIPanGestureRecognizer(target: self, action: #selector(onDrage(_:))))
    }
    
    // MARK: - Action
    
    
    @IBAction func segmentControlAction(_ sender: Any) {
        
        let getIndex = segmentControl.selectedSegmentIndex
        
        switch (getIndex) {
            
        case 0:
            self.CategoryView.fadeIn()
            self.orderByView.fadeOut()
            
        case 1:
            self.CategoryView.fadeOut()
            self.orderByView.fadeIn()
            
        default: break
        }
    }
    
}
