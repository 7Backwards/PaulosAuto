//
//  ViewController.swift
//  PaulosAuto
//
//  Created by Gonçalo Neves on 10/03/2020.
//  Copyright © 2020 Gonçalo Neves. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    // MARK: - Constants
    
    
    
    
    
    
    // MARK: - Properties
    
    
    var activityView = UIActivityIndicatorView()
    var loadingView = UIView()
    var fullscreenView = UIView()
    
    // MARK: - Public
    
    
    func addHUDLoading() {
        
        fullscreenView.backgroundColor = .white
        fullscreenView.alpha = 0.4
        
        self.view.addSubview(fullscreenView)
        fullscreenView.translatesAutoresizingMaskIntoConstraints = false
        
        
        let leftConstraint = NSLayoutConstraint(item: fullscreenView, attribute: .leading, relatedBy: .equal, toItem: view, attribute: .leading, multiplier: 1, constant: 0)
        
        let rightConstraint = NSLayoutConstraint(item: fullscreenView, attribute: .trailing, relatedBy: .equal, toItem: view, attribute: .trailing, multiplier: 1, constant: -0)
        
        let bottomConstraint = NSLayoutConstraint(item: fullscreenView, attribute: .bottom, relatedBy: .equal, toItem: view, attribute: .bottom, multiplier: 1, constant: 0)
        
        let topConstraint = NSLayoutConstraint(item: fullscreenView, attribute: .top, relatedBy: .equal, toItem: view, attribute: .top, multiplier: 1, constant: -0)
        
        view.addConstraints([leftConstraint,rightConstraint,bottomConstraint,topConstraint])
        
        self.fullscreenView.addSubview(loadingView)
        loadingView.translatesAutoresizingMaskIntoConstraints = false
        
        
        let constraintWidth = NSLayoutConstraint(item: loadingView, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .width, multiplier: 1, constant: 80)
        
        let constraintHeight = NSLayoutConstraint(item: loadingView, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .height, multiplier: 1, constant: 80)
        
        let constraintCenterX = NSLayoutConstraint(item: loadingView, attribute: .centerX, relatedBy: .equal, toItem: fullscreenView, attribute: .centerX, multiplier: 1, constant: 0)
        
        let constraintCenterY = NSLayoutConstraint(item: loadingView, attribute: .centerY, relatedBy: .equal, toItem: fullscreenView, attribute: .centerY, multiplier: 1, constant: 0)
        
        view.addConstraints([constraintWidth,constraintHeight,constraintCenterX,constraintCenterY])
        
        loadingView.addSubview(activityView)
        activityView.translatesAutoresizingMaskIntoConstraints = false
        
        let constraintCenterX_1 = NSLayoutConstraint(item: activityView, attribute: .centerX, relatedBy: .equal, toItem: loadingView, attribute: .centerX, multiplier: 1, constant: 0)
        
        let constraintCenterY_1 = NSLayoutConstraint(item: activityView, attribute: .centerY, relatedBy: .equal, toItem: loadingView, attribute: .centerY, multiplier: 1, constant: 0)
        
        view.addConstraints([constraintCenterX_1,constraintCenterY_1])
        activityView.style = .whiteLarge
        activityView.color = .RedPaulosAuto
        activityView.hidesWhenStopped = true
        activityView.startAnimating()
        
        
        
        
    }
    
    func removeHUDLoading() {
        
        self.activityView.stopAnimating()
        activityView.removeFromSuperview()
        loadingView.removeFromSuperview()
        fullscreenView.removeFromSuperview()
    }
    
    func getFormattedDate(date: Date, format: String) -> String {
        
        let dateformat = DateFormatter()
        dateformat.dateFormat = format
        return dateformat.string(from: date)
    }
    
    func addNavBarLogo() {
        
        let imageView = UIImageView(image: CustomImage.NavBar.navBarLogo)
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




