//
//  PerfilViewController.swift
//  PaulosAuto
//
//  Created by Gonçalo Neves on 16/05/2020.
//  Copyright © 2020 Gonçalo Neves. All rights reserved.
//

import UIKit

class PerfilViewController: ViewController {
    
    
    // MARK: - Outlets
    
    
    @IBOutlet weak var cardView: UIView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var signOutStackView: UIStackView!
    
    
    // MARK: - Properties
    
    
    var user : UserModel?
    
    
    // MARK: - Override inherited functions
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        SetupView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        super.viewWillAppear(true)
        
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        let touch = touches.first!
        if touch.view?.tag == 400 {
            
            signout()
        }
    }
    
    // MARK: - Private

    
    private func SetupView() {
        
        super.addNavBarLogo()
        cardView.setCardView()
        if let data = UserDefaults.standard.value(forKey:"user") as? Data {
            
            user = try? PropertyListDecoder().decode(UserModel.self, from: data)
        }
        if let name = user?.name {
            
            nameLabel.text = "\(name)"
        }
    }
}
