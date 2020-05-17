//
//  PerfilViewController.swift
//  PaulosAuto
//
//  Created by Gonçalo Neves on 16/05/2020.
//  Copyright © 2020 Gonçalo Neves. All rights reserved.
//

import UIKit

class PerfilViewController: ViewController {

    
    var user : UserModel?
    
    // MARK: - Outlets
    
    
    @IBOutlet weak var cardView: UIView!
    @IBOutlet weak var nameLabel: UILabel!
    
    
    // MARK: - Override inherited functions
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        SetupView()
        if let data = UserDefaults.standard.value(forKey:"user") as? Data {
            user = try? PropertyListDecoder().decode(UserModel.self, from: data)
        }
        
        if let name = user?.name {
            nameLabel.text = "\(name)"
            
        }
        
    }
    
    // MARK: - Private

    
    private func SetupView() {
        
        super.addNavBarLogo()
        cardView.setCardView()
    }

}
