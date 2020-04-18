//
//  ViewController.swift
//  PaulosAuto
//
//  Created by Gonçalo Neves on 10/03/2020.
//  Copyright © 2020 Gonçalo Neves. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    // MARK: - Public
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        debugPrint("viewDidLoad")
    }
    
    func getFormattedDate(date: Date, format: String) -> String {
        
            let dateformat = DateFormatter()
            dateformat.dateFormat = format
            return dateformat.string(from: date)
    }
    
    func addNavBarLogo() {
        
        let imageView = UIImageView(image: #imageLiteral(resourceName: "Paulosauto-2"))
        imageView.frame = CGRect(x: 0, y: -15, width: 100, height: 70)
        imageView.contentMode = .scaleAspectFit
        let titleView = UIView(frame: CGRect(x: 0, y: -15, width: 100, height: 70))
        titleView.addSubview(imageView)
        titleView.backgroundColor = .clear
        self.navigationItem.titleView = titleView
    }
    
    
    
    func setSearchBarStyle(searchBar: UISearchBar) {
        
        searchBar.textField?.borderStyle = .none
        searchBar.layer.cornerRadius = 10
        searchBar.layer.applySketchShadow(color: .black, alpha: 0.16, x: 0, y: 3, blur: 6, spread: 0)
        searchBar.layer.masksToBounds = false
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
    
    @objc func onDrage(_ sender:UIPanGestureRecognizer) {
        
        let percentThreshold:CGFloat = 0.3
        let translation = sender.translation(in: view)
        let newY = ensureRange(value: view.frame.minY + translation.y, minimum: view.safeAreaInsets.top, maximum: view.frame.size.height)
        let progress = progressAlongAxis(newY, view.bounds.width)
        view.frame.origin.y = newY
        
        if sender.state == .ended {
            
            let velocity = sender.velocity(in: view)
            if velocity.y >= 300 || progress > percentThreshold {
                
                self.dismiss(animated: true)
            } else {
                
                UIView.animate(withDuration: 0.2, animations: {
                    
                    self.view.frame.origin.y = 0
                })
            }
        }
        sender.setTranslation(.zero, in: view)
    }
    
    func progressAlongAxis(_ pointOnAxis: CGFloat, _ axisLength: CGFloat) -> CGFloat {
        
        let movementOnAxis = pointOnAxis / axisLength
        let positiveMovementOnAxis = fmaxf(Float(movementOnAxis), 0.0)
        let positiveMovementOnAxisPercent = fminf(positiveMovementOnAxis, 1.0)
        return CGFloat(positiveMovementOnAxisPercent)
    }
    
    func ensureRange<T>(value: T, minimum: T, maximum: T) -> T where T : Comparable {
        
        return min(max(value, minimum), maximum)
    } 
}




