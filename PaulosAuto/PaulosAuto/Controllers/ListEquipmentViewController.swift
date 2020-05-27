//
//  ListEquipmentViewController.swift
//  PaulosAuto
//
//  Created by Gonçalo Neves on 12/03/2020.
//  Copyright © 2020 Gonçalo Neves. All rights reserved.
//

import UIKit

class ListEquipmentViewController: ViewController {
    
    
    // MARK: - Outlets
    
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var smpSwitch: UISwitch!
    @IBOutlet weak var collectionViewBottomConstraint: NSLayoutConstraint!
    @IBOutlet weak var noEquipmentsView: UIView!
    
    
    // MARK: - Constants
    
    
    let cellLayout = ListEquipmentCellLayout()
    
    
    // MARK: - Properties
    
    
    var searchActive = false
    var smpActive = false
    var activeCategoryFiltered : [String] = []
    var activeOrderByFiltered : Int = 0
    var equipments_DB: [EquipmentModel] = [EquipmentModel]()
    var searchFilteredEquipments = [EquipmentModel]()
    var smpFilteredEquipments = [EquipmentModel]()
    var smpAndSearchFilteredEquipments = [EquipmentModel]()
    var equipments =  [EquipmentModel]()
    var collectionViewCenterPoint: CGPoint?
    
    
    // MARK: - Override inherited functions
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        setupEquipmentoController()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        super.viewWillAppear(true)
        showTabBar()
        NotificationCenter.default.addObserver(self, selector: #selector(self.refresh), name: NSNotification.Name(rawValue: "newDataNotif"), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
        if AppConstants.requestDone {
            
            self.refreshData()
        }
        
        authenticateToken()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        
        super.viewWillDisappear(animated)
        NotificationCenter.default.removeObserver(self)
    }
    
    // MARK: - Private
    
    
    private func refreshData() {
        
        self.addHUDLoading()
        let id = 1
        RQ_ListEquipments().repos(username: id, { (equipmentData,error) in
            if let equipmentData = equipmentData {
                
                DispatchQueue.main.async {
                    
                    self.equipments = equipmentData
                    self.collectionView?.reloadData()
                    self.removeHUDLoading()
                    if self.equipments.count == 0 {
                        self.noEquipmentsView.isHidden = false
                        self.collectionView.isHidden = true
                    }
                    
                }
            }
            else if let error = error {
                print(error)
            }
        })
    }
    
    private func setupEquipmentoController() {
        
        super.addNavBarLogo()
        super.setSearchBarStyle(searchBar: searchBar)
        self.refreshData()
        AppConstants.requestDone = false
        collectionView.delegate = self
        collectionView.dataSource = self
        searchBar.delegate = self
        addNavBarFilter()
        collectionView.collectionViewLayout = cellLayout
        smpSwitch.transform = CGAffineTransform(scaleX: 0.6, y: 0.6)
        tabBarItem.selectedImage = tabBarItem.selectedImage?.withRenderingMode(.alwaysOriginal)  
    }
    
    private func filterOrderBy( equipmentArray : [EquipmentModel])-> [EquipmentModel] {
        
        switch activeOrderByFiltered {
            
        case 0:
            return equipmentArray.sorted {
                var isSorted = false
                if let first = $0.dateAssignment, let second = $1.dateAssignment {
                    
                    isSorted = first > second
                }
                return isSorted
            }
            
            
        case 1:
            return equipmentArray.sorted {
                var isSorted = false
                if let first = $0.currentHours, let second = $1.currentHours {
                    
                    isSorted = first < second
                }
                return isSorted
            }
            
            
        case 2:
            return equipmentArray.sorted {
                var isSorted = false
                if let first = $0.model, let second = $1.model {
                    
                    isSorted = first < second
                }
                return isSorted
            }
            
            
        case 3:
            return equipmentArray.sorted {
                var isSorted = false
                if let first = $0.serialNumber, let second = $1.serialNumber {
                    
                    isSorted = first < second
                }
                return isSorted
            }
            
            
        default:
            return equipmentArray
            
            
        }
    }

    
    // MARK: - Public
    
    
    func smpfilterArray() {
        
        smpFilteredEquipments = equipments.filter { (Equipmento) -> Bool in
            return Equipmento.smp == true
        }
    }
    
    func smpAndSearchFilter() {
        
        smpAndSearchFilteredEquipments = searchFilteredEquipments.filter { (Equipmento) -> Bool in
            return Equipmento.smp == true
        }
    }
    
    func addNavBarFilter() {
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Filtrar", style:.plain, target: self, action: #selector(rightButtonAction))
        self.navigationItem.rightBarButtonItem?.tintColor = .RedPaulosAuto
    }
    
    func filtercategory( equipmentArray : [EquipmentModel])-> [EquipmentModel] {
        
        var newEquipmentArray : [EquipmentModel] = []
        
        if activeCategoryFiltered.isEmpty {
            
            return self.filterOrderBy(equipmentArray: equipmentArray)
        }
        else {
            
            for item in equipmentArray {
                
                for category in activeCategoryFiltered {
                    
                    if item.type == category {
                        
                        newEquipmentArray.append(item)
                    }
                }
            }
            return self.filterOrderBy(equipmentArray: newEquipmentArray)
        }
    }
    
    
    // MARK: - Objc functions
    

    @objc func keyboardWillShow(notification: Notification) {
        
        if let keyboardHeight = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue.height {
            
            print("Notification: Keyboard will show")
            collectionViewBottomConstraint.constant = keyboardHeight - view.safeAreaInsets.bottom
        }
    }
    
    @objc func keyboardWillHide(notification: Notification) {
        
        print("Notification: Keyboard will hide")
        collectionViewBottomConstraint.constant = 0
    }
    
    @objc func rightButtonAction() {
        
        guard let FilterShowEquipmentoVC = storyboard?.instantiateViewController(withIdentifier: "FilterShowEquipmentoViewController")
            as? FilterShowEquipmentViewController else {
                assertionFailure("No view controller ID FilterShowEquipmentoViewController in storyboard")
                return
        }
        FilterShowEquipmentoVC.delegate = self
        FilterShowEquipmentoVC.equipments = self.equipments
        FilterShowEquipmentoVC.activeOrderByFiltered = self.activeOrderByFiltered
        FilterShowEquipmentoVC.activeCategoryFiltered = self.activeCategoryFiltered
        FilterShowEquipmentoVC.modalPresentationStyle = .overCurrentContext
        
        
        tabBarController?.present(FilterShowEquipmentoVC, animated: true, completion: nil)
    }
    
    @objc func refresh() {
        
        self.collectionView.reloadData()
    }
    
    
    // MARK: - Actions
    
    
    @IBAction func smpSwitchAction(_ sender: Any) {
        
        smpActive = smpSwitch.isOn
        DispatchQueue.main.async {
            
            self.collectionView.reloadData()
        }
    }
}








