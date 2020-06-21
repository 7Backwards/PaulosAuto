//
//  FilterShowEquipmentViewController.swift
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
    @IBOutlet weak var barView: UIView!
    @IBOutlet weak var topView: UIView!
    @IBOutlet weak var dateContractCheckImageView: UIImageView!
    @IBOutlet weak var hoursUtilizationCheckImageView: UIImageView!
    @IBOutlet weak var serialNumberCheckImageView: UIImageView!
    @IBOutlet weak var modelCheckImageView: UIImageView!
    @IBOutlet weak var dateContractLabel: UILabel!
    @IBOutlet weak var hoursUtilizationLabel: UILabel!
    @IBOutlet weak var modelLabel: UILabel!
    @IBOutlet weak var serialNumberLabel: UILabel!
    @IBOutlet weak var outerViewHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var orderByStackView: UIStackView!
    
    
    // MARK: - Properties
    
    
    var delegate: DataDelegate?  
    var activeOrderByFiltered : Int?
    var activeCategoryFiltered : [String] = []
    var equipments: [EquipmentModel] = []
    var categoryEquipments: [String] = []
    let cellLayout = CategoriesEquipmentCellLayout()
    let listEquipmentViewController = ListEquipmentViewController()
    var heightCell : CGFloat = 0
    
    
    // MARK: - Override inherited functions
    
    
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
        var newY : CGFloat
        var progress : CGFloat = 0
        let getIndex = segmentControl.selectedSegmentIndex
        
        switch (getIndex) {
            
        case 0:
            newY = ensureRange(value: view.frame.minY + translation.y, minimum: 0, maximum: view.frame.size.height)
            progress = progressAlongAxis(newY, view.bounds.width)
            view.frame.origin.y = newY
            
        case 1:
            if self.outerViewHeightConstraint.multiplier < 1 {
                
                newY = ensureRange(value: view.frame.minY + translation.y, minimum: 0, maximum: view.frame.size.height)
                progress = progressAlongAxis(newY, view.bounds.width)
                view.frame.origin.y = newY
                
            }
            else {
                newY = ensureRange(value: outerView.frame.minY + translation.y, minimum: 0, maximum: outerView.frame.size.height)
                progress = progressAlongAxis(newY, outerView.bounds.width)
                outerView.frame.origin.y = newY
            }
        default: break
        }
        
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
        sender.setTranslation(.zero, in: outerView)
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
    
    
    // MARK: - Private
    
    
    private func setSelectedOrderBy() {
        
        switch (activeOrderByFiltered) {
            
        case 0:
            dateContractView.backgroundColor = .redTransparent5
            dateContractLabel.textColor = .RedPaulosAuto
            dateContractCheckImageView.isHidden = false
            hoursUtilizationView.backgroundColor = .blackTransparent
            hoursUtilizationLabel.textColor = .black
            hoursUtilizationCheckImageView.isHidden = true
            modelView.backgroundColor = .blackTransparent
            modelLabel.textColor = .black
            modelCheckImageView.isHidden = true
            serialNumberView.backgroundColor = .blackTransparent
            serialNumberLabel.textColor = .black
            serialNumberCheckImageView.isHidden = true
            
            
        case 1:
            hoursUtilizationView.backgroundColor = .redTransparent5
            hoursUtilizationLabel.textColor = .RedPaulosAuto
            hoursUtilizationCheckImageView.isHidden = false
            modelView.backgroundColor = .blackTransparent
            modelLabel.textColor = .black
            modelCheckImageView.isHidden = true
            serialNumberView.backgroundColor = .blackTransparent
            serialNumberLabel.textColor = .black
            serialNumberCheckImageView.isHidden = true
            dateContractView.backgroundColor = .blackTransparent
            dateContractLabel.textColor = .black
            dateContractCheckImageView.isHidden = true
            
            
        case 2:
            modelView.backgroundColor = .redTransparent5
            modelLabel.textColor = .RedPaulosAuto
            modelCheckImageView.isHidden = false
            serialNumberView.backgroundColor = .blackTransparent
            serialNumberLabel.textColor = .black
            serialNumberCheckImageView.isHidden = true
            dateContractView.backgroundColor = .blackTransparent
            dateContractLabel.textColor = .black
            dateContractCheckImageView.isHidden = true
            hoursUtilizationView.backgroundColor = .blackTransparent
            hoursUtilizationLabel.textColor = .black
            hoursUtilizationCheckImageView.isHidden = true
            
            
        case 3:
            serialNumberView.backgroundColor = .redTransparent5
            serialNumberLabel.textColor = .RedPaulosAuto
            serialNumberCheckImageView.isHidden = false
            dateContractView.backgroundColor = .blackTransparent
            dateContractLabel.textColor = .black
            dateContractCheckImageView.isHidden = true
            hoursUtilizationView.backgroundColor = .blackTransparent
            hoursUtilizationLabel.textColor = .black
            hoursUtilizationCheckImageView.isHidden = true
            modelView.backgroundColor = .blackTransparent
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
        dateContractView.backgroundColor = .redTransparent5
        
        hoursUtilizationView.layer.masksToBounds = true
        hoursUtilizationView.layer.cornerRadius = 20
        hoursUtilizationView.backgroundColor = .blackTransparent
        
        modelView.layer.masksToBounds = true
        modelView.layer.cornerRadius = 20
        modelView.backgroundColor = .blackTransparent
        
        serialNumberView.layer.masksToBounds = true
        serialNumberView.layer.cornerRadius = 20
        serialNumberView.backgroundColor = .blackTransparent
        
        topView.setCardViewTopCorners()
        
        segmentControl.setLayoutSegmentControl(segmentControl)
        
        barView.widthAnchor.constraint(equalTo: segmentControl.widthAnchor, multiplier: 1 / CGFloat(segmentControl.numberOfSegments)).isActive = true
    }
    
    private func getCategories() {
        
        for item in equipments {
            if !(categoryEquipments.contains(item.type!)) {
                
                categoryEquipments.append(item.type!)
            }
        }
    }
    
    
    // MARK: - Public
    
    
    func refreshListEquipmentCollectionView() {
        
        if let delegate = self.delegate {
            
            delegate.updateActiveCategoryFiltered(newActiveCategory: self.activeCategoryFiltered)
            delegate.reloadCollectionView()
        }
    }
    
    
    // MARK: - Objc functions
    
    
    @objc func segmentedControlValueChanged(_ sender: UISegmentedControl) {
        
        UIView.animate(withDuration: 0.3) {
            
            self.barView.frame.origin.x = (CGFloat(self.segmentControl.frame.width) / CGFloat(self.segmentControl.numberOfSegments)) * CGFloat(self.segmentControl.selectedSegmentIndex) + self.segmentControl.frame.origin.x
        }
    }
    
    
    // MARK: - Actions
    
    
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
                if self.collectionView.numberOfItems(inSection: 0) <= 4 {
                    
                    self.outerViewHeightConstraint = self.outerViewHeightConstraint.changeMultiplier(self.outerViewHeightConstraint, multiplier: 0.5)
                }
                else if self.collectionView.numberOfItems(inSection: 0) <= 6 {
                    
                    self.outerViewHeightConstraint = self.outerViewHeightConstraint.changeMultiplier(self.outerViewHeightConstraint, multiplier: 0.71)
                }
                else {
                    
                    self.outerViewHeightConstraint = self.outerViewHeightConstraint.changeMultiplier(self.outerViewHeightConstraint, multiplier: 1)
                }
                self.view.layoutIfNeeded()
            })
            self.categoryView.isHidden = false
            self.categoryView.fadeOut()
            self.segmentedControlValueChanged(self.segmentControl)
            
            
        default: break
        }
    }
}
