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
    @IBOutlet weak var changeLayoutButton: UIButton!
    
    
    
    // MARK: - Constants
    
    let gridFlowLayout = GridFlowLayout()
    let listFlowLayout = ListFlowLayout()
    
    
    // MARK: - Properties
    
    var isGridFlowLayoutUsed: Bool = false {
        
        didSet {
            
            updateButtonAppearance()
        }
    }
    var filteredEquipamentos = [equipamento]()
    var searchActive = false
    
    var equipamentos: [equipamento] = [equipamento(modelo:"CB10",serialnumber:"4732642B" ,utilizacao:40,imagem:"5523b3f1cf47c",tipo:"Compactador de Asfaltos"), equipamento(modelo:"CB14B",serialnumber:"4712646C" ,utilizacao:450,imagem:"5523b505b7b72",tipo:"Compactador de Asfaltos"), equipamento(modelo:"CB14B",serialnumber:"4712646C" ,utilizacao:450,imagem:"5523b505b7b72",tipo:"Compactador de Asfaltos"), equipamento(modelo:"CB14B",serialnumber:"4712646C" ,utilizacao:450,imagem:"5523b505b7b72",tipo:"Compactador de Asfaltos"), equipamento(modelo:"CB14B",serialnumber:"4712646C" ,utilizacao:450,imagem:"5523b505b7b72",tipo:"Compactador de Asfaltos"), equipamento(modelo:"CB14B",serialnumber:"4712646C" ,utilizacao:450,imagem:"5523b505b7b72",tipo:"Compactador de Asfaltos"), equipamento(modelo:"CB14B",serialnumber:"4712646C" ,utilizacao:450,imagem:"5523b505b7b72",tipo:"Compactador de Asfaltos"), equipamento(modelo:"CB14B",serialnumber:"4712646C" ,utilizacao:450,imagem:"5523b505b7b72",tipo:"Compactador de Asfaltos"), equipamento(modelo:"CB14B",serialnumber:"4712646C" ,utilizacao:450,imagem:"5523b505b7b72",tipo:"Compactador de Asfaltos"), equipamento(modelo:"CB14B",serialnumber:"4712646C" ,utilizacao:450,imagem:"5523b505b7b72",tipo:"Compactador de Asfaltos"), equipamento(modelo:"CB14B",serialnumber:"4712646C" ,utilizacao:450,imagem:"5523b505b7b72",tipo:"Compactador de Asfaltos"), equipamento(modelo:"CB14B",serialnumber:"4712646C" ,utilizacao:450,imagem:"5523b505b7b72",tipo:"Compactador de Asfaltos"), equipamento(modelo:"CB14B",serialnumber:"4712646C" ,utilizacao:450,imagem:"5523b505b7b72",tipo:"Compactador de Asfaltos"), equipamento(modelo:"CB14B",serialnumber:"4712646C" ,utilizacao:450,imagem:"5523b505b7b72",tipo:"Compactador de Asfaltos"), equipamento(modelo:"CB14B",serialnumber:"4712646C" ,utilizacao:450,imagem:"5523b505b7b72",tipo:"Compactador de Asfaltos"), equipamento(modelo:"CB14B",serialnumber:"4712646C" ,utilizacao:450,imagem:"5523b505b7b72",tipo:"Compactador de Asfaltos"), equipamento(modelo:"CB14B",serialnumber:"4712646C" ,utilizacao:450,imagem:"5523b505b7b72",tipo:"Compactador de Asfaltos"), equipamento(modelo:"CB14B",serialnumber:"4712646C" ,utilizacao:450,imagem:"5523b505b7b72",tipo:"Compactador de Asfaltos"), equipamento(modelo:"CB14B",serialnumber:"4712646C" ,utilizacao:450,imagem:"5523b505b7b72",tipo:"Compactador de Asfaltos"), equipamento(modelo:"CB14B",serialnumber:"4712646C" ,utilizacao:450,imagem:"5523b505b7b72",tipo:"Compactador de Asfaltos"), equipamento(modelo:"CB14B",serialnumber:"4712646C" ,utilizacao:450,imagem:"5523b505b7b72",tipo:"Compactador de Asfaltos")]
    
    
    // MARK: - Private
    
    private func setupEquipamentoController() {
        
        super.addNavBarLogo()
        super.setSearchBarStyle(searchBar: searchBar)
        collectionView.delegate = self
        collectionView.dataSource = self
        searchBar.delegate = self
        addNavBarFilter()
        collectionView.collectionViewLayout = gridFlowLayout
        isGridFlowLayoutUsed = true
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
    
    
    func addNavBarFilter() {
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Filtrar", style:.plain, target: nil, action: nil)
        self.navigationItem.rightBarButtonItem?.tintColor =  .red
    }
    
    
    
    override func didReceiveMemoryWarning() {
        
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func updateButtonAppearance() {
        
        let layout = isGridFlowLayoutUsed ? gridFlowLayout : listFlowLayout
        UIView.animate(withDuration: 0.2) { () -> Void in
            self.collectionView.collectionViewLayout.invalidateLayout()
            self.collectionView.setCollectionViewLayout(layout, animated: true)
            
            
        }
        
        if(self.isGridFlowLayoutUsed == true) { self.changeLayoutButton.setImage(UIImage(systemName: "list.bullet"), for: .normal)
        }
        else{
            self.changeLayoutButton.setImage(UIImage(systemName: "square.grid.2x2"), for: .normal)
        }
        
        
    }
    
    // MARK: - Action
    
    
    @IBAction func changelayoutButtonDidTap(_ sender: UIButton) {
        
        isGridFlowLayoutUsed = !isGridFlowLayoutUsed
    }
    
    
}








