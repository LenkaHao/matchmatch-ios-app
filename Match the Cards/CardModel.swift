//
//  CardModel.swift
//  Match the Cards
//
//  Created by Lenka Hao on 4/27/20.
//  Copyright © 2020 Lenka Hao. All rights reserved.
//

import Foundation

class CardModel {
    private let pairs = 8;
    
    func getCards() -> [Card] {
        var cards = [Card]()
        var usedCards = Set<Int>()
        
        // add unique pairs of cards
        for _ in 1...pairs {
            var random = Int.random(in: 1...13)
            while usedCards.contains(random) {
                random = Int.random(in: 1...13)
            }
            usedCards.insert(random)
            for _ in 1...2 {
                let card = Card()
                card.setImgName(name: "card\(random)")
                cards.append(card)
            }
        }
        
        // randomize card sequence
        cards.shuffle()
        
        return cards
    }
}
