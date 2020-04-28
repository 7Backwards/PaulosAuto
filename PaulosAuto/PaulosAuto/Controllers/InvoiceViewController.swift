//
//  InvoiceViewController.swift
//  PaulosAuto
//
//  Created by Neves on 11/03/2020.
//  Copyright © 2020 Gonçalo Neves. All rights reserved.
//

import UIKit

class InvoiceViewController: ViewController {
    
    
    // MARK: - Outlets
    
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    
    // MARK: - Constants
    
    
    let cellLayout = ListEquipmentCellLayout()
    
    
    // MARK: - Properties
    
    
    var invoices =  [InvoiceModel]()
    
    
    // MARK: - Functions
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        super.addNavBarLogo()
        collectionView.collectionViewLayout = cellLayout
        collectionView.dataSource = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        super.viewWillAppear(true)
        addHUDLoadingOverCollectionView(point: collectionView.center)
        let id = 1
        RQ_ListInvoices().repos(username: id, { (invoicesData,error) in
            if let invoicesData = invoicesData {

                DispatchQueue.main.async {

                    self.invoices = invoicesData
                    self.collectionView?.reloadData()
                    self.removeHUDLoadingOverCollectionView()
                }
            }
            else if let error = error {
                print(error)
            }
        })
    }
}
