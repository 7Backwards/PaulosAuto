//
//  ReportProblemViewController+Extensions.swift
//  PaulosAuto
//
//  Created by Gonçalo Neves on 20/05/2020.
//  Copyright © 2020 Gonçalo Neves. All rights reserved.
//

import UIKit
import MobileCoreServices

extension ReportProblemViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func showAlert() {
        
        let alert = UIAlertController(title: "Seleção de Imagem", message: "De onde pretende selecionar a imagem?", preferredStyle: .actionSheet)
        alert.addAction(UIAlertAction(title: "Camera", style: .default, handler: {(action: UIAlertAction) in
            self.openCamera()
        }))
        alert.addAction(UIAlertAction(title: "Galeria", style: .default, handler: {(action: UIAlertAction) in
            self.openGallery()
        }))
        alert.addAction(UIAlertAction(title: "Cancelar", style: .destructive, handler: nil))
        
        
        self.present(alert, animated: true, completion: nil)
        
    }
    
    func openCamera()
    {
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerController.SourceType.camera) {
            let Picker = UIImagePickerController()
            Picker.delegate = self
            Picker.mediaTypes = ["public.image", "public.movie"]
            Picker.sourceType = UIImagePickerController.SourceType.camera
            Picker.allowsEditing = true
            self.present(Picker, animated: true, completion: nil)
        }
        else
        {
            let alert  = UIAlertController(title: "Warning", message: "Câmera inexistente", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
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
            self.present(Picker, animated: true, completion: nil)
        }
        else
        {
            let alert  = UIAlertController(title: "Erro", message: "Não existem permissões para aceder à Galeria.", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    
    //MARK:-- ImagePicker delegate
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        
        picker.dismiss(animated: true) { [weak self] in
            
            guard
                let mediaType = info[UIImagePickerController.InfoKey.mediaType] as? String else { return }
            if mediaType == (kUTTypeMovie as String) {
                
                let url = info[UIImagePickerController.InfoKey.mediaURL] as? URL
                
                var videoData = AttachmentReportProblemStruct()
                videoData.video = url
                
                self?.attachmentArray.append(videoData)
                self?.collectionView.reloadData()
                return
            }
            if mediaType == (kUTTypeImage as String) {
                
                let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage
                var imageData = AttachmentReportProblemStruct()
                
                imageData.image = image
                
                self?.attachmentArray.append(imageData)
                
                self?.collectionView.reloadData()
                return
                
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
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewReportProblemCell", for: indexPath) as! CollectionViewReportProblemCell
        
        if let image = attachmentArray[indexPath.row]?.image {
            
            cell.previewImageView.image = image
        }
        else if let video = attachmentArray[indexPath.row]?.video {
            
            self.getThumbnailFromUrl(video.absoluteString) { [weak self] (img) in
                
                guard let _ = self else { return }
                if let img = img {
                    cell.previewImageView.contentMode = .scaleAspectFit
                    
                    cell.previewImageView.image = img
                    let image: UIImage = UIImage(named: "play_circle")!
                    let imageView = UIImageView(image: image)
                    imageView.contentMode = .scaleAspectFit
                    imageView.translatesAutoresizingMaskIntoConstraints = false
                    imageView.tintColor = .redTransparent60
                    //add to sub view
                    cell.cellView.addSubview(imageView)
                    let centerXConst = NSLayoutConstraint(item: imageView, attribute: .centerX, relatedBy: .equal, toItem: cell.cellView, attribute: .centerX, multiplier: 1.0, constant: 0.0)
                    let centerYConst = NSLayoutConstraint(item: imageView, attribute: .centerY, relatedBy: .equal, toItem: cell.cellView, attribute: .centerY, multiplier: 1.0, constant: 0.0)
                    NSLayoutConstraint.activate([centerXConst, centerYConst])
                    
                }
            }
        }
        
        cell.deleteButton.layer.cornerRadius = 10
        cell.deleteButton.tag = indexPath.row
        cell.deleteButton.addTarget(self, action: #selector(deleteAttachment), for: .touchUpInside)
        return cell
    }
}


extension ReportProblemViewController: UICollectionViewDelegate {
    
    
    // MARK: - Public
    
    
    
}

