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
        searchBar.searchTextField.layer.cornerRadius = 25
        searchBar.searchTextField.clipsToBounds = false
        searchBar.searchTextField.layer.masksToBounds = false
        searchBar.searchTextField.layer.applySketchShadow(color: .black, alpha: 0.16, x: 0, y: 3, blur: 6, spread: 0)
    }
    
    func hideTabBar() {
        var frame = self.tabBarController?.tabBar.frame
        frame!.origin.y = self.view.frame.size.height + (frame?.size.height)!
        UIView.animate(withDuration: 0.5, animations: {
            self.tabBarController?.tabBar.frame = frame!
            self.tabBarController?.tabBar.isHidden = true
        })
        
    }
    
    func showTabBar() {
        var frame = self.tabBarController?.tabBar.frame
        frame!.origin.y = self.view.frame.size.height - (frame?.size.height)!
        UIView.animate(withDuration: 0.5, animations: {
            self.tabBarController?.tabBar.frame = frame!
            self.tabBarController?.tabBar.isHidden = false
        })
        
    }
    

    
}


    

