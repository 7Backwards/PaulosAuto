//
//  InvoiceViewController.swift
//  PaulosAuto
//
//  Created by Neves on 11/03/2020.
//  Copyright © 2020 Gonçalo Neves. All rights reserved.
//

import UIKit
import PDFKit



class InvoiceViewController: ViewController {
    
    
    // MARK: - Outlets
    
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var noInvoicesView: UIView!
    
    
    // MARK: - Constants
    
    
    let cellLayout = ListEquipmentCellLayout()
    
    
    // MARK: - Properties
    
    
    var invoices =  [InvoiceModel]()
    var previewItem: PreviewItem!
    
    
    // MARK: - Override inherited functions
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        super.addNavBarLogo()
        collectionView.collectionViewLayout = cellLayout
        collectionView.dataSource = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        super.viewWillAppear(true)
        addHUDLoading()
        let id = 744
        RQ_ListInvoices().repos(username: id, { (invoicesData,error) in
            if let invoicesData = invoicesData {
                
                DispatchQueue.main.async {
                    
                    self.invoices = invoicesData
                    self.collectionView?.reloadData()
                    self.removeHUDLoading()
                    if self.invoices.count == 0 {
                        
                        self.noInvoicesView.isHidden = false
                        self.collectionView.isHidden = true
                    }
                    else {
                        
                        self.noInvoicesView.isHidden = true
                        self.collectionView.isHidden = false
                    }
                }
            }
            else if error != nil {
                
                DispatchQueue.main.async {
                    
                    self.addInformativeAlert(alertControllerTitle: "Erro", message: "Erro na listagem de faturas", alertActionTitle: "Tentar Novamente")
                }
            }
        })
    }
    
    
    // MARK: - Objc functions
    
    
    @objc func previewPDFButton(sender:UIButton!) {
        
        self.addHUDLoading()
        if let invoiceURL = invoices[sender.tag].docURL {
            
            let fileName = "\(invoices[sender.tag].diario ?? "")_\( invoices[sender.tag].ano ?? "").pdf"
            
            saveURLFileLocally(fileName: fileName, url: invoiceURL) {(url, error)  in
                if url != nil {
                    
                    DispatchQueue.main.async {
                        
                        self.removeHUDLoading()
                        self.previewFile(fileName: fileName)
                    }
                    
                }
                else if error != nil {
                    
                    DispatchQueue.main.async {
                        
                        self.removeHUDLoading()
                        self.addInformativeAlert(alertControllerTitle: "Erro", message: "Erro na visualização do PDF", alertActionTitle: "Tentar Novamente")
                    }
                }
            }
        }
    }
}
