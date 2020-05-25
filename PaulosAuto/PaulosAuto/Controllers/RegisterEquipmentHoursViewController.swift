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
    
    
    var Equipment : EquipmentModel!
    
    // MARK: - Override inherited functions
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        setupView()
    }
    
    override func viewWillAppear(_ animated:Bool) {
        
        super.viewWillAppear(animated)
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        [currentHoursTextField].forEach({ $0.addTarget(self, action: #selector(editingChanged), for: .editingChanged) })
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        let touch = touches.first!
        if touch.view?.tag != 800 {
            
            dismisspopup()
        }
    }
    
    
    // MARK: - Private
    
    
    private func dismisspopup() {
        
        dismiss(animated: true, completion: nil)
    }
    
    private func setupView() {
        
        let textFieldBorderColor : UIColor = .green
        popUpView.setCardView()
        submitHoursButton.setButtonStyle(cornerRadius: 10)
        lastRegistHoursLabel.text = "\(Equipment.currentHours!) H"
        serialNumberLabel.text = Equipment.serialNumber
        submitHoursButton.layer.masksToBounds = true
        submitHoursButton.layer.borderColor = textFieldBorderColor.cgColor
        submitHoursButton.layer.borderWidth = 1.0
        submitHoursButton.layer.cornerRadius = 10
        submitHoursButton.disableButton()
    }
    
    private func animateViewMoving (up:Bool, moveValue :CGFloat){
        let movementDuration:TimeInterval = 0.3
        let movement:CGFloat = ( up ? -moveValue : moveValue)

        UIView.beginAnimations("animateView", context: nil)
        UIView.setAnimationBeginsFromCurrentState(true)
        UIView.setAnimationDuration(movementDuration)

        self.view.frame = self.view.frame.offsetBy(dx: 0, dy: movement)
        UIView.commitAnimations()
    }
    
    
    // MARK: - Objc functions
    
    
    @objc func keyboardWillShow(notification: Notification) {
        
        if ((notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue.height) != nil {
            
            animateViewMoving(up: true, moveValue: (
                
                view.safeAreaLayoutGuide.layoutFrame.size.height - self.popUpView.frame.height)/2 - 10)
        }
    }
    
    @objc func editingChanged(_ textField: UITextField) {
        
        guard
            let currentHours = currentHoursTextField.text, !currentHours.isEmpty
        else {
            
            submitHoursButton.disableButton()
            return
        }
        if currentHours.isInt {
            
            if let currentHoursInt = Int(currentHours) {
                
                if let lastRecordedHours = Equipment.currentHours {
                    
                    if currentHoursInt > lastRecordedHours {
                        
                        submitHoursButton.enableButton()
                        return
                    }
                }
            }
        }
        return
    }
    
    
    // MARK: - Actions
    
    
    @IBAction func closeButtonAction(_ sender: Any) {
        
        dismisspopup()
    }
    
    @IBAction func submitButtonAction(_ sender: Any) {
        
        print("Enabled")
        
        RQ_SendEquipmentUtilization().repos(serialNumber: Equipment.serialNumber!, currentHours: Int(currentHoursTextField.text!)!, { (equipmentData,error) in
            if equipmentData != nil {
                
                AppConstants.requestDone = true
                DispatchQueue.main.async {
                    
                    self.addInformativeAlert(alertControllerTitle: "Sucesso", message: "Registo de horas de utilização efetuado com sucesso", alertActionTitle: "Ok")
                }
            }
            else if let error = error {
                
                print(error)
            }
        })
        dismisspopup()
    }
}


