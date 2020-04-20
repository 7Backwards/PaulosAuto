//
//  ListFlowLayout.swift
//  PaulosAuto
//
//  Created by Neves on 12/03/2020.
//  Copyright © 2020 Gonçalo Neves. All rights reserved.
//

import Foundation
import UIKit


class CategoriesEquipmentCellLayout : UICollectionViewFlowLayout {

    
    // MARK: - Constants
  
    
    let itemHeight: CGFloat = 80
    
    
    // MARK: - Properties
    
    
    var itemWidth: CGFloat {
        
        return collectionView!.frame.width
    }
    
    
    // MARK: - Public
    
    
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
        minimumLineSpacing = 10
        scrollDirection = .vertical
    }

    override func targetContentOffset(forProposedContentOffset proposedContentOffset: CGPoint) -> CGPoint {
        
        return collectionView!.contentOffset
    }
}
