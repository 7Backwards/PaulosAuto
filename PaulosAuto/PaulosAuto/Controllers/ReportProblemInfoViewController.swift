//
//  ReportProblemInfoViewController.swift
//  PaulosAuto
//
//  Created by Neves on 16/06/2020.
//  Copyright © 2020 Gonçalo Neves. All rights reserved.
//

import UIKit


class ReportProblemInfoViewController: ViewController {
    
    
    // MARK: - Outlets
    
    
    @IBOutlet var popUpView: UIView!
    @IBOutlet weak var closeButton: UIButton!
    @IBOutlet weak var serialNumberLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var descriptionTextView: UITextView!
    @IBOutlet weak var collectionView: UICollectionView!
    
    
    // MARK: - Properties
    
    
    var problemReported : ReportProblemModel?
    var problemAttachment = [AttachmentReportProblemStruct]()
    var previewItem: PreviewItem!
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        setupView()
        setupInfo()
        
    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        let touch = touches.first!
        if touch.view?.tag != 800 {
            
            dismisspopup()
        }
    }
    
    
    // MARK: - Private
    
    
    private func setupView() {
        
        popUpView.setCardView()
        collectionView.dataSource = self
        collectionView.delegate = self
    }
    
    private func setupInfo() {
        
        if let serialNumber = problemReported?.serialNumber {
            
            serialNumberLabel.text = serialNumber
        }
        
        if let date = problemReported?.date {
            
            dateLabel.text = getFormattedDate(date: date, format: "dd/MM/yyyy")
        }
        
        if let description = problemReported?.description {
            
            descriptionTextView.text = description
        }
        
        if let images = problemReported?.images {
            
            for image in images {
                
                var attachment = AttachmentReportProblemStruct()
                var imageModel = ImageModel()
                
                imageModel.urlPath = URL(string:image)
                
                attachment.image = imageModel
                
                problemAttachment.append(attachment)
                
                
            }
        }
        
        if let videos = problemReported?.videos {
            
            for video in videos {
                
                var attachment = AttachmentReportProblemStruct()
                var videoModel = VideoModel()
                
                videoModel.urlPath = URL(string:video)
                
                attachment.video = videoModel
                
                problemAttachment.append(attachment)
            }
        }
    }
    
    
    // MARK: - Actions
    
    
    @IBAction func closeButtonAction(_ sender: Any) {
        
        dismisspopup()
        
    }
    
    // MARK: - Objc functions
    
    func previewAttachment(index: Int) {
        
        
        if let image = problemAttachment[index].image {
            
            if let urlImage = image.urlPath {
                
                let fileName = "\(NSUUID().uuidString)" + ".jpg"
                
                saveURLFileLocally(fileName: fileName, url: urlImage.absoluteString) {(url, error)  in
                    if url != nil {
                        
                        self.previewFile(fileName: fileName)
                        
                    }
                    else if error != nil {
                        
                        DispatchQueue.main.async {
                            
                            self.addInformativeAlert(alertControllerTitle: "Erro", message: "Erro na visualização do anexo", alertActionTitle: "Tentar Novamente")
                        }
                    }
                }
            }
        }
        else if let video = problemAttachment[index].video {
            
            if let urlVideo = video.urlPath {
                
                let fileName = "\(NSUUID().uuidString)" + ".mov"
                
                saveURLFileLocally(fileName: fileName, url: urlVideo.absoluteString) {(url, error)  in
                    if url != nil {
                        
                        self.previewFile(fileName: fileName)
                        
                    }
                    else if error != nil {
                        
                        DispatchQueue.main.async {
                            
                            self.addInformativeAlert(alertControllerTitle: "Erro", message: "Erro na visualização do anexo", alertActionTitle: "Tentar Novamente")
                        }
                    }
                }
            }
        }
    }
}
