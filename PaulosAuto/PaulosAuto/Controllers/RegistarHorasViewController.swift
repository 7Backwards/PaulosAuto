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
    @IBOutlet weak var utilizacaoAtualTextField: UITextField!
    
    
    // MARK: - Properties
    
    
    var equipamento : equipamento!
    
    
    // MARK: - Public
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        PopUpView.setCardView(view: PopUpView)
       registarHorasButton.setButtonStyle(Button: registarHorasButton, cornerRadius: 10)
        utilizacaoLabel.text = "\(equipamento.utilizacao!) H"
        let textFieldBorderColor : UIColor = UIColor( red: 31/255.00, green: 119/255.0, blue:54/255.00, alpha: 1.0 )
        numeroSerieLabel.text = equipamento.serialNumber
        utilizacaoAtualTextField.layer.masksToBounds = true
        utilizacaoAtualTextField.layer.borderColor = textFieldBorderColor.cgColor
        utilizacaoAtualTextField.layer.borderWidth = 1.0
        utilizacaoAtualTextField.layer.cornerRadius = 10
        
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
