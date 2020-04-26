//
//  ListEquipmentLayoutCell.swift
//  PaulosAuto
//
//  Created by Gonçalo Neves on 20/04/2020.
//  Copyright © 2020 Gonçalo Neves. All rights reserved.
//


import Foundation
import UIKit


class ListEquipmentCellLayout: UICollectionViewFlowLayout {
    
    // MARK: - Constants
    
      
    let itemHeight: CGFloat = 130
      
      
    // MARK: - Properties
      
      
    var itemWidth: CGFloat {
          
        return collectionView!.frame.width
    }
    
    override var itemSize: CGSize {
       
       set {
           self.itemSize = CGSize(width: itemWidth, height: itemHeight)
       }
       get {
           return CGSize(width: itemWidth, height: itemHeight)
       }
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
