//
//  UISearchBar+Extensions.swift
//  PaulosAuto
//
//  Created by Gonçalo Neves on 06/04/2020.
//  Copyright © 2020 Gonçalo Neves. All rights reserved.
//

import UIKit


extension UISearchBar {

    
    // MARK: - Properties
    
    
    var textField : UITextField? {
        
        if #available(iOS 13.0, *) {
            
            return self.searchTextField
        } else {
            
            for view : UIView in (self.subviews[0]).subviews {
                if let textField = view as? UITextField {
                    return textField
                }
            }
        }
        return nil
    }
}
