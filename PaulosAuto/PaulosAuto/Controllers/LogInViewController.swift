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
                        
                        self.performSegue(withIdentifier: "LogInSegue", sender: self)
                    }
                    else {
                        
                        let alert = UIAlertController(title: "Inicio de Sessão sem sucesso", message: "Credenciais incorretas, Por favor tente novamente", preferredStyle: UIAlertController.Style.alert)

                        alert.addAction(UIAlertAction(title: "Tentar Novamente", style: UIAlertAction.Style.default, handler: nil))

                        self.present(alert, animated: true, completion: nil)
                    }
                }
            }
            else if let error = error {
                
                self.removeHUDLoading()
                print(error)
            }
        })
    }
    
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
}
