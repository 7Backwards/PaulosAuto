//
//  UIView+Card.swift
//  PaulosAuto
//
//  Created by Neves on 17/03/2020.
//  Copyright © 2020 Gonçalo Neves. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
    
    // MARK: - Functions
    
    func setCardView(view : UIView){
        
        view.layer.cornerRadius = 10
        view.layer.applySketchShadow(color: .black, alpha: 0.16, x: 0, y: 3, blur: 6, spread: 0)
        view.layer.masksToBounds = false
    }
}
