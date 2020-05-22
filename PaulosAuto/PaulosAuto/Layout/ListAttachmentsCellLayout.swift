//
//  ListAttachmentsCellLayout.swift
//  PaulosAuto
//
//  Created by Gonçalo Neves on 20/05/2020.
//  Copyright © 2020 Gonçalo Neves. All rights reserved.
//

import Foundation
import UIKit


class ListAttachmentsCellLayout : UICollectionViewFlowLayout {

    
    // MARK: - Properties


    var itemHeight: CGFloat {

        return collectionView!.frame.height
    }


    

    override var itemSize: CGSize {

       set {
        self.itemSize = CGSize(width: itemHeight, height: itemHeight)
       }
       get {
           return CGSize(width: itemHeight, height: itemHeight)
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
        scrollDirection = .horizontal
    }

    override func targetContentOffset(forProposedContentOffset proposedContentOffset: CGPoint) -> CGPoint {
        
        return collectionView!.contentOffset
    }
}
