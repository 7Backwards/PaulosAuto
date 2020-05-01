//
//  String+Extensions.swift
//  PaulosAuto
//
//  Created by Gonçalo Neves on 30/04/2020.
//  Copyright © 2020 Gonçalo Neves. All rights reserved.
//

import Foundation
import UIKit

extension String {
    
    
    // MARK: - Properties
    
    
    var isInt: Bool {
        
        return Int(self) != nil
    }
}
