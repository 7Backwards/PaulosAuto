//
//  ListarEquipamentoController.swift
//  PaulosAuto
//
//  Created by Gonçalo Neves on 12/03/2020.
//  Copyright © 2020 Gonçalo Neves. All rights reserved.
//

import UIKit

class ListEquipamentViewController: ViewController {
    
    // MARK: - Outlets
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var smpSwitch: UISwitch!
    
    
    // MARK: - Constants
    
    let listFlowLayout = ListFlowLayout()
    
    
    // MARK: - Properties
    
    var searchActive = false
    var smpActive = false
    var searchFilteredEquipaments = [equipament]()
    var smpFilterArray = [equipament]()
    var smpAndSearchFilterArray = [equipament]()
    var equipments: [equipament] = [equipament(brand: "Catterpillar", model: "CB10", type: "Compactador Rápido", serialNumber: "6878123A", plate: "34-XM-88", currentHours: 1700, image: "5523b3f1cf47c", year: 2007, dateAssignment: "11/02/2020", dateStartAssignment: "12/02/2020", dateEndAssignment: "20/02/2021", smp: true),equipament(brand: "Catterpillar", model: "CB14B", type: "Compactador Rápido", serialNumber: "FTR00957", plate: "34-XM-88", currentHours: 1700, image: "CB14B", year: 2007, dateAssignment: "11/02/2020", dateStartAssignment: "12/02/2020", dateEndAssignment: "20/02/2021", smp: false), equipament(brand: "Catterpillar", model: "CB10", type: "Dumper Rígido", serialNumber: "7897234GV", plate: "34-XM-88", currentHours: 1700, image: "5523b4949693d", year: 2007, dateAssignment: "11/02/2020", dateStartAssignment: "12/02/2020", dateEndAssignment: "20/02/2021", smp: true), equipament(brand: "Catterpillar", model: "CB10", type: "Dumper Articulado", serialNumber: "G76532JF", plate: "34-XM-88", currentHours: 1700, image: "5523b505b7b72", year: 2007, dateAssignment: "11/02/2020", dateStartAssignment: "12/02/2020", dateEndAssignment: "20/02/2021", smp: true), equipament(brand: "Catterpillar", model: "770G", type: "Dumper Rígido", serialNumber: "8743891A", plate: "34-XM-88", currentHours: 1700, image: "5523b4949693d", year: 2007, dateAssignment: "11/02/2020", dateStartAssignment: "12/02/2020", dateEndAssignment: "20/02/2021", smp: true), equipament(brand: "Catterpillar", model: "CB10", type: "Dumper Articulado", serialNumber: "645G6543", plate: "34-XM-88", currentHours: 1700, image: "5523b505b7b72", year: 2007, dateAssignment: "11/02/2020", dateStartAssignment: "12/02/2020", dateEndAssignment: "20/02/2021", smp: true), equipament(brand: "Catterpillar", model: "CB10", type: "Compactador Rápido", serialNumber: "7846512S", plate: "34-XM-88", currentHours: 1700, image: "5523b3f1cf47c", year: 2007, dateAssignment: "11/02/2020", dateStartAssignment: "12/02/2020", dateEndAssignment: "20/02/2021", smp: false), equipament(brand: "Catterpillar", model: "CB10", type: "Dumper Articulado", serialNumber: "4732642B", plate: "34-XM-88", currentHours: 1700, image: "5523b505b7b72", year: 2007, dateAssignment: "11/02/2020", dateStartAssignment: "12/02/2020", dateEndAssignment: "20/02/2021", smp: true), equipament(brand: "Catterpillar", model: "CB10", type: "Compactador Rápido", serialNumber: "5678212J", plate: "34-XM-88", currentHours: 1700, image: "5523b3f1cf47c", year: 2007, dateAssignment: "11/02/2020", dateStartAssignment: "12/02/2020", dateEndAssignment: "20/02/2021", smp: false), equipament(brand: "Catterpillar", model: "CB10", type: "Dumper Articulado", serialNumber: "67623423D", plate: "34-XM-88", currentHours: 1700, image: "5523b505b7b72", year: 2007, dateAssignment: "11/02/2020", dateStartAssignment: "12/02/2020", dateEndAssignment: "20/02/2021", smp: false), equipament(brand: "Catterpillar", model: "CB10", type: "Compactador Rápido", serialNumber: "676894GF", plate: "34-XM-88", currentHours: 1700, image: "5523b3f1cf47c", year: 2007, dateAssignment: "11/02/2020", dateStartAssignment: "12/02/2020", dateEndAssignment: "20/02/2021", smp: false), equipament(brand: "Catterpillar", model: "CB10", type: "Dumper Articulado", serialNumber: "1237512G", plate: "34-XM-88", currentHours: 1700, image: "5523b505b7b72", year: 2007, dateAssignment: "11/02/2020", dateStartAssignment: "12/02/2020", dateEndAssignment: "20/02/2021", smp: true), equipament(brand: "Catterpillar", model: "CB10", type: "Compactador Rápido", serialNumber: "123675C", plate: "34-XM-88", currentHours: 1700, image: "5523b3f1cf47c", year: 2007, dateAssignment: "11/02/2020", dateStartAssignment: "12/02/2020", dateEndAssignment: "20/02/2021", smp: false), equipament(brand: "Catterpillar", model: "CB10", type: "Dumper Articulado", serialNumber: "6954F723", plate: "34-XM-88", currentHours: 1700, image: "5523b505b7b72", year: 2007, dateAssignment: "11/02/2020", dateStartAssignment: "12/02/2020", dateEndAssignment: "20/02/2021", smp: true), equipament(brand: "Catterpillar", model: "CB10", type: "Compactador Rápido", serialNumber: "8127343D", plate: "34-XM-88", currentHours: 1700, image: "5523b3f1cf47c", year: 2007, dateAssignment: "11/02/2020", dateStartAssignment: "12/02/2020", dateEndAssignment: "20/02/2021", smp: false), equipament(brand: "Catterpillar", model: "CB10", type: "Dumper Articulado", serialNumber: "9781237E", plate: "34-XM-88", currentHours: 1700, image: "5523b505b7b72", year: 2007, dateAssignment: "11/02/2020", dateStartAssignment: "12/02/2020", dateEndAssignment: "20/02/2021", smp: false), equipament(brand: "Catterpillar", model: "CB10", type: "Compactador Rápido", serialNumber: "587401C", plate: "34-XM-88", currentHours: 1700, image: "5523b3f1cf47c", year: 2007, dateAssignment: "11/02/2020", dateStartAssignment: "12/02/2020", dateEndAssignment: "20/02/2021", smp: true), equipament(brand: "Catterpillar", model: "CP44B", type: "Compactador Vibratório de Solos", serialNumber: "873215Z", plate: "34-XM-88", currentHours: 1700, image: "5523b531e09ab", year: 2007, dateAssignment: "11/02/2020", dateStartAssignment: "12/02/2020", dateEndAssignment: "20/02/2021", smp: true), equipament(brand: "Catterpillar", model: "CB10", type: "Compactador Rápido", serialNumber: "894723V", plate: "34-XM-88", currentHours: 1700, image: "5523b3f1cf47c", year: 2007, dateAssignment: "11/02/2020", dateStartAssignment: "12/02/2020", dateEndAssignment: "20/02/2021", smp: true), equipament(brand: "Catterpillar", model: "CB10", type: "Dumper Articulado", serialNumber: "494853X", plate: "34-XM-88", currentHours: 1700, image: "5523b505b7b72", year: 2007, dateAssignment: "11/02/2020", dateStartAssignment: "12/02/2020", dateEndAssignment: "20/02/2021", smp: false), equipament(brand: "Catterpillar", model: "CP44B", type: "Compactador Vibratório de Solos", serialNumber: "47345678C", plate: "34-XM-88", currentHours: 1700, image: "5523b531e09ab", year: 2007, dateAssignment: "11/02/2020", dateStartAssignment: "12/02/2020", dateEndAssignment: "20/02/2021", smp: false)]
    
    
    // MARK: - Private
    
    private func setupEquipamentoController() {
        
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
        setupEquipamentoController()
    }
    
    override func viewWillAppear(_ animated: Bool) { // As soon as vc appears
        super.viewWillAppear(true)
        showTabBar()
    }
    
    func smpfilterArray() {
        
        smpFilterArray = equipments.filter { (equipamento) -> Bool in
            return equipamento.smp == true
        }
        
    }
    
    
    func smpAndSearchFilter() {
        
        smpAndSearchFilterArray = searchFilteredEquipaments.filter { (equipamento) -> Bool in
            return equipamento.smp == true
        }
        
    }
    
    
    func addNavBarFilter() {
        
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Filtrar", style:.plain, target: self, action: #selector(rightButtonAction))
        self.navigationItem.rightBarButtonItem?.tintColor = UIColor(red: 214/255.0, green: 4/255.0, blue: 3/255.0, alpha: 1)
    }
    
    @objc func rightButtonAction() {

         guard let FilterShowEquipamentoVC = storyboard?.instantiateViewController(withIdentifier: "FilterShowEquipamentoViewController")
         as? FilterShowEquipamentViewController else {
             assertionFailure("No view controller ID FilterShowEquipamentoViewController in storyboard")
             return
         }
         
         // set the modal presentation to full screen, in iOS 13, its no longer full screen by default
         FilterShowEquipamentoVC.modalPresentationStyle = .popover
         
      

         // present the view controller modally without animation
         self.present(FilterShowEquipamentoVC, animated: true, completion: nil)
        
        
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
    
    
    
}








