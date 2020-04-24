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
    var equipments =  [EquipmentModel]() //= [Equipment(brand: "Catterpillar", model: "CB10", type: "Compactador Rápido", serialNumber: "6878123A", plate: "34-XM-88", currentHours: 1700, image: "5523b3f1cf47c", year: 2007, dateAssignment: "6/02/2020", dateStartAssignment: "12/02/2020", dateEndAssignment: "20/02/2021", smp: true),Equipment(brand: "Catterpillar", model: "CB14B", type: "Compactador Rápido", serialNumber: "FTR00957", plate: "34-XM-88", currentHours: 1235, image: "CB14B", year: 2007, dateAssignment: "11/02/2020", dateStartAssignment: "12/02/2020", dateEndAssignment: "20/02/2021", smp: false), Equipment(brand: "Catterpillar", model: "CB10", type: "Dumper Articulado", serialNumber: "7897234GV", plate: "34-XM-88", currentHours: 45, image: "5523b4949693d", year: 2007, dateAssignment: "11/02/2020", dateStartAssignment: "12/02/2020", dateEndAssignment: "20/02/2021", smp: true), Equipment(brand: "Catterpillar", model: "CB10", type: "Dumper Articulado", serialNumber: "G76532JF", plate: "34-XM-88", currentHours: 6785, image: "5523b505b7b72", year: 2007, dateAssignment: "11/02/2020", dateStartAssignment: "12/02/2020", dateEndAssignment: "20/02/2021", smp: true), Equipment(brand: "Catterpillar", model: "770G", type: "Dumper Rígido", serialNumber: "8743891A", plate: "34-XM-88", currentHours: 54, image: "5523b4949693d", year: 2007, dateAssignment: "16/02/2020", dateStartAssignment: "20/02/2020", dateEndAssignment: "20/02/2021", smp: true), Equipment(brand: "Catterpillar", model: "CB10", type: "Dumper Articulado", serialNumber: "645G6543", plate: "34-XM-88", currentHours: 4, image: "5523b505b7b72", year: 2007, dateAssignment: "11/02/2020", dateStartAssignment: "12/02/2020", dateEndAssignment: "20/02/2021", smp: true), Equipment(brand: "Catterpillar", model: "CB10", type: "Compactador Rápido", serialNumber: "7846512S", plate: "34-XM-88", currentHours: 1700, image: "5523b3f1cf47c", year: 2007, dateAssignment: "11/02/2020", dateStartAssignment: "12/02/2020", dateEndAssignment: "20/02/2021", smp: false), Equipment(brand: "Catterpillar", model: "CB10", type: "Dumper Articulado", serialNumber: "4732642B", plate: "34-XM-88", currentHours: 1700, image: "5523b505b7b72", year: 2007, dateAssignment: "11/02/2020", dateStartAssignment: "12/02/2020", dateEndAssignment: "20/02/2021", smp: true), Equipment(brand: "Catterpillar", model: "CB10", type: "Dumper Articulado", serialNumber: "5678212J", plate: "34-XM-88", currentHours: 1700, image: "5523b3f1cf47c", year: 2007, dateAssignment: "11/02/2020", dateStartAssignment: "12/02/2020", dateEndAssignment: "20/02/2021", smp: false), Equipment(brand: "Catterpillar", model: "CB10", type: "Dumper Articulado", serialNumber: "67623423D", plate: "34-XM-88", currentHours: 1700, image: "5523b505b7b72", year: 2007, dateAssignment: "11/02/2020", dateStartAssignment: "12/02/2020", dateEndAssignment: "20/02/2021", smp: false), Equipment(brand: "Catterpillar", model: "CB10", type: "Dumper Articulado", serialNumber: "676894GF", plate: "34-XM-88", currentHours: 1700, image: "5523b3f1cf47c", year: 2007, dateAssignment: "11/02/2020", dateStartAssignment: "12/02/2020", dateEndAssignment: "20/02/2021", smp: false), Equipment(brand: "Catterpillar", model: "CB10", type: "Dumper Articulado", serialNumber: "1237512G", plate: "34-XM-88", currentHours: 1700, image: "5523b505b7b72", year: 2007, dateAssignment: "11/02/2020", dateStartAssignment: "12/02/2020", dateEndAssignment: "20/02/2021", smp: true), Equipment(brand: "Catterpillar", model: "CB10", type: "Compactador Rápido", serialNumber: "123675C", plate: "34-XM-88", currentHours: 1700, image: "5523b3f1cf47c", year: 2007, dateAssignment: "11/02/2020", dateStartAssignment: "12/02/2020", dateEndAssignment: "20/02/2021", smp: false), Equipment(brand: "Catterpillar", model: "CB10", type: "Dumper Articulado", serialNumber: "6954F723", plate: "34-XM-88", currentHours: 1700, image: "5523b505b7b72", year: 2007, dateAssignment: "11/02/2020", dateStartAssignment: "12/02/2020", dateEndAssignment: "20/02/2021", smp: true), Equipment(brand: "Catterpillar", model: "CB10", type: "Compactador Rápido", serialNumber: "8127343D", plate: "34-XM-88", currentHours: 1700, image: "5523b3f1cf47c", year: 2007, dateAssignment: "11/02/2020", dateStartAssignment: "12/02/2020", dateEndAssignment: "20/02/2021", smp: false), Equipment(brand: "Catterpillar", model: "CB10", type: "Dumper Articulado", serialNumber: "9781237E", plate: "34-XM-88", currentHours: 1700, image: "5523b505b7b72", year: 2007, dateAssignment: "11/02/2020", dateStartAssignment: "12/02/2020", dateEndAssignment: "20/02/2021", smp: false), Equipment(brand: "Catterpillar", model: "CB10", type: "Dumper Articulado", serialNumber: "587401C", plate: "34-XM-88", currentHours: 1700, image: "5523b3f1cf47c", year: 2007, dateAssignment: "11/02/2020", dateStartAssignment: "12/02/2020", dateEndAssignment: "20/02/2021", smp: true), Equipment(brand: "Catterpillar", model: "CP44B", type: "Compactador Vibratório de Solos", serialNumber: "873215Z", plate: "34-XM-88", currentHours: 1700, image: "5523b531e09ab", year: 2007, dateAssignment: "11/02/2020", dateStartAssignment: "12/02/2020", dateEndAssignment: "20/02/2021", smp: true), Equipment(brand: "Catterpillar", model: "CB10", type: "Compactador Rápido", serialNumber: "894723V", plate: "34-XM-88", currentHours: 1700, image: "5523b3f1cf47c", year: 2007, dateAssignment: "11/02/2020", dateStartAssignment: "12/02/2020", dateEndAssignment: "20/02/2021", smp: true), Equipment(brand: "Catterpillar", model: "CB10", type: "Dumper Articulado", serialNumber: "494853X", plate: "34-XM-88", currentHours: 1700, image: "5523b505b7b72", year: 2007, dateAssignment: "11/02/2020", dateStartAssignment: "12/02/2020", dateEndAssignment: "20/02/2021", smp: false), Equipment(brand: "Catterpillar", model: "CP44B", type: "Compactador Vibratório de Solos", serialNumber: "47345678C", plate: "34-XM-88", currentHours: 1700, image: "5523b531e09ab", year: 2007, dateAssignment: "11/02/2020", dateStartAssignment: "12/02/2020", dateEndAssignment: "20/02/2021", smp: false)]
//
    
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
    
    private let RQ_listEquipments = RQ_ListEquipments()
    override func viewDidLoad() {
        
        super.viewDidLoad()
        setupEquipmentoController()
        tabBarItem.selectedImage = tabBarItem.selectedImage?.withRenderingMode(.alwaysOriginal)
        NotificationCenter.default.addObserver(self, selector: #selector(self.refresh), name: NSNotification.Name(rawValue: "newDataNotif"), object: nil)
        let id = 1
        RQ_listEquipments.repos(username: id, { (equipmentData,error) in
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
    
    override func viewWillAppear(_ animated: Bool) {
        
        super.viewWillAppear(true)
        showTabBar()
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

        self.collectionView.reloadData() // a refresh the tableView.

    }
}








