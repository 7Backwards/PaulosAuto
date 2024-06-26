//
//  ShowEquipmentViewController.swift
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
    @IBOutlet weak var topView: UIView!
    @IBOutlet weak var historyCollectionView: UICollectionView!
    @IBOutlet weak var RegisterAndReportButtonsStackView: UIStackView!
    @IBOutlet weak var plateEquipmentStackView: UIStackView!
    
    
    // MARK: - Properties
    
    
    var serialNumberID: String!
    var equipment : EquipmentModel!
    var isAnimated = false
    var historyEquipment = [EquipmentHistory]()
    
    
    // MARK: - Constants
    
    
    let cellLayout = ListEquipmentHistoryCellLayout()
    
    
    // MARK: - Override inherited functions
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        setupShowEquipmentViewController()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        super.viewWillAppear(true)
        
        hideTabBar()
    }
    
    override func viewDidLayoutSubviews() {
        
        if isAnimated == false {
            
            super.viewDidLayoutSubviews()
            
            UIView.animate(withDuration: 1.0, animations: {
                
                self.barView.frame.origin.x = self.segmentControl.frame.origin.x
            }, completion: { _ in
                self.isAnimated = true
            })
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if (segue.identifier == "RegisterHoursSegue") {
            
            let destinationVC = segue.destination as! RegisterEquipmentHoursViewController
            destinationVC.Equipment = self.equipment
        }
        if (segue.identifier == "ReportProblemSegue") {
            
            let destinationVC = segue.destination as! ReportProblemViewController
            destinationVC.modalPresentationStyle = .overCurrentContext
            destinationVC.Equipment = self.equipment
        }
    }
    
    
    // MARK: - Private
    
    
    private func refreshData() {
        if let serialNumber = equipment.serialNumber {
            
            RQ_ListEquipmentHistory().repos(serialNumber: serialNumber, { (historyData,error) in
                if let historyData = historyData {
                    
                    DispatchQueue.main.async {
                        
                        for historyDataElement in historyData {
                            
                            if let interventions = historyDataElement.intervencoes {
                                
                                for intervention in interventions {
                                    
                                    var equipmentHistory = EquipmentHistory()
                                    
                                    equipmentHistory.date = intervention.dateIntervention
                                    equipmentHistory.hours = intervention.hours
                                    equipmentHistory.finalized = historyDataElement.finalizada
                                    var description = ""
                                    for descriptionElement in historyDataElement.descricaoIntervencao ?? [""] {
                                        
                                        if description != "" && descriptionElement != description {
                                            
                                            description = "\(description)" + "," + "\(descriptionElement)"
                                        }
                                        else {
                                            
                                            description = "\(descriptionElement)"
                                        }
                                        
                                    }
                                    equipmentHistory.description = description
                                    
                                    self.historyEquipment.append(equipmentHistory)
                                    
                                    self.historyEquipment = {
                                        return self.historyEquipment.sorted {
                                            var isSorted = false
                                            if let first = $0.date, let second = $1.date {
                                                
                                                isSorted = first > second
                                            }
                                            return isSorted
                                        }
                                        
                                    }()
                                }
                            }
                        }
                        self.historyCollectionView.reloadData()
                    }
                }
                else if error != nil {
                    
                    DispatchQueue.main.async {
                        
                        self.addInformativeAlert(alertControllerTitle: "Erro", message: "Erro na listagem do historico do equipamento", alertActionTitle: "Tentar Novamente")
                    }
                }
            })
        }
    }
    
    private func setupShowEquipmentViewController() {
        
        super.addNavBarLogo()
        authenticateToken()
        segmentControl.setLayoutSegmentControl(segmentControl)
        
        navigationItem.leftBarButtonItem?.tintColor = .RedPaulosAuto
        
        informationView.setCardView()
        
        reportProblemButton.setButtonStyle(cornerRadius: 10)
        registerHoursButton.setButtonStyle(cornerRadius: 10)
        topView.layer.applySketchShadow(color: .black, alpha: 0.16, x: 0, y: 0.1, blur: 6, spread: 0)
        topView.layer.masksToBounds = false
        historyCollectionView.collectionViewLayout = cellLayout
        historyCollectionView.dataSource = self
        
        modelLabel.text = equipment.model
        equipmentTypeLabel.text = equipment.type
        serialNumberLabel.text = equipment.serialNumber
        if let imageData = equipment.imageData  {
    
            self.equipmentImageView.image = UIImage(data: imageData)
        }
        if let dataStartAssignment = equipment.dateAssignment {
            
            dateAgreementLabel.text = getFormattedDate(date: dataStartAssignment, format: "dd/MM/yyyy")
        }
        
        if let dataStartAssignment = equipment.dateStartAssignment {
            
            dateStartAgreementLabel.text = getFormattedDate(date: dataStartAssignment, format: "dd/MM/yyyy")
        }
        
        if let dataEndAssignment = equipment.dateEndAssignment {
            
            dateEndAgreementLabel.text = getFormattedDate(date: dataEndAssignment, format: "dd/MM/yyyy")
        }
        
        brandLabel.text = equipment.brand
        
        if equipment.plate != nil {
            
            plateLabel.text = equipment.plate
        }
        else {
            
            plateEquipmentStackView.isHidden = true
        }
        
        currentHoursLabel.text = "\(equipment.currentHours!)"
        
        if (equipment.smp == true) {
            
            smpImageView.tintColor = .green
            
            if #available(iOS 13.0, *) {
                
                smpImageView.image = UIImage(systemName: "checkmark.circle")
            } else {
                
                smpImageView.image = UIImage(named: "checkmark_circle")
            }
        }
        else {
            
            smpImageView.tintColor = .RedPaulosAuto
            
            if #available(iOS 13.0, *) {
                
                smpImageView.image = UIImage(systemName: "xmark.circle")
            } else {
                
                smpImageView.image = UIImage(named: "multiply")
            }
        }
            refreshData()
    }
    
    
    // MARK: - Objc functions
    
    
    @objc func segmentedControlValueChanged(_ sender: UISegmentedControl) {
        
        UIView.animate(withDuration: 0.3) {
            
            self.barView.frame.origin.x = (CGFloat(self.segmentControl.frame.width) / CGFloat(self.segmentControl.numberOfSegments)) * CGFloat(self.segmentControl.selectedSegmentIndex) + self.segmentControl.frame.origin.x
        }
    }
    
    
    // MARK: - Actions
    
    
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
    
    
}
