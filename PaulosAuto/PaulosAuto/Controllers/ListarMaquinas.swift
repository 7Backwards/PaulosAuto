//
//  ViewController.swift
//  Grid&ListCollectionView
//
//  Created by Mohammed Azeem Azeez on 04/03/2019.
//  Copyright © 2019 Riverswave Technologies Ltd. All rights reserved.
//

import UIKit

class ListarMaquinas: ViewController {
    
    

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
    fileprivate let Array = ["River Cruise", "North Island"]
    fileprivate let itemsToDisplay = [("5523b3f1cf47c"), ("5523b505b7b72")] // image names
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        collectionView.collectionViewLayout = gridFlowLayout
        collectionView.dataSource = self
        isGridFlowLayoutUsed = true
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
        return itemsToDisplay.count
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: CollectionViewEquipamentos.self), for: indexPath) as! CollectionViewEquipamentos
        
        let index = indexPath.row % itemsToDisplay.count
        let imageName = itemsToDisplay[index]
        cell.imageEquipamento.image = UIImage(named: imageName)
        cell.modeloEquipamento.text = Array[indexPath.row]
        cell.cellView.setCardView(view: cell.cellView)
      
        return cell
        
    }
}
extension UIView {
    
    func setCardView(view : UIView){
        
        view.layer.cornerRadius = 2.0
        view.layer.borderColor  =  UIColor.lightGray.cgColor
        view.layer.borderWidth = 2.0
        view.layer.shadowOpacity = 1.0
        view.layer.shadowColor =  UIColor.clear.cgColor
        view.layer.shadowRadius = 2.0
        view.layer.shadowOffset = CGSize(width:3, height: 3)
        view.layer.masksToBounds = true
        
    }
}




