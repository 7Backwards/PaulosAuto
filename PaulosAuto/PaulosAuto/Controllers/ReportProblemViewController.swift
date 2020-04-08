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
    @IBOutlet weak var scrollView: UIScrollView!
    
    
    // MARK: - Properties
    
    var Equipment : Equipment!
    var activeField: UITextField?
    
    
    // MARK: - Private
    
    private func setupView() {
        
        reportProblemButton.setButtonStyle(Button: reportProblemButton, cornerRadius: 10)
        
        serialNumberLabel.text = Equipment.serialNumber
        
        currentHourTextField.layer.masksToBounds = true
        currentHourTextField.layer.borderWidth = 0.6
        currentHourTextField.layer.cornerRadius = 10
        
        problemDescriptionTextField.layer.masksToBounds = true
        problemDescriptionTextField.layer.borderWidth = 0.6
        problemDescriptionTextField.layer.cornerRadius = 10
        
        modelLabel.text = Equipment.model
        
        handlerView.layer.masksToBounds = true
        handlerView.layer.cornerRadius = 3
        
    }
    
    
    // MARK: - Public
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        setupView()
    }
    
    override func viewWillAppear(_ animated:Bool) {
        
        super.viewWillAppear(animated)
        
        view.addGestureRecognizer(UIPanGestureRecognizer(target: self, action: #selector(onDrage(_:))))
        
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    
    // MARK: - Action
    
    
    @objc func keyboardWillHide(notification: NSNotification) {
        
        let contentInsets = UIEdgeInsets.zero
        
        self.scrollView.contentInset = contentInsets
        self.scrollView.scrollIndicatorInsets = contentInsets
        
    }
    
    @objc func keyboardWillShow(notification: NSNotification) {
        
        let userInfo = notification.userInfo!
        let keyboardScreenEndFrame = (userInfo[UIResponder.keyboardFrameEndUserInfoKey] as! NSValue).cgRectValue
        let keyboardViewEndFrame = view.convert(keyboardScreenEndFrame, from: view.window)
        
        scrollView.contentInset = UIEdgeInsets(top : 0, left : 0, bottom: 1.1 * keyboardViewEndFrame.height, right : 0)
        scrollView.scrollIndicatorInsets = scrollView.contentInset
        
        
    }
    
   
    
    
    
    
    
    
}




