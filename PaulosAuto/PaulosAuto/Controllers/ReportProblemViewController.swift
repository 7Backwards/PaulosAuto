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
    @IBOutlet weak var modelLabel: UILabel!
    @IBOutlet weak var handlerView: UIView!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var currentHoursTextView: UITextView!
    @IBOutlet weak var problemDescriptionTextView: UITextView!
    @IBOutlet weak var scrollViewBottomConstraint: NSLayoutConstraint!
    @IBOutlet weak var outerView: UIView!
    
    
    // MARK: - Properties
    
    var Equipment : Equipment!
    
    
    // MARK: - Private
    
    private func setupView() {
        
        reportProblemButton.setButtonStyle(Button: reportProblemButton, cornerRadius: 10)
        
        serialNumberLabel.text = Equipment.serialNumber
        
        currentHoursTextView.layer.masksToBounds = true
        currentHoursTextView.layer.borderWidth = 0.6
        currentHoursTextView.layer.cornerRadius = 10
        currentHoursTextView.isScrollEnabled = false
        
        problemDescriptionTextView.layer.masksToBounds = true
        problemDescriptionTextView.layer.borderWidth = 0.6
        problemDescriptionTextView.layer.cornerRadius = 10
        problemDescriptionTextView.isScrollEnabled = false
        
        modelLabel.text = Equipment.model
        
        handlerView.layer.masksToBounds = true
        handlerView.layer.cornerRadius = 3
        
        outerView.setCardViewOverContext(view: outerView)
    }
    
    
    // MARK: - Public
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        setupView()
        self.scrollView.isScrollEnabled = true
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
        self.scrollView.scrollIndicatorInsets = scrollView.contentInset
    }
    
    @objc func keyboardWillShow(notification: NSNotification) {
        
        let userInfo = notification.userInfo!
        let keyboardScreenEndFrame = (userInfo[UIResponder.keyboardFrameEndUserInfoKey] as! NSValue).cgRectValue
        let keyboardViewEndFrame = view.convert(keyboardScreenEndFrame, from: view.window)
        
        scrollView.contentInset = UIEdgeInsets(top : 0, left : 0, bottom: 1.2 * keyboardViewEndFrame.height, right : 0)
        scrollView.scrollIndicatorInsets = scrollView.contentInset
    }
    
    
    
}




