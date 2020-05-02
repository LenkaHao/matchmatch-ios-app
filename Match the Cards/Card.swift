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
        return imgName
    }
    
    func setImgName(name:String) {
        imgName = name
    }
    
}
