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
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        setupView()
        setupInfo()
    }
    
    
    // MARK: - Private
    
    
    private func dismisspopup() {
        
        dismiss(animated: true, completion: nil)
    }
    
    private func setupView() {
        
        popUpView.setCardView()
        collectionView.dataSource = self
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
    
}
