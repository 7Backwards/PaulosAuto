//
//  GridFlowLayout.swift
//  PaulosAuto
//
//  Created by Neves on 12/03/2020.
//  Copyright © 2020 Gonçalo Neves. All rights reserved.
//

import Foundation
import UIKit
class GridFlowLayout: UICollectionViewFlowLayout {
    
    let itemHeight: CGFloat = 200
    
    override init() {
        
        super.init()
        setupLayout()
    }
    
    required init?(coder aDecoder: NSCoder) {
        
        super.init(coder: aDecoder)
        setupLayout()
    }
    
    func setupLayout() {
        
        minimumInteritemSpacing = 1
        minimumLineSpacing = 1
        scrollDirection = .vertical
    }
    
    var itemWidth: CGFloat {
        
        return collectionView!.frame.width / 2 - 1
    }
    
    override var itemSize: CGSize {
        
        set {
            
            self.itemSize = CGSize(width: itemWidth, height: itemHeight)
        }
        get {
            
            return CGSize(width: itemWidth, height: itemHeight)
        }
    }
    
    override func targetContentOffset(forProposedContentOffset proposedContentOffset: CGPoint) -> CGPoint {
        
        return collectionView!.contentOffset
    }
}
