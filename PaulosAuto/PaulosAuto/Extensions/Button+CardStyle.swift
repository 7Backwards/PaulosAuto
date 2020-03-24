//
//  Button+CardStyle.swift
//  PaulosAuto
//
//  Created by Gonçalo Neves on 23/03/2020.
//  Copyright © 2020 Gonçalo Neves. All rights reserved.
//

import Foundation
import UIKit

extension UIButton {
    
    // MARK: - Functions
    
    func setButtonStyle(Button: UIButton,
    
    color: UIColor = .black,
    cornerRadius: Int = 15
    ) {
        
        
    Button.backgroundColor = color
        Button.layer.cornerRadius = CGFloat(cornerRadius)
    Button.clipsToBounds = false
    Button.layer.applySketchShadow(color: .black, alpha: 0.16, x: 0, y: 3, blur: 6, spread: 0)

    }
}
