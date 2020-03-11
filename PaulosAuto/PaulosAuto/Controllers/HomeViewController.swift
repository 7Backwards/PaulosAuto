//
//  HomeViewController.swift
//  PaulosAuto
//
//  Created by Gonçalo Neves on 11/03/2020.
//  Copyright © 2020 Gonçalo Neves. All rights reserved.
//

import UIKit

class HomeViewController: ViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let image: UIView = UIImageView(image: UIImage(named: "Paulosauto-2.png"))
        image.contentMode = UIView.ContentMode.scaleAspectFit
        image.center = self.navigationItem.titleView?.center ??
        self.navigationItem.titleView = image
//        self.navigationItem.til
        
        
        let button1 = UIBarButtonItem(image: UIImage(systemName: "gear"), style: .plain, target: self, action: #selector(getter: UICommandAlternate.action))
        
        let button2 = UIBarButtonItem(image: UIImage(systemName : "gear"), style: .plain, target: self, action: #selector(getter: UICommandAlternate.action))
        button2.tintColor = .clear
        navigationItem.setRightBarButton(button1, animated: false)
        //navigationItem.setLeftBarButton(button2, animated: false)
        
    }
    
}
