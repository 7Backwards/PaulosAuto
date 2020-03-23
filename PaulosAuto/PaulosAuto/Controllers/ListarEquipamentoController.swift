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
    @IBOutlet weak var listButton: UIButton!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var gridButton: UIButton!
    
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
    
    var equipamentos: [equipamento] = [equipamento(modelo:"CB10",serialnumber:"4732642B" ,utilizacao:40,imagem:"5523b3f1cf47c"), equipamento(modelo:"CB14B",serialnumber:"4712646C" ,utilizacao:450,imagem:"5523b505b7b72"), equipamento(modelo:"CB14B",serialnumber:"4712646C" ,utilizacao:450,imagem:"5523b505b7b72"), equipamento(modelo:"CB14B",serialnumber:"4712646C" ,utilizacao:450,imagem:"5523b505b7b72"), equipamento(modelo:"CB14B",serialnumber:"4712646C" ,utilizacao:450,imagem:"5523b505b7b72"), equipamento(modelo:"CB14B",serialnumber:"4712646C" ,utilizacao:450,imagem:"5523b505b7b72"), equipamento(modelo:"CB14B",serialnumber:"4712646C" ,utilizacao:450,imagem:"5523b505b7b72"), equipamento(modelo:"CB14B",serialnumber:"4712646C" ,utilizacao:450,imagem:"5523b505b7b72"), equipamento(modelo:"CB14B",serialnumber:"4712646C" ,utilizacao:450,imagem:"5523b505b7b72"), equipamento(modelo:"CB14B",serialnumber:"4712646C" ,utilizacao:450,imagem:"5523b505b7b72"), equipamento(modelo:"CB14B",serialnumber:"4712646C" ,utilizacao:450,imagem:"5523b505b7b72"), equipamento(modelo:"CB14B",serialnumber:"4712646C" ,utilizacao:450,imagem:"5523b505b7b72"), equipamento(modelo:"CB14B",serialnumber:"4712646C" ,utilizacao:450,imagem:"5523b505b7b72"), equipamento(modelo:"CB14B",serialnumber:"4712646C" ,utilizacao:450,imagem:"5523b505b7b72"), equipamento(modelo:"CB14B",serialnumber:"4712646C" ,utilizacao:450,imagem:"5523b505b7b72"), equipamento(modelo:"CB14B",serialnumber:"4712646C" ,utilizacao:450,imagem:"5523b505b7b72"), equipamento(modelo:"CB14B",serialnumber:"4712646C" ,utilizacao:450,imagem:"5523b505b7b72"), equipamento(modelo:"CB14B",serialnumber:"4712646C" ,utilizacao:450,imagem:"5523b505b7b72"), equipamento(modelo:"CB14B",serialnumber:"4712646C" ,utilizacao:450,imagem:"5523b505b7b72"), equipamento(modelo:"CB14B",serialnumber:"4712646C" ,utilizacao:450,imagem:"5523b505b7b72"), equipamento(modelo:"CB14B",serialnumber:"4712646C" ,utilizacao:450,imagem:"5523b505b7b72")]
    
    
    // MARK: - Private
    
    private func setupEquipamentoController() {
        
        super.addNavBarLogo()
        super.setSearchBarStyle(searchBar: searchBar)
        searchBar.delegate = self
        addNavBarFilter()
        collectionView.collectionViewLayout = gridFlowLayout
        isGridFlowLayoutUsed = true
        collectionView.register(CollectionViewEquipamentosCell.self, forCellWithReuseIdentifier: "CollectionViewEquipamentosCell")
        collectionView.dataSource = self
        
        
    }
    
    // MARK: - Public
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        setupEquipamentoController()
    }
    
    func addNavBarFilter() {
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Filtrar", style:.plain, target: nil, action: nil)
        self.navigationItem.rightBarButtonItem?.tintColor =  .red
    }
    
<<<<<<< Updated upstream
   
=======
    
>>>>>>> Stashed changes
    
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
    }
    
    // MARK: - Action
    
    
    @IBAction func gridButtonDidTap(_ sender: UIButton) {
        
        isGridFlowLayoutUsed = true
        
    }
    
    @IBAction func listButtonDidTap(_ sender: UIButton) {
        
        isGridFlowLayoutUsed = false
    }
    
}








