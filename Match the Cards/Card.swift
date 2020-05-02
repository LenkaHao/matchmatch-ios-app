//
//  Card.swift
//  Match the Cards
//
//  Created by Lenka Hao on 4/27/20.
//  Copyright © 2020 Lenka Hao. All rights reserved.
//

import Foundation

class Card {
    private var imgName = ""
    private var isFlipped = false
    private var isMatched = false
    
    func getImgName() -> String {
        return self.imgName
    }
    
    func setImgName(name:String) {
        self.imgName = name
    }
    
    func getIsFlipped() -> Bool {
        return self.isFlipped
    }
    
    func toggleIsFlipped() {
        self.isFlipped = !self.isFlipped
    }
    
    func getIsMatched() -> Bool {
        return self.isMatched
    }
    
    func setIsMatched() {
        self.isMatched = true
    }
}
