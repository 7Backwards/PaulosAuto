//
//  ShowEquipmentoViewController.swift
//  PaulosAuto
//
//  Created by Gonçalo Neves on 23/03/2020.
//  Copyright © 2020 Gonçalo Neves. All rights reserved.
//

import UIKit

class ShowEquipmentViewController: ViewController {
    
    
    // MARK: - Outlets
    
    
    @IBOutlet weak var informationView: UIView!
    @IBOutlet weak var historyView: UIView!
    @IBOutlet weak var modelLabel: UILabel!
    @IBOutlet weak var serialNumberLabel: UILabel!
    @IBOutlet weak var equipmentTypeLabel: UILabel!
    @IBOutlet weak var dateAgreementLabel: UILabel!
    @IBOutlet weak var dateStartAgreementLabel: UILabel!
    @IBOutlet weak var dateEndAgreementLabel: UILabel!
    @IBOutlet weak var brandLabel: UILabel!
    @IBOutlet weak var plateLabel: UILabel!
    @IBOutlet weak var currentHoursLabel: UILabel!
    @IBOutlet weak var equipmentImageView: UIImageView!
    @IBOutlet weak var smpImageView: UIImageView!
    @IBOutlet weak var registerHoursButton: UIButton!
    @IBOutlet weak var reportProblemButton: UIButton!
    @IBOutlet weak var segmentControl: UISegmentedControl!
    
    
    // MARK: - Properties
    
    
    var serialNumberID: String!
    var equipment : Equipment!
    
    
    // MARK: - Private
    
    
    private func setupEquipmentoViewController() {
        
        super.addNavBarLogo()
        navigationItem.leftBarButtonItem?.tintColor = UIColor(red: 214/255.0, green: 4/255.0, blue: 3/255.0, alpha: 1)
    }
    
    private func setupInfo() {
        
        modelLabel.text = equipment.model
        equipmentTypeLabel.text = equipment.type
        serialNumberLabel.text = equipment.serialNumber
        equipmentImageView.image = UIImage(named: equipment.image!)
        dateAgreementLabel.text = equipment.dateAssignment
        dateStartAgreementLabel.text = equipment.dateStartAssignment
        dateEndAgreementLabel.text = equipment.dateEndAssignment
        modelLabel.text = equipment.brand
        plateLabel.text = equipment.plate
        currentHoursLabel.text = "\(equipment.currentHours!)"
        if (equipment.smp == true) {
            
             smpImageView.tintColor = UIColor(red: 31/255.0, green: 119/255.0, blue: 54/255.0, alpha: 1)
            if #available(iOS 13.0, *) {
                
                smpImageView.image = UIImage(systemName: "checkmark.circle")
            } else {
                
                smpImageView.image = UIImage(named: "checkmark_circle")
            }
        }
        else {
            
            smpImageView.tintColor = UIColor(red: 214/255.0, green: 4/255.0, blue: 3/255.0, alpha: 1)
            if #available(iOS 13.0, *) {
                
                smpImageView.image = UIImage(systemName: "xmark.circle")
            } else {
                
                smpImageView.image = UIImage(named: "multiply")
            }
        }
        
    }
    
    
    // MARK: - Public
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        setupEquipmentoViewController()
        informationView.setCardView(view: informationView)
        reportProblemButton.setButtonStyle(Button: reportProblemButton, cornerRadius: 10)
        registerHoursButton.setButtonStyle(Button: registerHoursButton, cornerRadius: 10)
        setupInfo()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        super.viewWillAppear(true)
        hideTabBar()
    }
    
    
    

    
    
    
    // MARK: - Action
    
    
    @IBAction func segmentControlAction(_ sender: Any) {
        
        let getIndex = segmentControl.selectedSegmentIndex
        
        switch (getIndex) {
            
        case 0:
            self.historyView.fadeIn()
            self.informationView.fadeOut()
            
        case 1:
            self.historyView.fadeOut()
            self.informationView.fadeIn()
            
        default: break
        }
    }
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if (segue.identifier == "RegisterHoursSegue") {
            
            let destinationVC = segue.destination as! RegisterEquipmentHoursViewController
            destinationVC.Equipmento = self.equipment
        }
        if (segue.identifier == "ReportProblemSegue") {
            
            let destinationVC = segue.destination as! ReportProblemViewController
            if #available(iOS 13, *) {
                           
                           destinationVC.modalPresentationStyle = .popover
                       } else {
                           
                           destinationVC.modalPresentationStyle = .overCurrentContext
                       }
            destinationVC.Equipment = self.equipment
        }
    }
    
    
    
    
    
    
}
