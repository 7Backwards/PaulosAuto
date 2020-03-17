//
//  ViewController.swift
//  PaulosAuto
//
//  Created by Gonçalo Neves on 10/03/2020.
//  Copyright © 2020 Gonçalo Neves. All rights reserved.
//

import UIKit



class ViewController: UIViewController {
    
    // MARK: - Functions
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        debugPrint("viewDidLoad")
    }
    
    func addNavBarLogo() {
        
        let imageView = UIImageView(image: #imageLiteral(resourceName: "Paulosauto-2"))
        imageView.frame = CGRect(x: 0, y: -15, width: 200, height: 70)
        imageView.contentMode = .scaleAspectFit
        let titleView = UIView(frame: CGRect(x: 0, y: -15, width: 200, height: 70))
        titleView.addSubview(imageView)
        titleView.backgroundColor = .clear
        self.navigationItem.titleView = titleView
    }


    
    func setSearchBarStyle(searchBar: UISearchBar) {
        
        searchBar.searchTextField.borderStyle = .none
        searchBar.searchTextField.backgroundColor = .white
        searchBar.searchTextField.layer.cornerRadius = 15
        searchBar.searchTextField.clipsToBounds = false
        searchBar.searchTextField.layer.masksToBounds = false
        searchBar.searchTextField.layer.applySketchShadow(color: .black, alpha: 0.16, x: 0, y: 3, blur: 6, spread: 0)
    }
    
}

extension CALayer {
    
    func applySketchShadow(
        
        color: UIColor = .black,
        alpha: Float = 0.16,
        x: CGFloat = 0,
        y: CGFloat = 3,
        blur: CGFloat = 6,
        spread: CGFloat = 0)
    {
        shadowColor = color.cgColor
        shadowOpacity = alpha
        shadowOffset = CGSize(width: x, height: y)
        shadowRadius = blur / 2.0
        if spread == 0 {
            
            shadowPath = nil
        } else {
            
            let dx = -spread
            let rect = bounds.insetBy(dx: dx, dy: dx)
            shadowPath = UIBezierPath(rect: rect).cgPath
        }
    }
}


    

