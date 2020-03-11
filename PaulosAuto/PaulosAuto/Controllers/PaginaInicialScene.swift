//
//  PaginaInicialScene.swift
//  PaulosAuto
//
//  Created by Gonçalo Neves on 11/03/2020.
//  Copyright © 2020 Gonçalo Neves. All rights reserved.
//

import UIKit

class PaginaInicialScene: ViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
       addNavBarImage()
    }
    
    func addNavBarImage() {
           let imageView = UIImageView(image: #imageLiteral(resourceName: "Paulosauto-2"))
           imageView.frame = CGRect(x: 0, y: 0, width: 170, height: 30)
           imageView.contentMode = .scaleAspectFit

           let titleView = UIView(frame: CGRect(x: 0, y: 0, width: 170, height: 30))

           titleView.addSubview(imageView)
           titleView.backgroundColor = .clear
           self.navigationItem.titleView = titleView
           }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
