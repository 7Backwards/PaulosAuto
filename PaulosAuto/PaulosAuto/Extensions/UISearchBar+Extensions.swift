//
//  UISearchBar+Extensions.swift
//  PaulosAuto
//
//  Created by Gonçalo Neves on 06/04/2020.
//  Copyright © 2020 Gonçalo Neves. All rights reserved.
//

import Foundation
import UIKit

extension UISearchBar {

    var textField : UITextField? {
        
        if #available(iOS 13.0, *) {
            
            return self.searchTextField
        } else {
            
            // Fallback on earlier versions
            for view : UIView in (self.subviews[0]).subviews {
                if let textField = view as? UITextField {
                    return textField
                }
            }
        }
        return nil
    }
}
