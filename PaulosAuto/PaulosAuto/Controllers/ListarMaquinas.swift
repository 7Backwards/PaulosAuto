//
//  ViewController.swift
//  Grid&ListCollectionView
//
//  Created by Mohammed Azeem Azeez on 04/03/2019.
//  Copyright © 2019 Riverswave Technologies Ltd. All rights reserved.
//

import UIKit

class ListarMaquinas: ViewController, UICollectionViewDelegate, UISearchBarDelegate {
    

    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet var listButton: UIButton!
    @IBOutlet var collectionView: UICollectionView!
    @IBOutlet var gridbutton: UIButton!
    
    var isGridFlowLayoutUsed: Bool = false {
        
        didSet {
            
            updateButtonAppearance()
        }
    }
    
    var filteredEquipamentos = [equipamento]()
    var searchActive = false
    var gridFlowLayout = GridFlowLayout()
    var listFlowLayout = ListFlowLayout()
    var equipamentos: [equipamento] = [equipamento(modelo:"CB10",serialnumber:"4732642B" ,utilizacao:40,imagem:"5523b3f1cf47c"), equipamento(modelo:"CB14B",serialnumber:"4712646C" ,utilizacao:450,imagem:"5523b505b7b72"), equipamento(modelo:"CB14B",serialnumber:"4712646C" ,utilizacao:450,imagem:"5523b505b7b72"), equipamento(modelo:"CB14B",serialnumber:"4712646C" ,utilizacao:450,imagem:"5523b505b7b72"), equipamento(modelo:"CB14B",serialnumber:"4712646C" ,utilizacao:450,imagem:"5523b505b7b72"), equipamento(modelo:"CB14B",serialnumber:"4712646C" ,utilizacao:450,imagem:"5523b505b7b72"), equipamento(modelo:"CB14B",serialnumber:"4712646C" ,utilizacao:450,imagem:"5523b505b7b72"), equipamento(modelo:"CB14B",serialnumber:"4712646C" ,utilizacao:450,imagem:"5523b505b7b72"), equipamento(modelo:"CB14B",serialnumber:"4712646C" ,utilizacao:450,imagem:"5523b505b7b72"), equipamento(modelo:"CB14B",serialnumber:"4712646C" ,utilizacao:450,imagem:"5523b505b7b72"), equipamento(modelo:"CB14B",serialnumber:"4712646C" ,utilizacao:450,imagem:"5523b505b7b72"), equipamento(modelo:"CB14B",serialnumber:"4712646C" ,utilizacao:450,imagem:"5523b505b7b72"), equipamento(modelo:"CB14B",serialnumber:"4712646C" ,utilizacao:450,imagem:"5523b505b7b72"), equipamento(modelo:"CB14B",serialnumber:"4712646C" ,utilizacao:450,imagem:"5523b505b7b72"), equipamento(modelo:"CB14B",serialnumber:"4712646C" ,utilizacao:450,imagem:"5523b505b7b72"), equipamento(modelo:"CB14B",serialnumber:"4712646C" ,utilizacao:450,imagem:"5523b505b7b72"), equipamento(modelo:"CB14B",serialnumber:"4712646C" ,utilizacao:450,imagem:"5523b505b7b72"), equipamento(modelo:"CB14B",serialnumber:"4712646C" ,utilizacao:450,imagem:"5523b505b7b72"), equipamento(modelo:"CB14B",serialnumber:"4712646C" ,utilizacao:450,imagem:"5523b505b7b72"), equipamento(modelo:"CB14B",serialnumber:"4712646C" ,utilizacao:450,imagem:"5523b505b7b72"), equipamento(modelo:"CB14B",serialnumber:"4712646C" ,utilizacao:450,imagem:"5523b505b7b72")]
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        collectionView.delegate = self
        collectionView.dataSource = self
        searchBar.delegate = self
        super.addNavBarLogo()
        super.addNavBarFilter()
        super.setSearchBarStyle(searchBar: searchBar)
        collectionView.collectionViewLayout = gridFlowLayout
        collectionView.dataSource = self
        isGridFlowLayoutUsed = true
       
    }
    
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
           searchActive = true;
       }

    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
           searchActive = false;
       }

    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
           searchActive = false;
       }

    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
           searchActive = false;
       }

    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
            filteredEquipamentos = equipamentos.filter { (equipamento) -> Bool in
                return equipamento.serialNumber?.range(of: searchText, options: [ .caseInsensitive ]) != nil
            }
            searchActive = !filteredEquipamentos.isEmpty
            self.collectionView.reloadData()
       }

    override func didReceiveMemoryWarning() {
           super.didReceiveMemoryWarning()
           // Dispose of any resources that can be recreated.
    }
    
    @IBAction func gridButtonDidTap(_ sender: UIButton) {
        
        isGridFlowLayoutUsed = true
    }
    
    @IBAction func listButtonDidTap(_ sender: UIButton) {
        
        isGridFlowLayoutUsed = false
    }
    
    fileprivate func updateButtonAppearance() {
        
        let layout = isGridFlowLayoutUsed ? gridFlowLayout : listFlowLayout
        UIView.animate(withDuration: 0.2) { () -> Void in
        self.collectionView.collectionViewLayout.invalidateLayout()
        self.collectionView.setCollectionViewLayout(layout, animated: true)
        }
    }
}

    extension ListarMaquinas: UICollectionViewDataSource {
    
        func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            
            if(searchActive) {
                
                return filteredEquipamentos.count
            }
            else {
                
                return equipamentos.count
            }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: CollectionViewEquipamentos.self), for: indexPath) as! CollectionViewEquipamentos
        
        if(searchActive) {
                
            if let imageName = filteredEquipamentos[indexPath.row].imagem {
                    
                cell.imageEquipamento.contentMode = .scaleAspectFit
                cell.imageEquipamento.image = UIImage(named: imageName)
            }
            if let modeloText = filteredEquipamentos[indexPath.row].modelo {
                    
                cell.modeloEquipamento.text = modeloText
            }
            if let utilizacaoText = filteredEquipamentos[indexPath.row].utilizacao {
                    
                cell.utilizacaoEquipamento.text = "Utilização: \(utilizacaoText) H"
            }
                
            if let numeroSerieText = filteredEquipamentos[indexPath.row].serialNumber {
                    
                cell.numeroSerieEquipamento.text = "N.Série: \(numeroSerieText)"
            }
                
        }
        else {
            if let imageName = equipamentos[indexPath.row].imagem {
            
                cell.imageEquipamento.contentMode = .scaleAspectFit
                cell.imageEquipamento.image = UIImage(named: imageName)
            }
            if let modeloText = equipamentos[indexPath.row].modelo {
            
                cell.modeloEquipamento.text = modeloText
            }
            if let utilizacaoText = equipamentos[indexPath.row].utilizacao {
            
                cell.utilizacaoEquipamento.text = "Utilização: \(utilizacaoText) H"
            }
            if let numeroSerieText = equipamentos[indexPath.row].serialNumber {
            
                cell.numeroSerieEquipamento.text = "N.Série: \(numeroSerieText)"
            }
        }
        cell.cellView.setCardView(view: cell.cellView)
        return cell
    }
}

    extension UIView {
    
        func setCardView(view : UIView){
        
            view.layer.cornerRadius = 5
            view.layer.applySketchShadow(color: .black, alpha: 0.16, x: 0, y: 3, blur: 6, spread: 0)
            view.layer.masksToBounds = false
    }
}






