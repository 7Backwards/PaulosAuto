//
//  RegisterEquipmentHoursViewController.swift
//  PaulosAuto
//
//  Created by Gonçalo Neves on 26/03/2020.
//  Copyright © 2020 Gonçalo Neves. All rights reserved.
//

import UIKit

class RegisterEquipmentHoursViewController: ViewController {

    
    // MARK: - Outlets
    
    
    @IBOutlet weak var PopUpView: UIView!
    @IBOutlet weak var submitHoursButton: UIButton!
    @IBOutlet weak var serialNumberLabel: UILabel!
    @IBOutlet weak var currentHoursLabel: UILabel!
    @IBOutlet weak var closeButton: UIButton!
    @IBOutlet weak var currentHoursTextField: UITextField!
    
    
    // MARK: - Properties
    
    
    var equipamento : equipament!
    
    
    // MARK: - Public
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        PopUpView.setCardView(view: PopUpView)
       submitHoursButton.setButtonStyle(Button: submitHoursButton, cornerRadius: 10)
        currentHoursLabel.text = "\(equipamento.currentHours!) H"
        let textFieldBorderColor : UIColor = UIColor( red: 31/255.00, green: 119/255.0, blue:54/255.00, alpha: 1.0 )
        serialNumberLabel.text = equipamento.serialNumber
        submitHoursButton.layer.masksToBounds = true
        submitHoursButton.layer.borderColor = textFieldBorderColor.cgColor
        submitHoursButton.layer.borderWidth = 1.0
        submitHoursButton.layer.cornerRadius = 10
        
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
