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
    @IBOutlet weak var barView: UIView!
    
    
    // MARK: - Properties
    
    
    var serialNumberID: String!
    var equipment : Equipment!
    
    
    // MARK: - Private
    
    
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
    
    private func setupView() {
        
        super.addNavBarLogo()
        navigationItem.leftBarButtonItem?.tintColor = UIColor(red: 214/255.0, green: 4/255.0, blue: 3/255.0, alpha: 1)
        fixBackgroundSegmentControl(segmentControl)
        segmentControl.backgroundColor = .clear
        segmentControl.tintColor = .clear
        segmentControl.setTitleTextAttributes([
            NSAttributedString.Key.font : UIFont(name: "DINCondensed-Bold", size: 20) as Any,
            NSAttributedString.Key.foregroundColor: UIColor.lightGray
        ], for: .normal)
        segmentControl.setTitleTextAttributes([
            NSAttributedString.Key.font : UIFont(name: "DINCondensed-Bold", size: 20) as Any,
            NSAttributedString.Key.foregroundColor: UIColor.black
        ], for: .selected)
        
        barView.widthAnchor.constraint(equalTo: segmentControl.widthAnchor, multiplier: 1 / CGFloat(segmentControl.numberOfSegments)).isActive = true
        
        informationView.setCardView(view: informationView)
        reportProblemButton.setButtonStyle(Button: reportProblemButton, cornerRadius: 10)
        registerHoursButton.setButtonStyle(Button: registerHoursButton, cornerRadius: 10)
    }
    
    
    // MARK: - Public
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        setupView()
        setupInfo()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        super.viewWillAppear(true)
        hideTabBar()
    }
    
    
    // MARK: - Action
    
    
    @objc func segmentedControlValueChanged(_ sender: UISegmentedControl) {
        
        UIView.animate(withDuration: 0.3) {
            
            self.barView.frame.origin.x = (CGFloat(self.segmentControl.frame.width) / CGFloat(self.segmentControl.numberOfSegments)) * CGFloat(self.segmentControl.selectedSegmentIndex) + self.segmentControl.frame.origin.x
            
        }
    }
    
    
    @IBAction func segmentControlAction(_ sender: Any) {
        
        let getIndex = segmentControl.selectedSegmentIndex
        
        switch (getIndex) {
            
        case 0:
            self.historyView.fadeIn()
            self.informationView.fadeOut()
            self.segmentedControlValueChanged(self.segmentControl)
            
        case 1:
            self.historyView.fadeOut()
            self.informationView.fadeIn()
            self.segmentedControlValueChanged(self.segmentControl)
            
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
            destinationVC.modalPresentationStyle = .overCurrentContext
            destinationVC.Equipment = self.equipment
        }
    }
    
    
    
    
    
    
}
