//
//  ViewController.swift
//  PaulosAuto
//
//  Created by Gonçalo Neves on 10/03/2020.
//  Copyright © 2020 Gonçalo Neves. All rights reserved.
//

import UIKit



class ViewController: UIViewController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        debugPrint("viewDidLoad")
    }
    
    func addNavBarImage() {
        let imageView = UIImageView(image: #imageLiteral(resourceName: "Paulosauto-2"))
        imageView.frame = CGRect(x: 0, y: -20, width: 200, height: 70)
        imageView.contentMode = .scaleAspectFit
        
        let titleView = UIView(frame: CGRect(x: 0, y: -20, width: 200, height: 70))
        
        titleView.addSubview(imageView)
        titleView.backgroundColor = .clear
        self.navigationItem.titleView = titleView
    }
    
    
}

