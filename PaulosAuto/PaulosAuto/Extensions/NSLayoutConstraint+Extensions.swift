//
//  NSLayoutConstraint+Extensions.swift
//  PaulosAuto
//
//  Created by Gonçalo Neves on 15/04/2020.
//  Copyright © 2020 Gonçalo Neves. All rights reserved.
//

import UIKit

extension NSLayoutConstraint {

    func changeMultiplier(_ constraint: NSLayoutConstraint, multiplier: CGFloat) -> NSLayoutConstraint {
      let newConstraint = NSLayoutConstraint(
        item: constraint.firstItem as Any,
        attribute: constraint.firstAttribute,
        relatedBy: constraint.relation,
        toItem: constraint.secondItem,
        attribute: constraint.secondAttribute,
        multiplier: multiplier,
        constant: constraint.constant)

      newConstraint.priority = constraint.priority

      NSLayoutConstraint.deactivate([constraint])
      NSLayoutConstraint.activate([newConstraint])

      return newConstraint
    }
    
    override public var description: String {
        let id = identifier ?? ""
        return "id: \(id), constant: \(constant)" //you may print whatever you want here
    }
}
