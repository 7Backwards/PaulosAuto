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
    
    func leftConstraint( constant: CGFloat ) {
        
        let constaint = NSLayoutConstraint(item: self, attribute: .leading, relatedBy: .equal, toItem: self.superview, attribute: .leading, multiplier: 1, constant: constant)
        self.superview?.addConstraint(constaint)
    }
    
    func rightConstraint( constant: CGFloat ) {
        
        let constaint = NSLayoutConstraint(item: self, attribute: .trailing, relatedBy: .equal, toItem: self.superview, attribute: .trailing, multiplier: 1, constant: constant)
        self.superview?.addConstraint(constaint)
    }
    
    func topConstraint( constant: CGFloat ) {
        
        let constaint = NSLayoutConstraint(item: self, attribute: .top, relatedBy: .equal, toItem: self.superview, attribute: .top, multiplier: 1, constant: constant)
        self.superview?.addConstraint(constaint)
    }
    
    func bottomConstraint( constant: CGFloat ) {
        
        let constaint = NSLayoutConstraint(item: self, attribute: .bottom, relatedBy: .equal, toItem: self.superview, attribute: .bottom, multiplier: 1, constant: constant)
        self.superview?.addConstraint(constaint)
    }
    
    func widthConstraint(constant: CGFloat) {
        
        let constaint = NSLayoutConstraint(item: self, attribute: .width, relatedBy: .equal, toItem: self.superview, attribute: .width, multiplier: 1, constant: constant)
        self.superview?.addConstraint(constaint)
        
    }
    
    func heightConstraint(constant: CGFloat) {
        
        let constaint = NSLayoutConstraint(item: self, attribute: .height, relatedBy: .equal, toItem: self.superview, attribute: .height, multiplier: 1, constant: constant)
        self.superview?.addConstraint(constaint)
        
    }
    
    func centerXConstraint(constant: CGFloat) {
        
        let constaint = NSLayoutConstraint(item: self, attribute: .centerX, relatedBy: .equal, toItem: self.superview, attribute: .centerX, multiplier: 1, constant: constant)
        self.superview?.addConstraint(constaint)
        
    }
    
    func centerYConstraint(constant: CGFloat) {
        
        let constaint = NSLayoutConstraint(item: self, attribute: .centerY, relatedBy: .equal, toItem: self.superview, attribute: .centerY, multiplier: 1, constant: constant)
        self.superview?.addConstraint(constaint)
        
    }
    
    
    func setCardView(view : UIView){
        
        view.layer.cornerRadius = 10
        view.layer.applySketchShadow(color: .black, alpha: 0.16, x: 0, y: 3, blur: 6, spread: 0)
        view.layer.masksToBounds = false
        view.clipsToBounds = false
        
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
