//
//  RegistarHorasViewController.swift
//  PaulosAuto
//
//  Created by Gonçalo Neves on 26/03/2020.
//  Copyright © 2020 Gonçalo Neves. All rights reserved.
//

import UIKit

class RegistarHorasViewController: ViewController {

    
    // MARK: - Outlets
    
    
    @IBOutlet weak var PopUpView: UIView!
    @IBOutlet weak var registarHorasButton: UIButton!
    @IBOutlet weak var numeroSerieLabel: UILabel!
    @IBOutlet weak var utilizacaoLabel: UILabel!
    @IBOutlet weak var closeButton: UIButton!
    @IBOutlet weak var stackViewPopUp: UIStackView!
    
    
    // MARK: - Properties
    
    
    var equipamento : equipamento!
    
    
    // MARK: - Public
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        PopUpView.setCardView(view: PopUpView)
       registarHorasButton.setButtonStyle(Button: registarHorasButton, cornerRadius: 10)
        utilizacaoLabel.text = "\(equipamento.utilizacao!) H"
        numeroSerieLabel.text = equipamento.serialNumber
        
    }
    

    func dismisspopup() {
        
        dismiss(animated: true, completion: nil)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        let touch = touches.first!
        if touch.view?.tag != 800 {
            
            dismisspopup()
        }

    }
    
    
    // MARK: - Actions
    
    
    @IBAction func closeButtonAction(_ sender: Any) {
        
        dismisspopup()
    }
    

    
    
}
