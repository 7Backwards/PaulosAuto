//
//  ReportProblemInfoViewController+Extensions.swift
//  PaulosAuto
//
//  Created by Neves on 17/06/2020.
//  Copyright © 2020 Gonçalo Neves. All rights reserved.
//

import Foundation
import UIKit
import QuickLook


extension ReportProblemInfoViewController : UICollectionViewDataSource {
    
    
    // MARK: - Public
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return problemAttachment.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewInfoReportProblemAttachmentsCell", for: indexPath) as! CollectionViewInfoReportProblemAttachmentsCell
        
        if let imageUrl = problemAttachment[indexPath.row].image?.urlPath {
            
            UIImage.loadFrom(url: imageUrl) { image in
                
                cell.previewImageView.image = image
                cell.previewImageView.contentMode = .scaleAspectFit
            }
        }
        else if let videoUrl = problemAttachment[indexPath.row].video?.urlPath {
            
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
                }
            }
        }
        return cell
    }
    

}

extension ReportProblemInfoViewController : UICollectionViewDelegate {
 
     func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        self.previewAttachment(index:indexPath.row)
    }
}

extension ReportProblemInfoViewController : QLPreviewControllerDataSource, QLPreviewControllerDelegate {
    
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
                    
                    DispatchQueue.main.async {
                        
                        fileFound = true
                        let previewController = PreviewController()
                        self.previewItem = PreviewItem(url:url)
                        previewController.dataSource = self
                        self.present(previewController,animated: false, completion: nil)
                        return
                    }
                }
            }
            if !fileFound {
                
                removeHUDLoading()
                addInformativeAlert(alertControllerTitle: "Ficheiro não encontrado", message: "Não foi possível abrir o ficheiro pretendido, tente novamente", alertActionTitle: "Sair")
            }
            return
        } catch {
            
            addInformativeAlert(alertControllerTitle: "Erro no acesso à diretoria", message: "Não foi possível abrir o ficheiro pretendido, tente novamente", alertActionTitle: "Sair")
        }
    }
}

