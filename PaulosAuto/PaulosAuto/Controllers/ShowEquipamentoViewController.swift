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
    @IBOutlet weak var RegistarUtilizacaoButton: UIButton!
    @IBOutlet weak var ReportarProblemaButton: UIButton!
    @IBOutlet weak var modeloEquipamento: UILabel!
    @IBOutlet weak var tipoEquipamento: UILabel!
    @IBOutlet weak var serialNumberEquipamento: UILabel!
    @IBOutlet weak var imageEquipamento: UIImageView!
    @IBOutlet weak var segmentControl: UISegmentedControl!
    
    
    
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
        
        modeloEquipamento.text = equipamento.modelo
        modeloEquipamento.textColor = .red
        tipoEquipamento.text = equipamento.tipo
        serialNumberEquipamento.text = equipamento.serialNumber
        imageEquipamento.contentMode = .scaleAspectFill
        imageEquipamento.image = UIImage(named: equipamento.imagem!)
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
    
    
}



