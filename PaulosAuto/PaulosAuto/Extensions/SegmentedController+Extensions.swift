//
//  SegmentedController+Extensions.swift
//  PaulosAuto
//
//  Created by Gonçalo Neves on 15/04/2020.
//  Copyright © 2020 Gonçalo Neves. All rights reserved.
//

import Foundation
import UIKit

extension UISegmentedControl {

    
    // MARK: - Private
    
    
    private func fixBackgroundSegmentControl( _ segmentControl: UISegmentedControl){
        if #available(iOS 13.0, *) {

            DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                
                for i in 0...(segmentControl.numberOfSegments-1)  {
                    
                    let backgroundSegmentView = segmentControl.subviews[i]
                    backgroundSegmentView.isHidden = true
                }
            }
        }
    }
    
    
    // MARK: - Public
    
    
    func setLayoutSegmentControl( _ segmentControl: UISegmentedControl){
        
        self.fixBackgroundSegmentControl(segmentControl)
        
        segmentControl.backgroundColor = .clear
        segmentControl.tintColor = .clear
        segmentControl.setTitleTextAttributes([
            NSAttributedString.Key.font : UIFont(name: "DINCondensed-Bold", size: 18) as Any,
            NSAttributedString.Key.foregroundColor: UIColor.lightGray
        ], for: .normal)
        segmentControl.setTitleTextAttributes([
            NSAttributedString.Key.font : UIFont(name: "DINCondensed-Bold", size: 18) as Any,
            NSAttributedString.Key.foregroundColor: UIColor.black
        ], for: .selected)
    }
}
