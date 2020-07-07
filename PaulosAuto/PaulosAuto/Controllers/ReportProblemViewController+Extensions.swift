//
//  ReportProblemViewController+Extensions.swift
//  PaulosAuto
//
//  Created by Gonçalo Neves on 20/05/2020.
//  Copyright © 2020 Gonçalo Neves. All rights reserved.
//

import UIKit
import MobileCoreServices
import Photos
import QuickLook

extension ReportProblemViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    
    // MARK: - Public
    
    
    func showAlert() {
        
        DispatchQueue.main.async {
            
        let alert = UIAlertController(title: "Seleção de anexo", message: "De onde pretende selecionar o anexo?", preferredStyle: .actionSheet)
        alert.addAction(UIAlertAction(title: "Camera", style: .default, handler: {(action: UIAlertAction) in
            self.openCamera()
        }))
        alert.addAction(UIAlertAction(title: "Galeria", style: .default, handler: {(action: UIAlertAction) in
            self.openGallery()
        }))
        alert.addAction(UIAlertAction(title: "Cancelar", style: .destructive, handler: nil))
        
        self.present(alert, animated: true, completion: nil)
        }
    }
    
    func openCamera()
    {
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerController.SourceType.camera) {
            
            let Picker = UIImagePickerController()
            Picker.delegate = self
            Picker.mediaTypes = ["public.image", "public.movie"]
            Picker.sourceType = UIImagePickerController.SourceType.camera
            Picker.allowsEditing = true
            DispatchQueue.main.async {
                
                self.present(Picker, animated: true, completion: nil)
            }
        }
        else {
            
            let alert  = UIAlertController(title: "Warning", message: "Câmera inexistente", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            DispatchQueue.main.async {
                
                self.present(alert, animated: true, completion: nil)
            }
        }
    }
    
    func openGallery()
    {
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerController.SourceType.photoLibrary){
            
            let Picker = UIImagePickerController()
            Picker.delegate = self
            Picker.mediaTypes = ["public.image", "public.movie"]
            Picker.allowsEditing = true
            Picker.sourceType = UIImagePickerController.SourceType.photoLibrary
            DispatchQueue.main.async {
                
                self.present(Picker, animated: true, completion: nil)
            }
        }
        else
        {
            
            let alert  = UIAlertController(title: "Erro", message: "Não existem permissões para aceder à Galeria.", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            DispatchQueue.main.async {
                
                self.present(alert, animated: true, completion: nil)
            }
        }
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        
        picker.dismiss(animated: true) { [weak self] in
            
            guard
                let mediaType = info[UIImagePickerController.InfoKey.mediaType] as? String else { return }
            if mediaType == (kUTTypeMovie as String) {
                
                let fileManager = FileManager.default
                let documentsPath = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first
                let videoPath = documentsPath?.appendingPathComponent("\(NSUUID().uuidString)" + ".mov")
                
                
                let url = info[UIImagePickerController.InfoKey.mediaURL] as? URL
                
                var videoData = AttachmentReportProblemStruct()
                var videoModel = VideoModel()
                
                videoModel.urlPath = url
                videoModel.name = url?.lastPathComponent
                videoModel.data = NSData(contentsOf: videoModel.urlPath!) as Data?
                try! videoModel.data?.write(to: videoPath!)
                videoModel.urlPath = videoPath
                
                
                videoData.video = videoModel
                
                self?.attachmentArray.append(videoData)
                self?.collectionView.reloadData()
                return
            }
            if mediaType == (kUTTypeImage as String) {
                
                
                let fileManager = FileManager.default
                let documentsPath = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first
                let imagePath = documentsPath?.appendingPathComponent("\(NSUUID().uuidString)" + ".jpg")
                
                if let pickedImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
                    
                    let data = pickedImage.jpegData(compressionQuality: 0.75)
                    try! data?.write(to: imagePath!)
                    var imageData = AttachmentReportProblemStruct()
                    var imageModel = ImageModel()
                    imageModel.data = data
                    imageModel.urlPath = imagePath
                    imageModel.name = imagePath?.lastPathComponent
                    imageData.image = imageModel
                    self?.attachmentArray.append(imageData)
                    self?.collectionView.reloadData()
                    
                }
                
            }
            return
        }
    }
}

func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
    picker.dismiss(animated: true, completion: nil)
}


extension ReportProblemViewController : UICollectionViewDataSource {
    
    
    // MARK: - Public
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return attachmentArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewReportProblemAttachmentsCell", for: indexPath) as! CollectionViewReportProblemAttachmentsCell
        
        for view in cell.cellView.subviews
        {
            if view != cell.previewImageView && view != cell.previewImageOuterView {
                
                view.removeFromSuperview()
            }
        }
        
        if let imageData = attachmentArray[indexPath.row]?.image?.data {
            
            cell.previewImageView.image = UIImage(data:imageData)
            cell.previewImageView.contentMode = .scaleAspectFit
            let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(self.PreviewAttachment(_:)))
            cell.previewImageView.isUserInteractionEnabled = true
            cell.previewImageView.tag = indexPath.row
            cell.previewImageView.addGestureRecognizer(tapGestureRecognizer)
        }
        else if let videoUrl = attachmentArray[indexPath.row]?.video?.urlPath {
            
            self.getThumbnailFromUrl(videoUrl.absoluteString) { [weak self] (img) in
                
                guard let _ = self else { return }
                if let img = img {
                    
                    cell.previewImageView.contentMode = .scaleAspectFit
                    cell.previewImageView.image = img
                    
                    let playerPopUp: UIImage = UIImage(named: "play_circle")!
                    let imageViewPlayerPopUp = UIImageView(image: playerPopUp)
                    
                    imageViewPlayerPopUp.contentMode = .scaleAspectFit
                    imageViewPlayerPopUp.translatesAutoresizingMaskIntoConstraints = false
                    imageViewPlayerPopUp.tintColor = .redTransparent60
                    
                    cell.cellView.addSubview(imageViewPlayerPopUp)
                    let centerXConst = NSLayoutConstraint(item: imageViewPlayerPopUp, attribute: .centerX, relatedBy: .equal, toItem: cell.cellView, attribute: .centerX, multiplier: 1.0, constant: 0.0)
                    let centerYConst = NSLayoutConstraint(item: imageViewPlayerPopUp, attribute: .centerY, relatedBy: .equal, toItem: cell.cellView, attribute: .centerY, multiplier: 1.0, constant: 0.0)
                    NSLayoutConstraint.activate([centerXConst, centerYConst])
                    let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(self?.PreviewAttachment(_:)))
                    cell.previewImageView.isUserInteractionEnabled = true
                    cell.previewImageView.tag = indexPath.row
                    cell.previewImageView.addGestureRecognizer(tapGestureRecognizer)
                    
                    
                    
                }
            }
        }
        
        let deleteButton = UIButton()
        deleteButton.setImage(UIImage(named: "multiply"), for: .normal)
        deleteButton.backgroundColor = .redTransparent60
        deleteButton.tintColor = .black
        deleteButton.layer.cornerRadius = 10
        
        
        cell.previewImageOuterView.addSubview(deleteButton)
        deleteButton.translatesAutoresizingMaskIntoConstraints = false
        deleteButton.topConstraint(constant: 0)
        deleteButton.rightConstraint(constant: 0)
        deleteButton.frame.size.width = 20
        deleteButton.frame.size.height = 20
        
        deleteButton.tag = indexPath.row
        deleteButton.addTarget(self, action: #selector(deleteAttachment), for: .touchUpInside)
        
        return cell
    }
}

extension ReportProblemViewController : QLPreviewControllerDataSource, QLPreviewControllerDelegate {
    
    func numberOfPreviewItems(in controller: QLPreviewController) -> Int {
        
        return 1
    }
    
    func previewController(_ controller: QLPreviewController, previewItemAt index: Int) -> QLPreviewItem {
        
        return previewItem
    }
    
    func previewFile(fileName: String) {
        
        var fileFound : Bool = false
        
        do {
            
            let docURL = try FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
            let contents = try FileManager.default.contentsOfDirectory(at: docURL, includingPropertiesForKeys: [.fileResourceTypeKey], options: .skipsHiddenFiles)
            for url in contents {
                
                if url.description.contains(fileName) {
                    
                    fileFound = true
                    let previewController = PreviewController()
                    self.previewItem = PreviewItem(url:url)
                    previewController.dataSource = self
                    DispatchQueue.main.async {
                        
                        self.present(previewController,animated: true, completion: nil)
                    }
                }
            }
            if !fileFound {
                
                addInformativeAlert(alertControllerTitle: "Ficheiro não encontrado", message: "Não foi possível abrir o ficheiro pretendido, tente novamente", alertActionTitle: "Sair")
            }
            return
        } catch {
            
            addInformativeAlert(alertControllerTitle: "Erro no acesso à diretoria", message: "Não foi possível abrir o ficheiro pretendido, tente novamente", alertActionTitle: "Sair")
        }
    }
}









