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
        let id = 1
        RQ_ListInvoices().repos(username: id, { (invoicesData,error) in
            if let invoicesData = invoicesData {
                
                DispatchQueue.main.async {
                    
                    self.invoices = invoicesData
                    self.collectionView?.reloadData()
                    self.removeHUDLoading()
                }
            }
            else if let error = error {
                print(error)
            }
        })
    }
    
    @objc func didTapMyButton(sender:UIButton!) {
        
        let id = 24395
        self.addHUDLoading()
        RQ_DownloadInvoice().repos(id: id, { (invoicesDownloadData,error) in
            if let invoicesDownloadData = invoicesDownloadData {
                let fileName = "mypdf.pdf"
                //let fileName = "\(String(describing: invoicesDownloadData[0].fileName))"
                let pdfurl = URL(string:"https://www.apeth.com/rez/release.pdf")!
                //let pdfurl = URL(string:"\(String(describing: invoicesDownloadData[0].pathToDoc))")!
                print(invoicesDownloadData[0].pathToDoc!)
                let pdffileurl : URL = {
                    let fm = FileManager.default
                    let docsurl = try! fm.url(
                        for: .documentDirectory, in: .userDomainMask,
                        appropriateFor: nil, create: true)
                    return docsurl.appendingPathComponent(fileName)
                }()
                let sess = URLSession.shared
                sess.downloadTask(with: pdfurl) { (url, resp, err) in
                    if let url = url {
                        let fm = FileManager.default
                        try? fm.removeItem(at: pdffileurl)
                        try? fm.moveItem(at: url, to: pdffileurl)
                    }
                }.resume()
                self.previewFile(fileName: fileName)
            }
            else if let error = error {
                print(error)
            }
        })
        
       
    }
    
    
}
