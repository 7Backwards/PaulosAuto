//
//  DataDelegate.swift
//  PaulosAuto
//
//  Created by Gonçalo Neves on 17/04/2020.
//  Copyright © 2020 Gonçalo Neves. All rights reserved.
//

import Foundation
import UIKit


protocol DataDelegate {
    
    func updateActiveCategoryFiltered(newActiveCategory: [String])
    func updateActiveOrderByFiltered(newOrderBy: Int)
    func reloadCollectionView()
}
