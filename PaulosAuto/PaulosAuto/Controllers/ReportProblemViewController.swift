//
//  ReportarProblemaViewController.swift
//  PaulosAuto
//
//  Created by Gonçalo Neves on 26/03/2020.
//  Copyright © 2020 Gonçalo Neves. All rights reserved.
//

import UIKit

class ReportProblemViewController: ViewController {
    
    
    // MARK: - Outlets
    
    
    
    @IBOutlet weak var reportProblemButton: UIButton!
    @IBOutlet weak var serialNumberLabel: UILabel!
    @IBOutlet weak var currentHourTextField: UITextField!
    @IBOutlet weak var modelLabel: UILabel!
    @IBOutlet weak var problemDescriptionTextField: UITextField!
    @IBOutlet weak var handlerView: UIView!
    
    
    // MARK: - Properties
    
    
    var equipament : equipament!
    
    
    // MARK: - Private
    
    private func setupView() {
        
        reportProblemButton.setButtonStyle(Button: reportProblemButton, cornerRadius: 10)
        
        serialNumberLabel.text = equipament.serialNumber
        
        currentHourTextField.layer.masksToBounds = true
        currentHourTextField.layer.borderWidth = 0.6
        currentHourTextField.layer.cornerRadius = 10
        
        problemDescriptionTextField.layer.masksToBounds = true
        problemDescriptionTextField.layer.borderWidth = 0.6
        problemDescriptionTextField.layer.cornerRadius = 10
        
        modelLabel.text = equipament.model
        
        handlerView.layer.masksToBounds = true
        handlerView.layer.cornerRadius = 3
    }
    
    
    // MARK: - Public
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        setupView()
        
    }
    
    
    func dismisspopup() {
        
        dismiss(animated: true, completion: nil)
    }
    
}
