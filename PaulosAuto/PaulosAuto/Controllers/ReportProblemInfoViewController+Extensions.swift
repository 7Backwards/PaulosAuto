//
//  ReportProblemInfoViewController+Extensions.swift
//  PaulosAuto
//
//  Created by Neves on 17/06/2020.
//  Copyright © 2020 Gonçalo Neves. All rights reserved.
//

import Foundation
import UIKit


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
