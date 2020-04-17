//
//  FilterShowEquipmentoViewController.swift
//  PaulosAuto
//
//  Created by Gonçalo Neves on 27/03/2020.
//  Copyright © 2020 Gonçalo Neves. All rights reserved.
//

import UIKit


    
class FilterShowEquipmentViewController: ViewController {
    
    
    // MARK: - Outlets
    
    
    @IBOutlet weak var segmentControl: UISegmentedControl!
    @IBOutlet weak var handlerView: UIView!
    @IBOutlet weak var orderByView: UIView!
    @IBOutlet weak var categoryView: UIView!
    @IBOutlet weak var dateContractView: UIView!
    @IBOutlet weak var hoursUtilizationView: UIView!
    @IBOutlet weak var modelView: UIView!
    @IBOutlet weak var serialNumberView: UIView!
    @IBOutlet weak var outerView: UIView!
    @IBOutlet weak var dateContractCheckImageView: UIImageView!
    @IBOutlet weak var hoursUtilizationCheckImageView: UIImageView!
    @IBOutlet weak var serialNumberCheckImageView: UIImageView!
    @IBOutlet weak var modelCheckImageView: UIImageView!
    @IBOutlet weak var dateContractLabel: UILabel!
    @IBOutlet weak var hoursUtilizationLabel: UILabel!
    @IBOutlet weak var modelLabel: UILabel!
    @IBOutlet weak var serialNumberLabel: UILabel!
    @IBOutlet weak var outerViewHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var barView: UIView!
    @IBOutlet weak var topView: UIView!
    @IBOutlet weak var collectionView: UICollectionView!
    
    
    // MARK: - Properties
    
    var delegate: DataDelegate?  
    var activeOrderByFiltered : Int?
    var activeCategoryFiltered : String?
    var equipments: [Equipment] = []
    var categoryEquipments: [String] = []
    let cellLayout = CategoriesEquipmentCellLayout()
    let listEquipmentViewController = ListEquipmentViewController()
    
    // MARK: - Private
    
    
    private func setSelectedOrderBy() {
        
        switch (activeOrderByFiltered) {
            
        case 0:
            dateContractView.backgroundColor = UIColor(red: 222/255.0, green: 63/255.0, blue: 63/255.0, alpha: 0.05)
            dateContractLabel.textColor = UIColor(red: 214/255.0, green: 4/255.0, blue: 3/255.0, alpha: 1)
            dateContractCheckImageView.isHidden = false
            hoursUtilizationView.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.05)
            hoursUtilizationLabel.textColor = .black
            hoursUtilizationCheckImageView.isHidden = true
            modelView.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.05)
            modelLabel.textColor = .black
            modelCheckImageView.isHidden = true
            serialNumberView.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.05)
            serialNumberLabel.textColor = .black
            serialNumberCheckImageView.isHidden = true
            
            
        case 1:
            hoursUtilizationView.backgroundColor = UIColor(red: 222/255.0, green: 63/255.0, blue: 63/255.0, alpha: 0.05)
            hoursUtilizationLabel.textColor = UIColor(red: 214/255.0, green: 4/255.0, blue: 3/255.0, alpha: 1)
            hoursUtilizationCheckImageView.isHidden = false
            modelView.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.05)
            modelLabel.textColor = .black
            modelCheckImageView.isHidden = true
            serialNumberView.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.05)
            serialNumberLabel.textColor = .black
            serialNumberCheckImageView.isHidden = true
            dateContractView.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.05)
            dateContractLabel.textColor = .black
            dateContractCheckImageView.isHidden = true
            
            
        case 2:
            modelView.backgroundColor = UIColor(red: 222/255.0, green: 63/255.0, blue: 63/255.0, alpha: 0.05)
            modelLabel.textColor = UIColor(red: 214/255.0, green: 4/255.0, blue: 3/255.0, alpha: 1)
            modelCheckImageView.isHidden = false
            serialNumberView.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.05)
            serialNumberLabel.textColor = .black
            serialNumberCheckImageView.isHidden = true
            dateContractView.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.05)
            dateContractLabel.textColor = .black
            dateContractCheckImageView.isHidden = true
            hoursUtilizationView.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.05)
            hoursUtilizationLabel.textColor = .black
            hoursUtilizationCheckImageView.isHidden = true
            
            
        case 3:
            serialNumberView.backgroundColor = UIColor(red: 222/255.0, green: 63/255.0, blue: 63/255.0, alpha: 0.05)
            serialNumberLabel.textColor = UIColor(red: 214/255.0, green: 4/255.0, blue: 3/255.0, alpha: 1)
            serialNumberCheckImageView.isHidden = false
            dateContractView.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.05)
            dateContractLabel.textColor = .black
            dateContractCheckImageView.isHidden = true
            hoursUtilizationView.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.05)
            hoursUtilizationLabel.textColor = .black
            hoursUtilizationCheckImageView.isHidden = true
            modelView.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.05)
            modelLabel.textColor = .black
            modelCheckImageView.isHidden = true
            
            
        default: break
            
        }
    }
    
    
    private func setupView() {
        
        handlerView.layer.masksToBounds = true
        handlerView.layer.cornerRadius = 3
        
        dateContractView.layer.masksToBounds = true
        dateContractView.layer.cornerRadius = 20
        dateContractView.backgroundColor = UIColor(red: 222/255.0, green: 63/255.0, blue: 63/255.0, alpha: 0.05)
        
        hoursUtilizationView.layer.masksToBounds = true
        hoursUtilizationView.layer.cornerRadius = 20
        hoursUtilizationView.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.05)
        
        modelView.layer.masksToBounds = true
        modelView.layer.cornerRadius = 20
        modelView.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.05)
        
        serialNumberView.layer.masksToBounds = true
        serialNumberView.layer.cornerRadius = 20
        serialNumberView.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.05)
        
        topView.setCardViewTopCorners(view: topView)
    
        segmentControl.setLayoutSegmentControl(segmentControl)
        
        barView.widthAnchor.constraint(equalTo: segmentControl.widthAnchor, multiplier: 1 / CGFloat(segmentControl.numberOfSegments)).isActive = true
        
        collectionView.collectionViewLayout = cellLayout
    }
    
    private func getCategories() {
        
        for item in equipments {
            if !(categoryEquipments.contains(item.type!)) {
                
                categoryEquipments.append(item.type!)
            }
        }
    }
    
    
    // MARK: - Public
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        setupView()
        collectionView.dataSource = self
        collectionView.delegate = self
        view.addGestureRecognizer(UIPanGestureRecognizer(target: self, action: #selector(self.onDrage(_:))))
        self.getCategories()
        self.setSelectedOrderBy()
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "newDataNotif"), object: nil)

    }
    
    @objc override func onDrage(_ sender:UIPanGestureRecognizer) {
        
        let percentThreshold:CGFloat = 0.3
        let translation = sender.translation(in: view)
        
        let getIndex = segmentControl.selectedSegmentIndex
               
               switch (getIndex) {
                   
               case 0:
                   let newY = ensureRange(value: view.frame.minY + translation.y, minimum: 0, maximum: view.frame.size.height)
                   let progress = progressAlongAxis(newY, view.bounds.width)
                   view.frame.origin.y = newY
                   
                   if sender.state == .ended {
                       
                       let velocity = sender.velocity(in: view)
                       if velocity.y >= 300 || progress > percentThreshold {
                           
                           dismiss(animated: true, completion: nil)
                       } else {
                           
                           UIView.animate(withDuration: 0.2, animations: {
                               
                               self.view.frame.origin.y = 0
                           })
                       }
                   }
                   sender.setTranslation(.zero, in: view)
                   
                
               case 1:
                   let newY = ensureRange(value: outerView.frame.minY + translation.y, minimum: 0, maximum: outerView.frame.size.height)
                   let progress = progressAlongAxis(newY, outerView.bounds.width)
                   outerView.frame.origin.y = newY
                   
                   if sender.state == .ended {
                       
                       let velocity = sender.velocity(in: view)
                       if velocity.y >= 300 || progress > percentThreshold {
                           
                        dismiss(animated: true, completion: nil)
                       } else {
                           
                           UIView.animate(withDuration: 0.2, animations: {
                               
                               self.view.frame.origin.y = 0
                           })
                       }
                   }
                   sender.setTranslation(.zero, in: outerView)
                   
               default: break
               }
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        let touch = touches.first!
        if touch.view?.tag == 100 {
            
            activeOrderByFiltered = 0
            if let delegate = self.delegate {
                delegate.updateActiveOrderByFiltered(newOrderBy: activeOrderByFiltered ?? 0)
                delegate.reloadCollectionView()
            }
            
        }
        else if touch.view?.tag == 200 {
            
            activeOrderByFiltered = 1
            if let delegate = self.delegate {
                delegate.updateActiveOrderByFiltered(newOrderBy: activeOrderByFiltered ?? 0)
                delegate.reloadCollectionView()
            }
        }
        else if touch.view?.tag == 300 {
            
            activeOrderByFiltered = 2
            if let delegate = self.delegate {
                delegate.updateActiveOrderByFiltered(newOrderBy: activeOrderByFiltered ?? 0)
                delegate.reloadCollectionView()
            }
        }
        else if touch.view?.tag == 400 {
            
            activeOrderByFiltered = 3
            if let delegate = self.delegate {
                delegate.updateActiveOrderByFiltered(newOrderBy: activeOrderByFiltered ?? 0)
                delegate.reloadCollectionView()
            }
        }
        else if touch.view?.tag == 0{
            
            self.dismiss(animated: true)
        }
        
        self.setSelectedOrderBy()
        
    }
    
    
    // MARK: - Action
    
    
    @objc func segmentedControlValueChanged(_ sender: UISegmentedControl) {
           
           UIView.animate(withDuration: 0.3) {
               
               self.barView.frame.origin.x = (CGFloat(self.segmentControl.frame.width) / CGFloat(self.segmentControl.numberOfSegments)) * CGFloat(self.segmentControl.selectedSegmentIndex) + self.segmentControl.frame.origin.x
           }
    }
    
    @IBAction func segmentControlAction(_ sender: Any) {
        
        let getIndex = segmentControl.selectedSegmentIndex
        
        switch (getIndex) {
            
        case 0:
            UIView.animate(withDuration: 0.5, animations: {
                
                self.categoryView.isHidden = true
                self.categoryView.fadeIn()
                self.outerViewHeightConstraint = self.outerViewHeightConstraint.changeMultiplier(self.outerViewHeightConstraint, multiplier: 0.5)
                self.view.layoutIfNeeded()
            })
            self.orderByView.isHidden = false
            self.orderByView.fadeOut()
            self.segmentedControlValueChanged(self.segmentControl)
            
            
        case 1:
            UIView.animate(withDuration: 0.5, animations: {
                
                self.orderByView.fadeIn()
                self.orderByView.isHidden = true
                self.outerViewHeightConstraint = self.outerViewHeightConstraint.changeMultiplier(self.outerViewHeightConstraint, multiplier: 0.95)
                self.view.layoutIfNeeded()
            })
            self.categoryView.isHidden = false
            self.categoryView.fadeOut()
            self.segmentedControlValueChanged(self.segmentControl)
            
            
        default: break
        }
    }
}
