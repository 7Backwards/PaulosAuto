//
//  UIView+Extensions.swift
//  PaulosAuto
//
//  Created by Neves on 17/03/2020.
//  Copyright © 2020 Gonçalo Neves. All rights reserved.
//

import UIKit

extension UIView {
    
    
    // MARK: - Public
    
    
    func setCardView(view : UIView){
        
        view.layer.cornerRadius = 10
        view.layer.applySketchShadow(color: .black, alpha: 0.16, x: 0, y: 3, blur: 6, spread: 0)
        view.layer.masksToBounds = false
    }
    
    func setCardViewTopCorners(view : UIView){
        
        view.layer.cornerRadius = 30
        view.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
        view.layer.applySketchShadow(color: .black, alpha: 0.16, x: 0, y: -0.1, blur: 6, spread: 0)
        view.layer.masksToBounds = false
    }
    
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
