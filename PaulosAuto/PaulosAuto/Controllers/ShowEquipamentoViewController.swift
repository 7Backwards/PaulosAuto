//
//  ShowEquipamentoViewController.swift
//  PaulosAuto
//
//  Created by Gonçalo Neves on 23/03/2020.
//  Copyright © 2020 Gonçalo Neves. All rights reserved.
//

import UIKit

class ShowEquipamentoViewController: ViewController {
    
    
    // MARK: - Outlets
    
    
    @IBOutlet weak var informacoesView: UIView!
    @IBOutlet weak var historicoView: UIView!
    @IBOutlet weak var segmentControl: UISegmentedControl!
    @IBOutlet weak var modeloEquipamentoLabel: UILabel!
    @IBOutlet weak var serialNumberEquipamentoLabel: UILabel!
    @IBOutlet weak var tipoEquipamentoLabel: UILabel!
    @IBOutlet weak var dataContratoLabel: UILabel!
    @IBOutlet weak var dataInicioContratoLabel: UILabel!
    @IBOutlet weak var dataFimContratoLabel: UILabel!
    @IBOutlet weak var marcaEquipamentoLabel: UILabel!
    @IBOutlet weak var matriculaEquipamentoLabel: UILabel!
    @IBOutlet weak var utilizacaoEquipamentoLabel: UILabel!
    @IBOutlet weak var imageEquipamento: UIImageView!
    @IBOutlet weak var ativoContratoImage: UIImageView!
    @IBOutlet weak var RegistarUtilizacaoButton: UIButton!
    @IBOutlet weak var ReportarProblemaButton: UIButton!
    
    
    
    // MARK: - Properties
    
    var serialNumberID: String!
    var equipamento : equipamento!
    
    
    // MARK: - Private
    
    private func setupEquipamentoViewController() {
        
        super.addNavBarLogo()
        navigationItem.leftBarButtonItem?.tintColor = UIColor(red: 214/255.0, green: 4/255.0, blue: 3/255.0, alpha: 1)
    }
    
    
    // MARK: - Public
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        setupEquipamentoViewController()
        informacoesView.setCardView(view: informacoesView)
        ReportarProblemaButton.setButtonStyle(Button: ReportarProblemaButton, cornerRadius: 10)
        RegistarUtilizacaoButton.setButtonStyle(Button: RegistarUtilizacaoButton, cornerRadius: 10)
        setupInfo()
    }
    
    override func viewWillAppear(_ animated: Bool) { 
        super.viewWillAppear(true)
        hideTabBar()
        
    }
    
    
    
    func setupInfo() {
        
        
        modeloEquipamentoLabel.text = equipamento.modelo
        tipoEquipamentoLabel.text = equipamento.tipo
        serialNumberEquipamentoLabel.text = equipamento.serialNumber
        imageEquipamento.image = UIImage(named: equipamento.imagem!)
        dataContratoLabel.text = equipamento.dataContrato
        dataInicioContratoLabel.text = equipamento.datainicioContrato
        dataFimContratoLabel.text = equipamento.datafimContrato
        marcaEquipamentoLabel.text = equipamento.marca
        matriculaEquipamentoLabel.text = equipamento.matricula
        utilizacaoEquipamentoLabel.text = "\(equipamento.utilizacao!)"
        if (equipamento.ativo == true) {
            
            ativoContratoImage.image = UIImage(systemName: "checkmark.circle")
        }
        else {
            
            ativoContratoImage.image = UIImage(systemName: "xmark.circle")
        }
        
    }
    
    // MARK: - Action
    
    
    @IBAction func segmentControlAction(_ sender: Any) {
        
        let getIndex = segmentControl.selectedSegmentIndex
        
        switch (getIndex) {
            
        case 0:
            self.historicoView.fadeIn()
            self.informacoesView.fadeOut()
            
        case 1:
            self.historicoView.fadeOut()
            self.informacoesView.fadeIn()
            
        default: break
        }
    }
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if (segue.identifier == "RegistarHorasSegue") {
            let destinationVC = segue.destination as! RegistarHorasViewController
            destinationVC.equipamento = self.equipamento
        }
        if (segue.identifier == "ReportarProblemaSegue") {
            let destinationVC = segue.destination as! ReportarProblemaViewController
            destinationVC.equipamento = self.equipamento
        }
    }
    
    
    
    
    
    
}
