//
//  LogInViewController.swift
//  PaulosAuto
//
//  Created by Gonçalo Neves on 13/05/2020.
//  Copyright © 2020 Gonçalo Neves. All rights reserved.
//

import UIKit


class LogInViewController: ViewController {
    
    
    // MARK: - Outlets
    
    
    @IBOutlet weak var logInButton: UIButton!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var scrollView: UIScrollView!
    
    
    // MARK: - Properties
    
    
    var user : UserModel?
    
    
    // MARK: - Override inherited functions
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated:Bool) {
        
        super.viewWillAppear(animated)
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    

    // MARK: - Objc functions
    
    @objc func keyboardWillHide(notification: NSNotification) {
        
        let contentInsets = UIEdgeInsets.zero
        
        self.scrollView.contentInset = contentInsets
        self.scrollView.scrollIndicatorInsets = scrollView.contentInset
    }
    
    @objc func keyboardWillShow(notification: NSNotification) {
        
        let userInfo = notification.userInfo!
        let keyboardScreenEndFrame = (userInfo[UIResponder.keyboardFrameEndUserInfoKey] as! NSValue).cgRectValue
        let keyboardViewEndFrame = view.convert(keyboardScreenEndFrame, from: view.window)
        
        scrollView.contentInset = UIEdgeInsets(top : 0, left : 0, bottom: keyboardViewEndFrame.height, right : 0)
        scrollView.scrollIndicatorInsets = scrollView.contentInset
    }
    
    
    // MARK: - Actions
    
    
    @IBAction func logInButtonPressed(_ sender: Any) {
        
        guard
            let email = emailTextField.text, !email.isEmpty
            else {
                return
        }
        
        guard
            let password = passwordTextField.text, !password.isEmpty
            else {
                return
        }
        self.addHUDLoading()
        RQ_LogIn().repos(email: email,password:password, { (userData,error) in
            if let userData = userData {
                
                DispatchQueue.main.async {
                    
                    self.user = userData
                    self.removeHUDLoading()
                    if self.user?.token != nil {
                        
                        UserDefaults.standard.set(try? PropertyListEncoder().encode(self.user), forKey:"user")
                        let appDel:AppDelegate = UIApplication.shared.delegate as! AppDelegate
                        let mainStoryBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
                        
                        let centerVC = mainStoryBoard.instantiateViewController(withIdentifier: "TabBarVC") as! TabBarViewController
                        
                        // setting the login status to true
                        UserDefaults.standard.set(true, forKey: "isUserLoggedIn")
                        UserDefaults.standard.synchronize()
                        appDel.window!.rootViewController = centerVC
                        appDel.window!.makeKeyAndVisible()
                        self.performSegue(withIdentifier: "LogInSegue", sender: self)
                    }
                    else {
                        
                        super.addInformativeAlert(alertControllerTitle: "Inicio de Sessão sem sucesso", message: "Credenciais incorretas, por favor tente novamente", alertActionTitle: "Tentar Novamente")
                    }
                }
            }
            else if error != nil {
                
                self.removeHUDLoading()
                DispatchQueue.main.async {
                    
                    self.addInformativeAlert(alertControllerTitle: "Erro", message: "Erro no processo de inicio de sessão", alertActionTitle: "Tentar Novamente")
                }
            }
        })
    }
}
