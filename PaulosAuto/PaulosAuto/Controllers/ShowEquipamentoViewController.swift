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
    
    @IBOutlet weak var cardView: UIView!
    @IBOutlet weak var RegistarUtilizacaoButton: UIButton!
    @IBOutlet weak var ReportarProblemaButton: UIButton!
    @IBOutlet weak var modeloEquipamento: UILabel!
    @IBOutlet weak var tipoEquipamento: UILabel!
    @IBOutlet weak var serialNumberEquipamento: UILabel!
    @IBOutlet weak var imageEquipamento: UIImageView!
    
    
    // MARK: - Properties
    
    var serialNumberID: String!
    var equipamento : equipamento!
    
    
    // MARK: - Private
    
    private func setupEquipamentoViewController() {
        
        super.addNavBarLogo()
        navigationItem.leftBarButtonItem?.tintColor = .red
    }
    
    
    // MARK: - Public
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        setupEquipamentoViewController()
        cardView.setCardView(view: cardView)
        ReportarProblemaButton.setButtonStyle(Button: ReportarProblemaButton,color: .red, cornerRadius: 10)
        RegistarUtilizacaoButton.setButtonStyle(Button: RegistarUtilizacaoButton,color: .white, cornerRadius: 10)
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
}
