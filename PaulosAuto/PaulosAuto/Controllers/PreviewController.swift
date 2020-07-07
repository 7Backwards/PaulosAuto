//
//  PreviewController.swift
//  PaulosAuto
//
//  Created by Gonçalo Neves on 19/05/2020.
//  Copyright © 2020 Gonçalo Neves. All rights reserved.
//

import Foundation
import QuickLook


class PreviewController: QLPreviewController {
    
    
    // MARK: - Properties
    
    
    var statusbarHidden: Bool = false
    var statusBarStyle: UIStatusBarStyle = .default
    
    
    // MARK: - Override inherited properties
    
    
    override var prefersStatusBarHidden: Bool {
        
        return statusbarHidden
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        
        return statusBarStyle
    }
}
