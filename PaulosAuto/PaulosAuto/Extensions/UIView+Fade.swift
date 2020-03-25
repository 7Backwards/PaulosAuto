//
//  UIView+Fade.swift
//  PaulosAuto
//
//  Created by Gonçalo Neves on 25/03/2020.
//  Copyright © 2020 Gonçalo Neves. All rights reserved.
//

import Foundation
import UIKit



extension UIView {
    
    
    func fadeIn(Duration: TimeInterval? = 0.5) {
        UIView.animate(withDuration: Duration ?? 0.5) {
            
            self.alpha = 0
        }
        self.isHidden = true
    }
    
    func fadeOut(Duration: TimeInterval? = 0.5) {
        self.isHidden = false
        UIView.animate(withDuration: Duration ?? 0.5) {
            
            self.alpha = 1
        }
        
    }
    
    
    
}
