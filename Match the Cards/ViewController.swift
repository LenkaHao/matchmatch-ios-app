//
//  ViewController.swift
//  Match the Cards
//
//  Created by Lenka Hao on 4/26/20.
//  Copyright © 2020 Lenka Hao. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    var model = CardModel()
    var cardArray = [Card]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        cardArray = model.getCards()
    }
    
    /******* Protocols ******/
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cardArray.count
    }
    
    // get a cell object, set a card for that cell
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CardCell", for: indexPath) as! CardCollectionViewCell
        
        let card = cardArray[indexPath.row]
        cell.setCard(card)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        // select cell and card
        let cell = collectionView.cellForItem(at: indexPath) as! CardCollectionViewCell
        let card = cardArray[indexPath.row]
        
        // flip according to the current status
        if !card.getIsFlipped() {
            cell.flipToFront()
        }
        else {
            cell.flipToBack()
        }
        card.toggleIsFlipped()
    }
}
