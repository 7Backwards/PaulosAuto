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
    
    
    @IBOutlet weak var popUpView: UIView!
    @IBOutlet weak var submitHoursButton: UIButton!
    @IBOutlet weak var serialNumberLabel: UILabel!
    @IBOutlet weak var lastRegistHoursLabel: UILabel!
    @IBOutlet weak var closeButton: UIButton!
    @IBOutlet weak var currentHoursTextField: UITextField!
    
    
    // MARK: - Properties
    
    
    var Equipmento : Equipment!
    
    
    // MARK: - Private
    
    
    private func dismisspopup() {
        
        dismiss(animated: true, completion: nil)
    }
    
    private func setupView() {
        
        popUpView.setCardView(view: popUpView)
        submitHoursButton.setButtonStyle(Button: submitHoursButton, cornerRadius: 10)
        lastRegistHoursLabel.text = "\(Equipmento.currentHours!) H"
        let textFieldBorderColor : UIColor = UIColor( red: 31/255.00, green: 119/255.0, blue:54/255.00, alpha: 1.0 )
        serialNumberLabel.text = Equipmento.serialNumber
        submitHoursButton.layer.masksToBounds = true
        submitHoursButton.layer.borderColor = textFieldBorderColor.cgColor
        submitHoursButton.layer.borderWidth = 1.0
        submitHoursButton.layer.cornerRadius = 10
        
    }
    
    
    // MARK: - Public
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        setupView()
    }
    
    override func viewWillAppear(_ animated:Bool) {
        
        super.viewWillAppear(animated)
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
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
    
    @objc func keyboardWillShow(notification: Notification) {
        
        if let keyboardHeight = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue.height {
            
            self.popUpView.frame.origin.y = UIScreen.main.bounds.height - keyboardHeight - self.popUpView.frame.height - 10
        }
        
        
    }
    
    @objc func keyboardWillHide(notification: Notification) {
        
        self.popUpView.center.y = self.view.center.y
        
    }
    
    
    
    
}
