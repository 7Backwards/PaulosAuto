//
//  UIButton+Extensions.swift
//  PaulosAuto
//
//  Created by Gonçalo Neves on 23/03/2020.
//  Copyright © 2020 Gonçalo Neves. All rights reserved.
//

import UIKit


extension UIButton {

    
    // MARK: - Public
    
    
    func setButtonStyle(
                        cornerRadius: Int = 15
    ) {
        
        self.layer.cornerRadius = CGFloat(cornerRadius)
        self.clipsToBounds = false
        self.layer.applySketchShadow(color: .black, alpha: 0.16, x: 0, y: 3, blur: 6, spread: 0)
        
    }
    
    func disableButton() {
        
        self.isEnabled = false
        self.alpha = 0.7
    }
    
    func enableButton() {
        
        self.isEnabled = true
        self.alpha = 1
    }
}
