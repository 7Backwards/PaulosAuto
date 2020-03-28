//
//  ReportarProblemaViewController.swift
//  PaulosAuto
//
//  Created by Gonçalo Neves on 26/03/2020.
//  Copyright © 2020 Gonçalo Neves. All rights reserved.
//

import UIKit

class ReportarProblemaViewController: ViewController {
    
    
    // MARK: - Outlets
    
    
    
    @IBOutlet weak var reportarProblemaButton: UIButton!
    @IBOutlet weak var numeroSerieLabel: UILabel!
    @IBOutlet weak var utilizacaoAtualTextField: UITextField!
    @IBOutlet weak var modeloEquipamentoLabel: UILabel!
    @IBOutlet weak var descricaoProblemaTextField: UITextField!
    @IBOutlet weak var handlerView: UIView!
    
    
    // MARK: - Properties
    
    
    var equipamento : equipamento!
    
    
    // MARK: - Private
    
    private func setupView() {
        
        reportarProblemaButton.setButtonStyle(Button: reportarProblemaButton, cornerRadius: 10)
        
        numeroSerieLabel.text = equipamento.serialNumber
        
        utilizacaoAtualTextField.layer.masksToBounds = true
        utilizacaoAtualTextField.layer.borderWidth = 0.6
        utilizacaoAtualTextField.layer.cornerRadius = 10
        
        descricaoProblemaTextField.layer.masksToBounds = true
        descricaoProblemaTextField.layer.borderWidth = 0.6
        descricaoProblemaTextField.layer.cornerRadius = 10
        
        modeloEquipamentoLabel.text = equipamento.modelo
        
        handlerView.layer.masksToBounds = true
        handlerView.layer.cornerRadius = 5
    }
    
    
    // MARK: - Public
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        
    }
    
    
    func dismisspopup() {
        
        dismiss(animated: true, completion: nil)
    }
    
}
