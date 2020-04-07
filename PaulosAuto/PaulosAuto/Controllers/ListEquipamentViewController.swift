//
//  ListarEquipmentoController.swift
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
    
    let listFlowLayout = ListFlowLayout()
    
    
    // MARK: - Properties
    
    var searchActive = false
    var smpActive = false
    var searchFilteredEquipments = [Equipment]()
    var smpFilterArray = [Equipment]()
    var smpAndSearchFilterArray = [Equipment]()
    var equipments: [Equipment] = [Equipment(brand: "Catterpillar", model: "CB10", type: "Compactador Rápido", serialNumber: "6878123A", plate: "34-XM-88", currentHours: 1700, image: "5523b3f1cf47c", year: 2007, dateAssignment: "11/02/2020", dateStartAssignment: "12/02/2020", dateEndAssignment: "20/02/2021", smp: true),Equipment(brand: "Catterpillar", model: "CB14B", type: "Compactador Rápido", serialNumber: "FTR00957", plate: "34-XM-88", currentHours: 1700, image: "CB14B", year: 2007, dateAssignment: "11/02/2020", dateStartAssignment: "12/02/2020", dateEndAssignment: "20/02/2021", smp: false), Equipment(brand: "Catterpillar", model: "CB10", type: "Dumper Rígido", serialNumber: "7897234GV", plate: "34-XM-88", currentHours: 1700, image: "5523b4949693d", year: 2007, dateAssignment: "11/02/2020", dateStartAssignment: "12/02/2020", dateEndAssignment: "20/02/2021", smp: true), Equipment(brand: "Catterpillar", model: "CB10", type: "Dumper Articulado", serialNumber: "G76532JF", plate: "34-XM-88", currentHours: 1700, image: "5523b505b7b72", year: 2007, dateAssignment: "11/02/2020", dateStartAssignment: "12/02/2020", dateEndAssignment: "20/02/2021", smp: true), Equipment(brand: "Catterpillar", model: "770G", type: "Dumper Rígido", serialNumber: "8743891A", plate: "34-XM-88", currentHours: 1700, image: "5523b4949693d", year: 2007, dateAssignment: "11/02/2020", dateStartAssignment: "12/02/2020", dateEndAssignment: "20/02/2021", smp: true), Equipment(brand: "Catterpillar", model: "CB10", type: "Dumper Articulado", serialNumber: "645G6543", plate: "34-XM-88", currentHours: 1700, image: "5523b505b7b72", year: 2007, dateAssignment: "11/02/2020", dateStartAssignment: "12/02/2020", dateEndAssignment: "20/02/2021", smp: true), Equipment(brand: "Catterpillar", model: "CB10", type: "Compactador Rápido", serialNumber: "7846512S", plate: "34-XM-88", currentHours: 1700, image: "5523b3f1cf47c", year: 2007, dateAssignment: "11/02/2020", dateStartAssignment: "12/02/2020", dateEndAssignment: "20/02/2021", smp: false), Equipment(brand: "Catterpillar", model: "CB10", type: "Dumper Articulado", serialNumber: "4732642B", plate: "34-XM-88", currentHours: 1700, image: "5523b505b7b72", year: 2007, dateAssignment: "11/02/2020", dateStartAssignment: "12/02/2020", dateEndAssignment: "20/02/2021", smp: true), Equipment(brand: "Catterpillar", model: "CB10", type: "Compactador Rápido", serialNumber: "5678212J", plate: "34-XM-88", currentHours: 1700, image: "5523b3f1cf47c", year: 2007, dateAssignment: "11/02/2020", dateStartAssignment: "12/02/2020", dateEndAssignment: "20/02/2021", smp: false), Equipment(brand: "Catterpillar", model: "CB10", type: "Dumper Articulado", serialNumber: "67623423D", plate: "34-XM-88", currentHours: 1700, image: "5523b505b7b72", year: 2007, dateAssignment: "11/02/2020", dateStartAssignment: "12/02/2020", dateEndAssignment: "20/02/2021", smp: false), Equipment(brand: "Catterpillar", model: "CB10", type: "Compactador Rápido", serialNumber: "676894GF", plate: "34-XM-88", currentHours: 1700, image: "5523b3f1cf47c", year: 2007, dateAssignment: "11/02/2020", dateStartAssignment: "12/02/2020", dateEndAssignment: "20/02/2021", smp: false), Equipment(brand: "Catterpillar", model: "CB10", type: "Dumper Articulado", serialNumber: "1237512G", plate: "34-XM-88", currentHours: 1700, image: "5523b505b7b72", year: 2007, dateAssignment: "11/02/2020", dateStartAssignment: "12/02/2020", dateEndAssignment: "20/02/2021", smp: true), Equipment(brand: "Catterpillar", model: "CB10", type: "Compactador Rápido", serialNumber: "123675C", plate: "34-XM-88", currentHours: 1700, image: "5523b3f1cf47c", year: 2007, dateAssignment: "11/02/2020", dateStartAssignment: "12/02/2020", dateEndAssignment: "20/02/2021", smp: false), Equipment(brand: "Catterpillar", model: "CB10", type: "Dumper Articulado", serialNumber: "6954F723", plate: "34-XM-88", currentHours: 1700, image: "5523b505b7b72", year: 2007, dateAssignment: "11/02/2020", dateStartAssignment: "12/02/2020", dateEndAssignment: "20/02/2021", smp: true), Equipment(brand: "Catterpillar", model: "CB10", type: "Compactador Rápido", serialNumber: "8127343D", plate: "34-XM-88", currentHours: 1700, image: "5523b3f1cf47c", year: 2007, dateAssignment: "11/02/2020", dateStartAssignment: "12/02/2020", dateEndAssignment: "20/02/2021", smp: false), Equipment(brand: "Catterpillar", model: "CB10", type: "Dumper Articulado", serialNumber: "9781237E", plate: "34-XM-88", currentHours: 1700, image: "5523b505b7b72", year: 2007, dateAssignment: "11/02/2020", dateStartAssignment: "12/02/2020", dateEndAssignment: "20/02/2021", smp: false), Equipment(brand: "Catterpillar", model: "CB10", type: "Compactador Rápido", serialNumber: "587401C", plate: "34-XM-88", currentHours: 1700, image: "5523b3f1cf47c", year: 2007, dateAssignment: "11/02/2020", dateStartAssignment: "12/02/2020", dateEndAssignment: "20/02/2021", smp: true), Equipment(brand: "Catterpillar", model: "CP44B", type: "Compactador Vibratório de Solos", serialNumber: "873215Z", plate: "34-XM-88", currentHours: 1700, image: "5523b531e09ab", year: 2007, dateAssignment: "11/02/2020", dateStartAssignment: "12/02/2020", dateEndAssignment: "20/02/2021", smp: true), Equipment(brand: "Catterpillar", model: "CB10", type: "Compactador Rápido", serialNumber: "894723V", plate: "34-XM-88", currentHours: 1700, image: "5523b3f1cf47c", year: 2007, dateAssignment: "11/02/2020", dateStartAssignment: "12/02/2020", dateEndAssignment: "20/02/2021", smp: true), Equipment(brand: "Catterpillar", model: "CB10", type: "Dumper Articulado", serialNumber: "494853X", plate: "34-XM-88", currentHours: 1700, image: "5523b505b7b72", year: 2007, dateAssignment: "11/02/2020", dateStartAssignment: "12/02/2020", dateEndAssignment: "20/02/2021", smp: false), Equipment(brand: "Catterpillar", model: "CP44B", type: "Compactador Vibratório de Solos", serialNumber: "47345678C", plate: "34-XM-88", currentHours: 1700, image: "5523b531e09ab", year: 2007, dateAssignment: "11/02/2020", dateStartAssignment: "12/02/2020", dateEndAssignment: "20/02/2021", smp: false)]
    
    
    // MARK: - Private
    
    private func setupEquipmentoController() {
        
        super.addNavBarLogo()
        super.setSearchBarStyle(searchBar: searchBar)
        collectionView.delegate = self
        collectionView.dataSource = self
        searchBar.delegate = self
        addNavBarFilter()
        collectionView.collectionViewLayout = listFlowLayout
        smpSwitch.transform = CGAffineTransform(scaleX: 0.6, y: 0.6)
    }
    
    // MARK: - Public
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        setupEquipmentoController()
        tabBarItem.selectedImage = tabBarItem.selectedImage?.withRenderingMode(.alwaysOriginal)
    }
    
    
    override func viewWillAppear(_ animated: Bool) { // As soon as vc appears
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
        
        smpFilterArray = equipments.filter { (Equipmento) -> Bool in
            return Equipmento.smp == true
        }
        
    }
    
    
    func smpAndSearchFilter() {
        
        smpAndSearchFilterArray = searchFilteredEquipments.filter { (Equipmento) -> Bool in
            return Equipmento.smp == true
        }
        
    }
    
    
    func addNavBarFilter() {
        
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Filtrar", style:.plain, target: self, action: #selector(rightButtonAction))
        self.navigationItem.rightBarButtonItem?.tintColor = UIColor(red: 214/255.0, green: 4/255.0, blue: 3/255.0, alpha: 1)
    }
    
    @objc func rightButtonAction() {
        
        guard let FilterShowEquipmentoVC = storyboard?.instantiateViewController(withIdentifier: "FilterShowEquipmentoViewController")
            as? FilterShowEquipmentViewController else {
                assertionFailure("No view controller ID FilterShowEquipmentoViewController in storyboard")
                return
        }
        
        if #available(iOS 13, *) {
            
            FilterShowEquipmentoVC.modalPresentationStyle = .popover
        } else {
            
            FilterShowEquipmentoVC.modalPresentationStyle = .overCurrentContext
        }
        
        
        
        // present the view controller modally without animation
        self.present(FilterShowEquipmentoVC, animated: true, completion: nil)
        
        
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
    
    
    
}








