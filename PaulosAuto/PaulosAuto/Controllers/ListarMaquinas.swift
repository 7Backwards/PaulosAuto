//
//  ViewController.swift
//  Grid&ListCollectionView
//
//  Created by Mohammed Azeem Azeez on 04/03/2019.
//  Copyright © 2019 Riverswave Technologies Ltd. All rights reserved.
//

import UIKit

class ListarMaquinas: ViewController {
    
    

    @IBOutlet weak var collectionCell: CollectionViewEquipamentos!
    @IBOutlet var listButton: UIButton!
    @IBOutlet var collectionView: UICollectionView!
    @IBOutlet var gridbutton: UIButton!
    
    var isGridFlowLayoutUsed: Bool = false {
        didSet {
            updateButtonAppearance()
        }
    }
    
    var gridFlowLayout = GridFlowLayout()
    var listFlowLayout = ListFlowLayout()
    var array: [equipamento] = [equipamento(modelo:"CB10",serialnumber:"4732642B" ,utilizacao:40,imagem:"5523b3f1cf47c"), equipamento(modelo:"CB14B",serialnumber:"4712646C" ,utilizacao:450,imagem:"5523b505b7b72"), equipamento(modelo:"CB14B",serialnumber:"4712646C" ,utilizacao:450,imagem:"5523b505b7b72"), equipamento(modelo:"CB14B",serialnumber:"4712646C" ,utilizacao:450,imagem:"5523b505b7b72"), equipamento(modelo:"CB14B",serialnumber:"4712646C" ,utilizacao:450,imagem:"5523b505b7b72"), equipamento(modelo:"CB14B",serialnumber:"4712646C" ,utilizacao:450,imagem:"5523b505b7b72"), equipamento(modelo:"CB14B",serialnumber:"4712646C" ,utilizacao:450,imagem:"5523b505b7b72"), equipamento(modelo:"CB14B",serialnumber:"4712646C" ,utilizacao:450,imagem:"5523b505b7b72"), equipamento(modelo:"CB14B",serialnumber:"4712646C" ,utilizacao:450,imagem:"5523b505b7b72"), equipamento(modelo:"CB14B",serialnumber:"4712646C" ,utilizacao:450,imagem:"5523b505b7b72"), equipamento(modelo:"CB14B",serialnumber:"4712646C" ,utilizacao:450,imagem:"5523b505b7b72"), equipamento(modelo:"CB14B",serialnumber:"4712646C" ,utilizacao:450,imagem:"5523b505b7b72"), equipamento(modelo:"CB14B",serialnumber:"4712646C" ,utilizacao:450,imagem:"5523b505b7b72"), equipamento(modelo:"CB14B",serialnumber:"4712646C" ,utilizacao:450,imagem:"5523b505b7b72"), equipamento(modelo:"CB14B",serialnumber:"4712646C" ,utilizacao:450,imagem:"5523b505b7b72"), equipamento(modelo:"CB14B",serialnumber:"4712646C" ,utilizacao:450,imagem:"5523b505b7b72"), equipamento(modelo:"CB14B",serialnumber:"4712646C" ,utilizacao:450,imagem:"5523b505b7b72"), equipamento(modelo:"CB14B",serialnumber:"4712646C" ,utilizacao:450,imagem:"5523b505b7b72"), equipamento(modelo:"CB14B",serialnumber:"4712646C" ,utilizacao:450,imagem:"5523b505b7b72"), equipamento(modelo:"CB14B",serialnumber:"4712646C" ,utilizacao:450,imagem:"5523b505b7b72"), equipamento(modelo:"CB14B",serialnumber:"4712646C" ,utilizacao:450,imagem:"5523b505b7b72")]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        collectionView.collectionViewLayout = gridFlowLayout
        collectionView.dataSource = self
        isGridFlowLayoutUsed = true
        super.addNavBarLogo()
        super.addNavBarSettings()
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
        //        gridButton.isSelected = isGridFlowLayoutUsed
        //        gridButton.backgroundColor = gridButton.isSelected ? UIColor.groupTableViewBackground : UIColor.green
        //
        //        listButton.isSelected = !isGridFlowLayoutUsed
        //        listButton.backgroundColor = listButton.isSelected ? UIColor.groupTableViewBackground : UIColor.green
        
        let layout = isGridFlowLayoutUsed ? gridFlowLayout : listFlowLayout
        UIView.animate(withDuration: 0.2) { () -> Void in
            self.collectionView.collectionViewLayout.invalidateLayout()
            self.collectionView.setCollectionViewLayout(layout, animated: true)
            
            
        }
    }
}

extension ListarMaquinas: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return array.count
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: CollectionViewEquipamentos.self), for: indexPath) as! CollectionViewEquipamentos
        
        if let imageName = array[indexPath.row].imagem {
            
            cell.imageEquipamento.contentMode = .scaleAspectFit
            cell.imageEquipamento.image = UIImage(named: imageName)
        }
        if let modeloText = array[indexPath.row].modelo {
            
            cell.modeloEquipamento.text = modeloText
        }
        if let utilizacaoText = array[indexPath.row].utilizacao {
            
            cell.utilizacaoEquipamento.text = "Utilização: \(utilizacaoText) H"
        }
        
        if let numeroSerieText = array[indexPath.row].serialNumber {
                  
                  cell.numeroSerieEquipamento.text = "N.Série: \(numeroSerieText)"
              }
        cell.cellView.setCardView(view: cell.cellView)
        return cell
        
    }
}
extension UIView {
    
    func setCardView(view : UIView){
        
        view.layer.cornerRadius = 15
        view.layer.applySketchShadow(color: .black, alpha: 0.16, x: 0, y: 3, blur: 6, spread: 0)
        view.layer.masksToBounds = false
    }
}






