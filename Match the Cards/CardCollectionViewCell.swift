//
//  CardCollectionViewCell.swift
//  Match the Cards
//
//  Created by Lenka Hao on 4/27/20.
//  Copyright © 2020 Lenka Hao. All rights reserved.
//

import UIKit

class CardCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var frontImgView: UIImageView!
    @IBOutlet weak var backImgView: UIImageView!
    var card:Card?
    
    func setCard(_ card:Card) {
        self.card = card
        frontImgView.image = UIImage(named: card.getImgName())
        
        // Due to possible cell reuse, need to make sure the flip state
        if card.getIsFlipped() {
            UIView.transition(from: backImgView, to: frontImgView, duration: 0, options: [.transitionFlipFromLeft, .showHideTransitionViews], completion: nil)
        }
        else {
            UIView.transition(from: frontImgView, to: backImgView, duration: 0, options: [.transitionFlipFromRight, .showHideTransitionViews], completion: nil)
        }
    }
    
    func flipToFront() {
        UIView.transition(from: backImgView, to: frontImgView, duration: 0.3, options: [.transitionFlipFromLeft, .showHideTransitionViews], completion: nil)
    }
    
    func flipToBack() {
        UIView.transition(from: frontImgView, to: backImgView, duration: 0.3, options: [.transitionFlipFromRight, .showHideTransitionViews], completion: nil)
    }
}
