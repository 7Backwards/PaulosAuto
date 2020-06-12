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
            else if let error = error {
                
                print(error)
            }
        })
    }
    
    
    // MARK: - Objc functions
    
    
    @objc func previewPDFButton(sender:UIButton!) {
        
        self.addHUDLoading()
        if let invoiceURL = invoices[sender.tag].docURL {
            
            let fileName = "\(invoices[sender.tag].diario ?? "")_\( invoices[sender.tag].ano ?? "").pdf"
            
            let pdffileurl : URL = {
                
                let fm = FileManager.default
                let docsurl = try! fm.url(
                    for: .documentDirectory, in: .userDomainMask,
                    appropriateFor: nil, create: true)
                return docsurl.appendingPathComponent(fileName)
            }()
            let pdfurl = URL(string: invoiceURL)!
            let sess = URLSession.shared
            sess.downloadTask(with: pdfurl) { (url, resp, error) in
                if let url = url {
                    
                    let fm = FileManager.default
                    try? fm.removeItem(at: pdffileurl)
                    try? fm.moveItem(at: url, to: pdffileurl)
                    self.previewFile(fileName: fileName)
                }
                
                if error != nil {
                    self.addInformativeAlert(alertControllerTitle: "Erro", message: "Ficheiro não encontrado", alertActionTitle: "Sair")
                }
            }.resume()
        }
    }
}

