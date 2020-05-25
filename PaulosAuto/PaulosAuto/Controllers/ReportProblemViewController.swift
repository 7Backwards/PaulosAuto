//
//  ReportProblemViewController.swift
//  PaulosAuto
//
//  Created by Gonçalo Neves on 26/03/2020.
//  Copyright © 2020 Gonçalo Neves. All rights reserved.
//

import UIKit

class ReportProblemViewController: ViewController, UITextViewDelegate {
    
    
    // MARK: - Outlets
    
    
    @IBOutlet weak var reportProblemButton: UIButton!
    @IBOutlet weak var serialNumberLabel: UILabel!
    @IBOutlet weak var modelLabel: UILabel!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var currentHoursTextField: UITextField!
    @IBOutlet weak var problemDescriptionTextView: UITextView!
    @IBOutlet weak var scrollViewBottomConstraint: NSLayoutConstraint!
    @IBOutlet weak var outerView: UIView!
    @IBOutlet weak var handlerView: UIView!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var collectionViewBackgroundView: UIView!
    
    
    let cellLayout = ListAttachmentsCellLayout()

    
    // MARK: - Properties
    
    
    var Equipment : EquipmentModel!
    var attachmentArray : [AttachmentReportProblemStruct?] = []
    
    
    // MARK: - Override inherited functions
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        setupView()
    }
    
    override func viewWillAppear(_ animated:Bool) {
        
        super.viewWillAppear(animated)
        
        view.addGestureRecognizer(UIPanGestureRecognizer(target: self, action: #selector(onDrage(_:))))
        
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        [currentHoursTextField].forEach({ $0.addTarget(self, action: #selector(editingChanged), for: .editingChanged) })
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        
        super.viewWillDisappear(animated)
        view.removeGestureRecognizer(UIPanGestureRecognizer(target: self, action: #selector(onDrage(_:))))
        NotificationCenter.default.removeObserver(self)
    }
    
    
    // MARK: - Private
    
    
    private func setupView() {
    
        reportProblemButton.setButtonStyle(cornerRadius: 10)
        
        serialNumberLabel.text = Equipment.serialNumber
        
        currentHoursTextField.layer.masksToBounds = true
        currentHoursTextField.layer.borderWidth = 0.6
        currentHoursTextField.layer.cornerRadius = 10
        
        problemDescriptionTextView.layer.masksToBounds = true
        problemDescriptionTextView.layer.borderWidth = 0.6
        problemDescriptionTextView.layer.cornerRadius = 10
        problemDescriptionTextView.isScrollEnabled = false
        problemDescriptionTextView.delegate = self
        
        modelLabel.text = Equipment.model
        
        handlerView.layer.masksToBounds = true
        handlerView.layer.cornerRadius = 3
        
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.collectionViewLayout = cellLayout
        
        reportProblemButton.disableButton()
        
        outerView.setCardViewTopCorners()
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
    
    @objc func editingChanged() {
        
        guard let problemDescription = problemDescriptionTextView.text, !problemDescription.isEmpty
            else {
                reportProblemButton.disableButton()
                return
        }
        guard let currentHours = currentHoursTextField.text, !currentHours.isEmpty
            else {
                reportProblemButton.disableButton()
                return
        }
        if currentHours.isInt {
            
            if let currentHoursInt = Int(currentHours) {
                
                if let lastRecordedHours = Equipment.currentHours {
                    
                    if currentHoursInt > lastRecordedHours {
                        
                        reportProblemButton.enableButton()
                    }
                }
            }
        }
        
    }
    
    func textViewDidBeginEditing(_ textView: UITextView) {

        editingChanged()

    }
    
    @objc func deleteAttachment(sender:UIButton!) {
        
        attachmentArray.remove(at: sender.tag)
        collectionView.reloadData()
    }
    
    @IBAction func cameraButtonPressed(_ sender: Any) {
        
        if attachmentArray.count < 5 {
            
            showAlert()
        }
        else {
            
            addInformativeAlert(alertControllerTitle: "Aviso", message: "Número máximo de ficheiros atingido", alertActionTitle: "Compreendo")
        }
    }
    
    @IBAction func reportProblemButtonPressed(_ sender: Any) {
        
        //É PRECISO GET USER ID mas neste momento a API nao está a dar essa informaçao
//        var user : UserModel?
//        if let data = UserDefaults.standard.value(forKey:"user") as? Data {
//            user = try? PropertyListDecoder().decode(UserModel.self, from: data)
//        }
//        if let clientNumber = user?. {
//
//            nameLabel.text = "\(name)"
//        }
        
        var imagesPOST : [ImageModel] = []
        for i in attachmentArray {
            
            if let image = i?.image {
                
                imagesPOST.append((image))
            }
        }
        
        var videoPOST : [VideoModel] = []
        for i in attachmentArray {
            
            if let video = i?.video {
                
                videoPOST.append((video))
            }
                
            
        }
        let postModel = ReportProblemPOSTModel(serialNumber: Equipment.serialNumber, imagens: imagesPOST, descricao: problemDescriptionTextView.text, videos: videoPOST, numeroCliente: 1)
        
        //var responseModel : ReportProblemResponseModel?
        
        RQ_SendReportProblem().repos(reportProblemPOST: postModel, { (responseModel,error) in
                if let response = responseModel {
                    DispatchQueue.main.async {
                    
                    AppConstants.requestDone = true
                        
                        self.addInformativeAlert(alertControllerTitle: "Sucesso", message: "Reporte efetuado com sucesso", alertActionTitle: "Ok")
                    }
                        
                }
                else if let error = error {
                    DispatchQueue.main.async {
                    switch error {
                        
                    case APPError.requestEntityTooLarge:
                        
                        self.addInformativeAlert(alertControllerTitle: "Erro", message: "Tamanho de ficheiros anexados demasiado grande", alertActionTitle: "Tentar novamente")
                        
                        
                    default:
                        self.addInformativeAlert(alertControllerTitle: "Erro", message: "Erro interno, contactar administrador", alertActionTitle: "Tentar novamente")
                        
                    }
                }
            }
            })
        }
    }





