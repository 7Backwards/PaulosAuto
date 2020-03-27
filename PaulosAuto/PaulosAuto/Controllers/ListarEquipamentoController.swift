//
//  ListarEquipamentoController.swift
//  PaulosAuto
//
//  Created by Gonçalo Neves on 12/03/2020.
//  Copyright © 2020 Gonçalo Neves. All rights reserved.
//

import UIKit

class ListarEquipamentoController: ViewController {
    
    // MARK: - Outlets
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var smpSwitch: UISwitch!
    
    
    // MARK: - Constants
    
    let listFlowLayout = ListFlowLayout()
    
    
    // MARK: - Properties
    
    var filteredEquipamentos = [equipamento]()
    var searchActive = false
    var smpFilter = false
    var smpFilterArray = [equipamento]()
    var smpFilterSearchArray = [equipamento]()
    var equipamentos: [equipamento] = [equipamento(marca: "Catterpillar", modelo: "CB10", tipo: "Compactador Rápido", serialNumber: "6878123A", matricula: "34-XM-88", utilizacao: 1700, imagem: "5523b3f1cf47c", ano: 2007, dataContrato: "11/02/2020", datainicioContrato: "12/02/2020", datafimContrato: "20/02/2021", ativo: true),equipamento(marca: "Catterpillar", modelo: "CB14B", tipo: "Compactador Rápido", serialNumber: "FTR00957", matricula: "34-XM-88", utilizacao: 1700, imagem: "CB14B", ano: 2007, dataContrato: "11/02/2020", datainicioContrato: "12/02/2020", datafimContrato: "20/02/2021", ativo: false), equipamento(marca: "Catterpillar", modelo: "CB10", tipo: "Dumper Rígido", serialNumber: "7897234GV", matricula: "34-XM-88", utilizacao: 1700, imagem: "5523b4949693d", ano: 2007, dataContrato: "11/02/2020", datainicioContrato: "12/02/2020", datafimContrato: "20/02/2021", ativo: true), equipamento(marca: "Catterpillar", modelo: "CB10", tipo: "Dumper Articulado", serialNumber: "G76532JF", matricula: "34-XM-88", utilizacao: 1700, imagem: "5523b505b7b72", ano: 2007, dataContrato: "11/02/2020", datainicioContrato: "12/02/2020", datafimContrato: "20/02/2021", ativo: true), equipamento(marca: "Catterpillar", modelo: "770G", tipo: "Dumper Rígido", serialNumber: "8743891A", matricula: "34-XM-88", utilizacao: 1700, imagem: "5523b4949693d", ano: 2007, dataContrato: "11/02/2020", datainicioContrato: "12/02/2020", datafimContrato: "20/02/2021", ativo: true), equipamento(marca: "Catterpillar", modelo: "CB10", tipo: "Dumper Articulado", serialNumber: "645G6543", matricula: "34-XM-88", utilizacao: 1700, imagem: "5523b505b7b72", ano: 2007, dataContrato: "11/02/2020", datainicioContrato: "12/02/2020", datafimContrato: "20/02/2021", ativo: true), equipamento(marca: "Catterpillar", modelo: "CB10", tipo: "Compactador Rápido", serialNumber: "7846512S", matricula: "34-XM-88", utilizacao: 1700, imagem: "5523b3f1cf47c", ano: 2007, dataContrato: "11/02/2020", datainicioContrato: "12/02/2020", datafimContrato: "20/02/2021", ativo: false), equipamento(marca: "Catterpillar", modelo: "CB10", tipo: "Dumper Articulado", serialNumber: "4732642B", matricula: "34-XM-88", utilizacao: 1700, imagem: "5523b505b7b72", ano: 2007, dataContrato: "11/02/2020", datainicioContrato: "12/02/2020", datafimContrato: "20/02/2021", ativo: true), equipamento(marca: "Catterpillar", modelo: "CB10", tipo: "Compactador Rápido", serialNumber: "5678212J", matricula: "34-XM-88", utilizacao: 1700, imagem: "5523b3f1cf47c", ano: 2007, dataContrato: "11/02/2020", datainicioContrato: "12/02/2020", datafimContrato: "20/02/2021", ativo: false), equipamento(marca: "Catterpillar", modelo: "CB10", tipo: "Dumper Articulado", serialNumber: "67623423D", matricula: "34-XM-88", utilizacao: 1700, imagem: "5523b505b7b72", ano: 2007, dataContrato: "11/02/2020", datainicioContrato: "12/02/2020", datafimContrato: "20/02/2021", ativo: false), equipamento(marca: "Catterpillar", modelo: "CB10", tipo: "Compactador Rápido", serialNumber: "676894GF", matricula: "34-XM-88", utilizacao: 1700, imagem: "5523b3f1cf47c", ano: 2007, dataContrato: "11/02/2020", datainicioContrato: "12/02/2020", datafimContrato: "20/02/2021", ativo: false), equipamento(marca: "Catterpillar", modelo: "CB10", tipo: "Dumper Articulado", serialNumber: "1237512G", matricula: "34-XM-88", utilizacao: 1700, imagem: "5523b505b7b72", ano: 2007, dataContrato: "11/02/2020", datainicioContrato: "12/02/2020", datafimContrato: "20/02/2021", ativo: true), equipamento(marca: "Catterpillar", modelo: "CB10", tipo: "Compactador Rápido", serialNumber: "123675C", matricula: "34-XM-88", utilizacao: 1700, imagem: "5523b3f1cf47c", ano: 2007, dataContrato: "11/02/2020", datainicioContrato: "12/02/2020", datafimContrato: "20/02/2021", ativo: false), equipamento(marca: "Catterpillar", modelo: "CB10", tipo: "Dumper Articulado", serialNumber: "6954F723", matricula: "34-XM-88", utilizacao: 1700, imagem: "5523b505b7b72", ano: 2007, dataContrato: "11/02/2020", datainicioContrato: "12/02/2020", datafimContrato: "20/02/2021", ativo: true), equipamento(marca: "Catterpillar", modelo: "CB10", tipo: "Compactador Rápido", serialNumber: "8127343D", matricula: "34-XM-88", utilizacao: 1700, imagem: "5523b3f1cf47c", ano: 2007, dataContrato: "11/02/2020", datainicioContrato: "12/02/2020", datafimContrato: "20/02/2021", ativo: false), equipamento(marca: "Catterpillar", modelo: "CB10", tipo: "Dumper Articulado", serialNumber: "9781237E", matricula: "34-XM-88", utilizacao: 1700, imagem: "5523b505b7b72", ano: 2007, dataContrato: "11/02/2020", datainicioContrato: "12/02/2020", datafimContrato: "20/02/2021", ativo: false), equipamento(marca: "Catterpillar", modelo: "CB10", tipo: "Compactador Rápido", serialNumber: "587401C", matricula: "34-XM-88", utilizacao: 1700, imagem: "5523b3f1cf47c", ano: 2007, dataContrato: "11/02/2020", datainicioContrato: "12/02/2020", datafimContrato: "20/02/2021", ativo: true), equipamento(marca: "Catterpillar", modelo: "CP44B", tipo: "Compactador Vibratório de Solos", serialNumber: "873215Z", matricula: "34-XM-88", utilizacao: 1700, imagem: "5523b531e09ab", ano: 2007, dataContrato: "11/02/2020", datainicioContrato: "12/02/2020", datafimContrato: "20/02/2021", ativo: true), equipamento(marca: "Catterpillar", modelo: "CB10", tipo: "Compactador Rápido", serialNumber: "894723V", matricula: "34-XM-88", utilizacao: 1700, imagem: "5523b3f1cf47c", ano: 2007, dataContrato: "11/02/2020", datainicioContrato: "12/02/2020", datafimContrato: "20/02/2021", ativo: true), equipamento(marca: "Catterpillar", modelo: "CB10", tipo: "Dumper Articulado", serialNumber: "494853X", matricula: "34-XM-88", utilizacao: 1700, imagem: "5523b505b7b72", ano: 2007, dataContrato: "11/02/2020", datainicioContrato: "12/02/2020", datafimContrato: "20/02/2021", ativo: false), equipamento(marca: "Catterpillar", modelo: "CP44B", tipo: "Compactador Vibratório de Solos", serialNumber: "47345678C", matricula: "34-XM-88", utilizacao: 1700, imagem: "5523b531e09ab", ano: 2007, dataContrato: "11/02/2020", datainicioContrato: "12/02/2020", datafimContrato: "20/02/2021", ativo: false)]
    
    
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
        
        smpFilterArray = equipamentos.filter { (equipamento) -> Bool in
            return equipamento.ativo == true
        }
        
    }
    
    
    func smpfilterSearchArray() {
        
        smpFilterSearchArray = filteredEquipamentos.filter { (equipamento) -> Bool in
            return equipamento.ativo == true
        }
        
    }
    
    
    func addNavBarFilter() {
        
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Filtrar", style:.plain, target: self, action: #selector(rightButtonAction))
        self.navigationItem.rightBarButtonItem?.tintColor = UIColor(red: 214/255.0, green: 4/255.0, blue: 3/255.0, alpha: 1)
    }
    
    @objc func rightButtonAction() {
            
         guard let FilterShowEquipamentoVC = storyboard?.instantiateViewController(withIdentifier: "FilterShowEquipamentoViewController")
         as? FilterShowEquipamentoViewController else {
             assertionFailure("No view controller ID FilterShowEquipamentoViewController in storyboard")
             return
         }
         
         // set the modal presentation to full screen, in iOS 13, its no longer full screen by default
         FilterShowEquipamentoVC.modalPresentationStyle = .fullScreen
         DispatchQueue.main.asyncAfter(deadline: .now() + 0.1 , execute: {
        // take a snapshot of current view and set it as backingImage
        FilterShowEquipamentoVC.snapShotImage = self.tabBarController?.view.asImage()

         // present the view controller modally without animation
         self.present(FilterShowEquipamentoVC, animated: false, completion: nil)
        })
        
    }
    

    

    override func didReceiveMemoryWarning() {
        
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    
    
    
    // MARK: - Action
    
    
    @IBAction func smpSwitchAction(_ sender: Any) {
        
        smpFilter = smpSwitch.isOn
        DispatchQueue.main.async {
            
            self.collectionView.reloadData()
        }
    }
    
    
    
}








