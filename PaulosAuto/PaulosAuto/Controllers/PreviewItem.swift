//
//  PreviewItem.swift
//  PaulosAuto
//
//  Created by Gonçalo Neves on 19/05/2020.
//  Copyright © 2020 Gonçalo Neves. All rights reserved.
//

import Foundation
import QuickLook


class PreviewItem: NSObject, QLPreviewItem {
    
    
    var previewItemURL: URL?
    var previewItemTitle: String?
    
    
    init(url: URL?, title: String? = nil) {
        
        previewItemURL = url
        previewItemTitle = title
    }
}
