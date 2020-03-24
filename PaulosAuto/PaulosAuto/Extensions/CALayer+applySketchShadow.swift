//
//  CALayer+SketchShadow.swift
//  PaulosAuto
//
//  Created by Neves on 17/03/2020.
//  Copyright © 2020 Gonçalo Neves. All rights reserved.
//

import UIKit


extension CALayer {
    
    func applySketchShadow(
        
        color: UIColor = .black,
        alpha: Float = 0.16,
        x: CGFloat = 0,
        y: CGFloat = 3,
        blur: CGFloat = 6,
        spread: CGFloat = 0)
    {
        shadowColor = color.cgColor
        shadowOpacity = alpha
        shadowOffset = CGSize(width: x, height: y)
        shadowRadius = blur / 2.0
        if spread == 0 {
            
            shadowPath = nil
        } else {
            
            let dx = -spread
            let rect = bounds.insetBy(dx: dx, dy: dx)
            shadowPath = UIBezierPath(rect: rect).cgPath
        }
    }
}
