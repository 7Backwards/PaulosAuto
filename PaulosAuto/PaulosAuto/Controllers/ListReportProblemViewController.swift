//
//  ProblemasViewController.swift
//  PaulosAuto
//
//  Created by Neves on 11/03/2020.
//  Copyright © 2020 Gonçalo Neves. All rights reserved.
//

import UIKit

class ListReportProblemViewController: ViewController {
    
    
    // MARK: - Outlets
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var noReportProblemsView: UIView!
    
    
    // MARK: - Constants
    
    
    let cellLayout = ListEquipmentHistoryCellLayout()
    
    
    // MARK: - Properties
    
    
    var problemsReported =  [ReportProblemModel]()
    
    
    // MARK: - Override inherited functions
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        super.addNavBarLogo()
        collectionView.collectionViewLayout = cellLayout
        collectionView.dataSource = self
        collectionView.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        super.viewWillAppear(true)
        addHUDLoading()
        problemsReported.removeAll()
        var user :UserModel?
        if let data = UserDefaults.standard.value(forKey:"user") as? Data {
            
            user = try? PropertyListDecoder().decode(UserModel.self, from: data)
            
            if let equipments = user?.equipamentos {
                
                for equipment in equipments {
                    
                    RQ_ListReportProblems().repos(serialNumber: equipment, { (reportProblemData,error) in
                        if let reportProblemData = reportProblemData {
                            
                            DispatchQueue.main.async {
                                
                                for reportProblem in reportProblemData {
                                    
                                    reportProblem.serialNumber = equipment
                                    self.problemsReported.append(reportProblem)
                                }
                                
                                self.collectionView?.reloadData()
                                self.removeHUDLoading()
                                if self.problemsReported.count == 0 {
                                    
                                    self.noReportProblemsView.isHidden = false
                                    self.collectionView.isHidden = true
                                }
                                else {
                                    
                                    self.noReportProblemsView.isHidden = true
                                    self.collectionView.isHidden = false
                                }
                            }
                        }
                        else if let error = error {
                            
                            print(error)
                        }
                    })
                }
            }
        }
        
        
    }
}
