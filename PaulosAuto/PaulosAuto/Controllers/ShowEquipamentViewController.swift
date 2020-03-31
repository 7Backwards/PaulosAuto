//
//  ShowEquipamentoViewController.swift
//  PaulosAuto
//
//  Created by Gonçalo Neves on 23/03/2020.
//  Copyright © 2020 Gonçalo Neves. All rights reserved.
//

import UIKit

class ShowEquipamentViewController: ViewController {
    
    
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
    var equipment : equipament!
    
    
    // MARK: - Private
    
    private func setupEquipamentoViewController() {
        
        super.addNavBarLogo()
        navigationItem.leftBarButtonItem?.tintColor = UIColor(red: 214/255.0, green: 4/255.0, blue: 3/255.0, alpha: 1)
    }
    
    
    // MARK: - Public
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        setupEquipamentoViewController()
        informationView.setCardView(view: informationView)
        reportProblemButton.setButtonStyle(Button: reportProblemButton, cornerRadius: 10)
        registerHoursButton.setButtonStyle(Button: registerHoursButton, cornerRadius: 10)
        setupInfo()
    }
    
    override func viewWillAppear(_ animated: Bool) { 
        super.viewWillAppear(true)
        hideTabBar()
        
    }
    
    
    
    func setupInfo() {
        
        
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
            
            if #available(iOS 13.0, *) {
                smpImageView.image = UIImage(systemName: "checkmark.circle")
            } else {
                // Fallback on earlier versions
            }
        }
        else {
            
            if #available(iOS 13.0, *) {
                smpImageView.image = UIImage(systemName: "xmark.circle")
            } else {
                // Fallback on earlier versions
            }
        }
        
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
            destinationVC.equipamento = self.equipment
        }
        if (segue.identifier == "ReportProblemSegue") {
            let destinationVC = segue.destination as! ReportProblemViewController
            destinationVC.equipament = self.equipment
        }
    }
    
    
    
    
    
    
}
