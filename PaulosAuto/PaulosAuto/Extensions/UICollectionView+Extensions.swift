//
//  UICollectionView+Extensions.swift
//  PaulosAuto
//
//  Created by Gonçalo Neves on 31/03/2020.
//  Copyright © 2020 Gonçalo Neves. All rights reserved.
//

import Foundation

extension UICollectionView {

    func setBottomInset(to value: CGFloat) {
        let edgeInset = UIEdgeInsets(top: 0, left: 0, bottom: value, right: 0)

        self.contentInset = edgeInset
        self.scrollIndicatorInsets = edgeInset
    }
}
