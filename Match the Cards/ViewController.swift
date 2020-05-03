//
//  ViewController.swift
//  Match the Cards
//
//  Created by Lenka Hao on 4/26/20.
//  Copyright © 2020 Lenka Hao. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    @IBOutlet weak var timerLabel: UILabel!
    @IBOutlet weak var collectionView: UICollectionView!
    
    var model = CardModel()
    var cardArray = [Card]()
    var firstFlippedCardIndex:IndexPath?
    var timer:Timer?
    var milliseconds:Float = 10 * 1000
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        cardArray = model.getCards()
        
        timer = Timer.scheduledTimer(timeInterval: 0.001, target: self, selector: #selector(timerElapsed), userInfo: nil, repeats: true)
        RunLoop.main.add(timer!, forMode: .common)
    }
    
    // MARK: - Protocols
    
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
        if !card.getIsFlipped() && !card.getIsMatched() {
            cell.flipToFront()
            card.toggleIsFlipped()
            if firstFlippedCardIndex == nil {
                firstFlippedCardIndex = indexPath
            }
            else {
                self.isMatching(indexPath)
            }
        }
    }
    
    // MARK: - Timer
    
    @objc func timerElapsed() {
        milliseconds -= 1
        let timerText = String(format: "%.2f", milliseconds/1000)
        timerLabel.text = "Time Remaining: \(timerText)"
        
        if milliseconds <= 0 {
            timer?.invalidate()
        }
    }
    
    // MARK: - Game logic
    
    func isMatching(_ secondFlippedCardIndex:IndexPath) {
        
        let firstCard = cardArray[firstFlippedCardIndex!.row]
        let secondCard = cardArray[secondFlippedCardIndex.row]
        
        let firstCardCell = collectionView.cellForItem(at: firstFlippedCardIndex!) as? CardCollectionViewCell
        let secondCardCell = collectionView.cellForItem(at: secondFlippedCardIndex) as? CardCollectionViewCell
        
        // if match: set card property, remove the cards
        if firstCard.getImgName() == secondCard.getImgName() {
            firstCard.setIsMatched()
            secondCard.setIsMatched()
            firstCardCell?.removeFromView()
            secondCardCell?.removeFromView()
        }
        // if not a match: set card property, flip cards back
        else {
            firstCard.toggleIsFlipped()
            secondCard.toggleIsFlipped()
            firstCardCell?.flipToBack()
            secondCardCell?.flipToBack()
        }
        
        // force reload the first card when it's recycled and becomes nil
        if firstCardCell == nil {
            collectionView.reloadItems(at: [firstFlippedCardIndex!])
        }
    
        firstFlippedCardIndex = nil
    }
}
