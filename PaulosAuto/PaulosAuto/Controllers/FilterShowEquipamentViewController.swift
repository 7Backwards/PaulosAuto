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
    @IBOutlet weak var categoryView: UIView!
    @IBOutlet weak var segmentControl: UISegmentedControl!
    @IBOutlet weak var dateContractView: UIView!
    @IBOutlet weak var dateContractLabel: UILabel!
    @IBOutlet weak var dateContractCheckImageView: UIImageView!
    @IBOutlet weak var hoursUtilizationView: UIView!
    @IBOutlet weak var hoursUtilizationLabel: UILabel!
    @IBOutlet weak var hoursUtilizationCheckImageView: UIImageView!
    @IBOutlet weak var modelView: UIView!
    @IBOutlet weak var modelLabel: UILabel!
    @IBOutlet weak var modelCheckImageView: UIImageView!
    @IBOutlet weak var serialNumberView: UIView!
    @IBOutlet weak var serialNumberLabel: UILabel!
    @IBOutlet weak var serialNumberCheckImageView: UIImageView!
    @IBOutlet weak var outerView: UIView!
    @IBOutlet weak var outerViewHeightConstraint: NSLayoutConstraint!
    
    // MARK: - Properties
    
    var activeFilter = 0
    
    
    // MARK: - Private
    
    
    private func setSelected() {
        
        switch (activeFilter) {
            
        case 0:
            
            dateContractView.backgroundColor = UIColor(red: 222/255.0, green: 63/255.0, blue: 63/255.0, alpha: 0.05)
            dateContractLabel.textColor = UIColor(red: 214/255.0, green: 4/255.0, blue: 3/255.0, alpha: 1)
            dateContractCheckImageView.isHidden = false
            hoursUtilizationView.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.05)
            hoursUtilizationLabel.textColor = .black
            hoursUtilizationCheckImageView.isHidden = true
            modelView.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.05)
            modelLabel.textColor = .black
            modelCheckImageView.isHidden = true
            serialNumberView.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.05)
            serialNumberLabel.textColor = .black
            serialNumberCheckImageView.isHidden = true
            
        case 1:
            
            hoursUtilizationView.backgroundColor = UIColor(red: 222/255.0, green: 63/255.0, blue: 63/255.0, alpha: 0.05)
            hoursUtilizationLabel.textColor = UIColor(red: 214/255.0, green: 4/255.0, blue: 3/255.0, alpha: 1)
            hoursUtilizationCheckImageView.isHidden = false
            modelView.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.05)
            modelLabel.textColor = .black
            modelCheckImageView.isHidden = true
            serialNumberView.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.05)
            serialNumberLabel.textColor = .black
            serialNumberCheckImageView.isHidden = true
            dateContractView.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.05)
            dateContractLabel.textColor = .black
            dateContractCheckImageView.isHidden = true
            
        case 2:
            
            modelView.backgroundColor = UIColor(red: 222/255.0, green: 63/255.0, blue: 63/255.0, alpha: 0.05)
            modelLabel.textColor = UIColor(red: 214/255.0, green: 4/255.0, blue: 3/255.0, alpha: 1)
            modelCheckImageView.isHidden = false
            serialNumberView.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.05)
            serialNumberLabel.textColor = .black
            serialNumberCheckImageView.isHidden = true
            dateContractView.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.05)
            dateContractLabel.textColor = .black
            dateContractCheckImageView.isHidden = true
            hoursUtilizationView.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.05)
            hoursUtilizationLabel.textColor = .black
            hoursUtilizationCheckImageView.isHidden = true
            
        case 3:
            
            serialNumberView.backgroundColor = UIColor(red: 222/255.0, green: 63/255.0, blue: 63/255.0, alpha: 0.05)
            serialNumberLabel.textColor = UIColor(red: 214/255.0, green: 4/255.0, blue: 3/255.0, alpha: 1)
            serialNumberCheckImageView.isHidden = false
            dateContractView.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.05)
            dateContractLabel.textColor = .black
            dateContractCheckImageView.isHidden = true
            hoursUtilizationView.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.05)
            hoursUtilizationLabel.textColor = .black
            hoursUtilizationCheckImageView.isHidden = true
            modelView.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.05)
            modelLabel.textColor = .black
            modelCheckImageView.isHidden = true
        default: break
            
        }
    }
    
    // MARK: - Public
    
    
    override func viewDidLoad() {
        
        handlerView.layer.masksToBounds = true
        handlerView.layer.cornerRadius = 3
        view.addGestureRecognizer(UIPanGestureRecognizer(target: self, action: #selector(onDrage(_:))))
        dateContractView.layer.masksToBounds = true
        dateContractView.layer.cornerRadius = 20
        
        dateContractView.backgroundColor = UIColor(red: 222/255.0, green: 63/255.0, blue: 63/255.0, alpha: 0.05)
        hoursUtilizationView.layer.masksToBounds = true
        hoursUtilizationView.layer.cornerRadius = 20
        hoursUtilizationView.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.05)
        modelView.layer.masksToBounds = true
        modelView.layer.cornerRadius = 20
        modelView.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.05)
        serialNumberView.layer.masksToBounds = true
        serialNumberView.layer.cornerRadius = 20
        serialNumberView.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.05)
        outerView.setCardViewOverContext(view: outerView)
        outerViewHeightConstraint.constant = self.view.frame.size.height * 0.5
    }
    

    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        let touch = touches.first!
        if touch.view?.tag == 100 {
            
            activeFilter = 0
        }
        else if touch.view?.tag == 200 {
            
            activeFilter = 1
        }
        else if touch.view?.tag == 300 {
            
            activeFilter = 2
        }
        else if touch.view?.tag == 400 {
            
            activeFilter = 3
        }
        else if touch.view?.tag == 0{
            
            self.dismiss(animated: true) //Perform dismiss
        }
        self.setSelected()
        
    }
    
    // MARK: - Action
    
    
    @IBAction func segmentControlAction(_ sender: Any) {
        
        let getIndex = segmentControl.selectedSegmentIndex
        
        switch (getIndex) {
            
        case 0:
            UIView.animate(withDuration: 0.5, animations: {
                
                self.categoryView.fadeIn()
                self.outerViewHeightConstraint.constant = self.view.frame.size.height * 0.5
                self.view.layoutIfNeeded()
            })
            self.orderByView.fadeOut()
            
        case 1:
            UIView.animate(withDuration: 0.5, animations: {
                
                self.categoryView.fadeOut()
                self.outerViewHeightConstraint.constant = self.view.frame.size.height
                self.view.layoutIfNeeded()
            })
            self.orderByView.fadeIn()
            
        default: break
        }
    }
    
    
    
}
