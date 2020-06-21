//
//  ViewController.swift
//  PaulosAuto
//
//  Created by Gonçalo Neves on 10/03/2020.
//  Copyright © 2020 Gonçalo Neves. All rights reserved.
//

import UIKit
import PDFKit
import AVFoundation

class ViewController: UIViewController {
    
    
    // MARK: - Properties
    
    
    var activityView = UIActivityIndicatorView()
    var loadingView = UIView()
    var fullscreenView = UIView()
    var pdfview : PDFView?
    var backgroundView = UIView()
    
    
    // MARK: - Override inherited functions
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        UINavigationBar.appearance().tintColor = UIColor.RedPaulosAuto
    }
    
    
    // MARK: - Public
    
    
    func addHUDLoading() {
        
        self.view.addSubview(fullscreenView)
        
        fullscreenView.backgroundColor = .white
        fullscreenView.alpha = 0.4
        fullscreenView.translatesAutoresizingMaskIntoConstraints = false
        fullscreenView.leftConstraint(constant: 0)
        fullscreenView.rightConstraint(constant: 0)
        fullscreenView.topConstraint(constant: 0)
        fullscreenView.bottomConstraint(constant: 0)
        
        self.fullscreenView.addSubview(loadingView)
        
        loadingView.translatesAutoresizingMaskIntoConstraints = false
        loadingView.widthConstraint(constant: 80)
        loadingView.heightConstraint(constant: 80)
        loadingView.centerXConstraint(constant: 0)
        loadingView.centerYConstraint(constant: 0)
        
        self.loadingView.addSubview(activityView)
        
        activityView.translatesAutoresizingMaskIntoConstraints = false
        activityView.centerXConstraint(constant: 0)
        activityView.centerYConstraint(constant: 0)
        activityView.style = .whiteLarge
        activityView.color = .RedPaulosAuto
        activityView.hidesWhenStopped = true
        activityView.startAnimating()
    }
    
    func removeHUDLoading() {
        
        DispatchQueue.main.async {
            
            self.activityView.stopAnimating()
            self.activityView.removeFromSuperview()
            self.loadingView.removeFromSuperview()
            self.fullscreenView.removeFromSuperview()
        }

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
    
    func progressAlongAxis(_ pointOnAxis: CGFloat, _ axisLength: CGFloat) -> CGFloat {
        
        let movementOnAxis = pointOnAxis / axisLength
        let positiveMovementOnAxis = fmaxf(Float(movementOnAxis), 0.0)
        let positiveMovementOnAxisPercent = fminf(positiveMovementOnAxis, 1.0)
        return CGFloat(positiveMovementOnAxisPercent)
    }
    
    func ensureRange<T>(value: T, minimum: T, maximum: T) -> T where T : Comparable {
        
        return min(max(value, minimum), maximum)
    }
    
    func addInformativeAlert(alertControllerTitle: String, message: String,alertActionTitle: String) {
        
        let alert = UIAlertController(title: alertControllerTitle, message: message, preferredStyle: UIAlertController.Style.alert)
        
        alert.addAction(UIAlertAction(title: alertActionTitle, style: UIAlertAction.Style.default, handler: nil))
        
        
        self.present(alert, animated: true, completion: nil)
    }
    
    func displayPDF(pdfFileURL : URL) {
        
        backgroundView.backgroundColor = .white
        backgroundView.frame = self.view.bounds
        self.view.addSubview(backgroundView)
        pdfview = PDFView(frame:self.view.bounds)
        pdfview!.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        pdfview!.autoScales = true
        let doc = PDFDocument(url: pdfFileURL)
        self.pdfview!.document = doc
        self.hideTabBar()
        backgroundView.addSubview(self.pdfview!)
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(self.backButtonPressed))
        
    }
    
    func getThumbnailFromUrl(_ url: String?, _ completion: @escaping ((_ image: UIImage?)->Void)) {
        
        guard let url = URL(string: url ?? "") else { return }
        DispatchQueue.main.async {
            let asset = AVAsset(url: url)
            let assetImgGenerate = AVAssetImageGenerator(asset: asset)
            assetImgGenerate.appliesPreferredTrackTransform = true
            
            let time = CMTimeMake(value: 2, timescale: 1)
            do {
                let img = try assetImgGenerate.copyCGImage(at: time, actualTime: nil)
                let thumbnail = UIImage(cgImage: img)
                completion(thumbnail)
            } catch {
                completion(nil)
            }
        }
    }

    
    func saveURLFileLocally(fileName : String, url : String, _ completion: @escaping (URL?, Error?) -> Void) {
        
        let filePath : URL = {
            
            let fm = FileManager.default
            let docsurl = try! fm.url(
                for: .documentDirectory, in: .userDomainMask,
                appropriateFor: nil, create: true)
            return docsurl.appendingPathComponent(fileName)
        }()
        let fileurl = URL(string: url)!
        let sess = URLSession.shared
        sess.downloadTask(with: fileurl) { (url, resp, error) in
            if let url = url {
                
                let fm = FileManager.default
                try? fm.removeItem(at: filePath)
                try? fm.moveItem(at: url, to: filePath)
                completion(url,nil)
            }
            
            if error != nil {
                self.addInformativeAlert(alertControllerTitle: "Erro", message: "Ficheiro não encontrado", alertActionTitle: "Sair")
                completion(nil,error)
            }
        }.resume()
    }
    
    func signout() {
        
        UserDefaults.standard.set(false, forKey: "isUserLoggedIn")
        UserDefaults.standard.synchronize()
        
        DispatchQueue.main.async {
            
            let loginVC = self.storyboard?.instantiateViewController(withIdentifier: "LoginVC") as! LogInViewController
            let appDel:AppDelegate = UIApplication.shared.delegate as! AppDelegate
            
            appDel.window?.rootViewController = loginVC
            UserDefaults.standard.removeObject(forKey: "user")
            let LoginVC = self.storyboard?.instantiateViewController(withIdentifier: "LoginVC") as! LogInViewController
            
            
            self.navigationController?.pushViewController(LoginVC, animated: true)
            self.navigationController?.setNavigationBarHidden(true, animated: true)
            self.tabBarController?.tabBar.isHidden = true
        }
        
    }
        
    
    func dismisspopup() {
        
        dismiss(animated: true, completion: nil)
    }

    
    //  Not used as the final version of the API doesnt have token authentication implemented
    //    func  {
    //
    //        RQ_TokenAuthentication().repos( { (TokenResponse,error) in
    //            if TokenResponse != nil {
    //
    //                return
    //            }
    //            else if error != nil {
    //
    //                self.signout()
    //            }
    //        })
    //    }
    //
    //    func authenticateAdminToken(_ completion: @escaping (Bool) -> ()) {
    //
    //        RQ_TokenAdminAuthentication().repos( { (TokenResponse,error) in
    //            if TokenResponse != nil {
    //
    //                completion(true)
    //            }
    //            else {
    //
    //                completion(false)
    //            }
    //        })
    //
    //    }
    
    
    // MARK: - Objc functions
    
    
    @objc func backButtonPressed() {
        
        self.pdfview?.removeFromSuperview()
        self.backgroundView.removeFromSuperview()
        self.navigationItem.leftBarButtonItem = nil
        self.showTabBar()
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
}




