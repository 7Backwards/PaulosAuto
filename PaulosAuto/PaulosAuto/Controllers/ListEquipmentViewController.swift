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
    
    
    // MARK: - Constants
    
    let cellLayout = ListEquipmentCellLayout()
    
    
    // MARK: - Properties
    
    var searchActive = false
    var smpActive = false
    var activeCategoryFiltered : String?
    var activeOrderByFiltered : Int = 0
    var equipments_DB: [EquipmentModel] = [EquipmentModel]()
    var searchFilteredEquipments = [EquipmentModel]()
    var smpFilteredEquipments = [EquipmentModel]()
    var smpAndSearchFilteredEquipments = [EquipmentModel]()
    var equipments =  [EquipmentModel]()
    
    // MARK: - Private
    
    private func setupEquipmentoController() {
        
        super.addNavBarLogo()
        super.setSearchBarStyle(searchBar: searchBar)
        collectionView.delegate = self
        collectionView.dataSource = self
        searchBar.delegate = self
        addNavBarFilter()
        collectionView.collectionViewLayout = cellLayout
        smpSwitch.transform = CGAffineTransform(scaleX: 0.6, y: 0.6)
        tabBarItem.selectedImage = tabBarItem.selectedImage?.withRenderingMode(.alwaysOriginal)
        
        let id = 1
        RQ_ListEquipments().repos(username: id, { (equipmentData,error) in
            if let equipmentData = equipmentData {
                
                DispatchQueue.main.async {
                    
                    self.equipments = equipmentData
                    self.collectionView.reloadData()
                    
                }
            }
            else if let error = error {
                print(error)
            }
        })
        
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
            
        default: return equipmentArray
        }
    }
    
    
    // MARK: - Public
    
    
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
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        
        super.viewWillDisappear(animated)
        NotificationCenter.default.removeObserver(self)
    }
    
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
        self.navigationItem.rightBarButtonItem?.tintColor = UIColor(red: 214/255.0, green: 4/255.0, blue: 3/255.0, alpha: 1)
    }
    
    func filtercategory( equipmentArray : [EquipmentModel])-> [EquipmentModel] {
        
        var newEquipmentArray : [EquipmentModel] = []
        
        if activeCategoryFiltered == nil {
            
            return self.filterOrderBy(equipmentArray: equipmentArray)
        }
        else {
            for item in equipmentArray {
                
                if item.type == activeCategoryFiltered {
                    
                    newEquipmentArray.append(item)
                }
            }
            return self.filterOrderBy(equipmentArray: newEquipmentArray)
        }
    }
    
    override func didReceiveMemoryWarning() {
        
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    // MARK: - Action
    
    
    @IBAction func smpSwitchAction(_ sender: Any) {
        
        smpActive = smpSwitch.isOn
        DispatchQueue.main.async {
            
            self.collectionView.reloadData()
        }
    }
    
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
}








