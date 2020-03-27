//
//  FilterShowEquipamentoViewController.swift
//  PaulosAuto
//
//  Created by Gonçalo Neves on 27/03/2020.
//  Copyright © 2020 Gonçalo Neves. All rights reserved.
//

import UIKit

class FilterShowEquipamentoViewController: ViewController {
    
    // MARK: - Outlets
    
    
    @IBOutlet weak var SnapShotImageView: UIImageView!
    @IBOutlet weak var dimmerView: UIView!
    @IBOutlet weak var cardView: UIView!
    @IBOutlet weak var cardViewTopConstraint: NSLayoutConstraint!
    @IBOutlet weak var HandlerView: UIView!
    
    
    // MARK: - Constants
    
    
    let keyWindow = UIApplication.shared.connectedScenes
        .filter({$0.activationState == .foregroundActive})
        .map({$0 as? UIWindowScene})
        .compactMap({$0})
        .first?.windows
        .filter({$0.isKeyWindow}).first
    
    enum CardViewState {
        case expanded
        case normal
    }
    
    // MARK: - Properties
    
    
    var snapShotImage: UIImage?
    var cardPanStartingTopConstraint : CGFloat = 0.0
    var cardPanStartingTopConstant : CGFloat = 30.0
    var cardViewState : CardViewState = .normal

    
    
    // MARK: - Private
    
    private func showCard(atState: CardViewState = .normal) {
        
        self.view.layoutIfNeeded()
        if let safeAreaHeight = keyWindow?.safeAreaLayoutGuide.layoutFrame.size.height,
            let bottomPadding = keyWindow?.safeAreaInsets.bottom {
            
            if atState == .expanded {

                cardViewTopConstraint.constant = 30.0
            } else {
                
                cardViewTopConstraint.constant = (safeAreaHeight + bottomPadding) / 2.0
            }
            cardPanStartingTopConstraint = cardViewTopConstraint.constant
        }
        let showCard = UIViewPropertyAnimator(duration: 0.25, curve: .easeIn, animations: {
            
            self.view.layoutIfNeeded()
        })
        showCard.addAnimations {
            
            self.dimmerView.alpha = 0.7
        }
        showCard.startAnimation()
    }
    
    private func dimAlphaWithCardTopConstraint(value: CGFloat) -> CGFloat {
        let fullDimAlpha : CGFloat = 0.7
        
        guard let safeAreaHeight = keyWindow?.safeAreaLayoutGuide.layoutFrame.size.height,
            let bottomPadding = keyWindow?.safeAreaInsets.bottom else {
                
                return fullDimAlpha
        }
        let fullDimPosition = (safeAreaHeight + bottomPadding) / 2.0
        let noDimPosition = safeAreaHeight + bottomPadding
        if value < fullDimPosition {
            
            return fullDimAlpha
        }
        if value > noDimPosition {
            
            return 0.0
        }
        return fullDimAlpha * 1 - ((value - fullDimPosition) / fullDimPosition)
    }
    
    private func hideCardAndGoBack() {
        
        self.view.layoutIfNeeded()
        if let safeAreaHeight = keyWindow?.safeAreaLayoutGuide.layoutFrame.size.height,
            let bottomPadding = keyWindow?.safeAreaInsets.bottom {
            
            cardViewTopConstraint.constant = safeAreaHeight + bottomPadding
        }
        let hideCard = UIViewPropertyAnimator(duration: 0.25, curve: .easeIn, animations: {
            
            self.view.layoutIfNeeded()
        })
        hideCard.addAnimations {
            
            self.dimmerView.alpha = 0.0
        }
        hideCard.addCompletion({ position in
            if position == .end {
                
                if(self.presentingViewController != nil) {
                    
                    self.dismiss(animated: false, completion: nil)
                }
            }
        })
        hideCard.startAnimation()
    }
    
    private func setupView() {
        
        let viewPan = UIPanGestureRecognizer(target: self, action: #selector(viewPanned(_:)))
        let dimmerTap = UITapGestureRecognizer(target: self, action: #selector(dimmerViewTapped(_:)))
        SnapShotImageView.image = snapShotImage
        cardView.clipsToBounds = true
        cardView.layer.cornerRadius = 15
        cardView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        if let safeAreaHeight = keyWindow?.safeAreaLayoutGuide.layoutFrame.size.height,
            let bottomPadding = keyWindow?.safeAreaInsets.bottom {
            
            cardViewTopConstraint.constant = safeAreaHeight + bottomPadding
        }
        dimmerView.alpha = 0.0
        dimmerView.addGestureRecognizer(dimmerTap)
        dimmerView.isUserInteractionEnabled = true
        viewPan.delaysTouchesBegan = false
        viewPan.delaysTouchesEnded = false
        self.view.addGestureRecognizer(viewPan)
        HandlerView.clipsToBounds = true
        HandlerView.layer.cornerRadius = 3.0
    }
    
    // MARK: - Public
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        setupView()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        super.viewDidAppear(animated)
        showCard()

    }
    
    //MARK: Actions
    
    
    @IBAction func dimmerViewTapped(_ tapRecognizer: UITapGestureRecognizer) {
        hideCardAndGoBack()
    }
    
    
    @IBAction func viewPanned(_ panRecognizer: UIPanGestureRecognizer) {
        
        let translation = panRecognizer.translation(in: self.view)
        let velocity = panRecognizer.velocity(in: self.view)
        switch panRecognizer.state {
        case .began:
            cardPanStartingTopConstant = cardViewTopConstraint.constant
        case .changed :
            if self.cardPanStartingTopConstant + translation.y > 30.0 {
                self.cardViewTopConstraint.constant = self.cardPanStartingTopConstraint + translation.y
            }
            dimmerView.alpha = dimAlphaWithCardTopConstraint(value: self.cardViewTopConstraint.constant)
        case .ended :
            // if user drag down with a very fast speed (ie. swipe)
            if velocity.y > 1500.0 {
                // hide the card and dismiss current view controller
                hideCardAndGoBack()
                return
            }
            
            if let safeAreaHeight = keyWindow?.safeAreaLayoutGuide.layoutFrame.size.height,
                let bottomPadding = keyWindow?.safeAreaInsets.bottom {
                
                if self.cardViewTopConstraint.constant < (safeAreaHeight + bottomPadding) * 0.25 {
                    // show the card at expanded state
                    showCard(atState: .expanded)
                } else if self.cardViewTopConstraint.constant < (safeAreaHeight) - 70 {
                    // show the card at normal state
                    showCard(atState: .normal)
                } else {
                    // hide the card and dismiss current view controller
                    hideCardAndGoBack()
                }
            }
        default:
            break
        }
    }
}
