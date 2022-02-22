//
//  ATM.swift
//  DesignPatterns
//
//  Created by stone on 2022/2/22.
//

import Foundation

class ATM {
    private var startPile: MoneyPile
    
    init(_ pileArray: [(MoneyPile.MoneyPileType, Int)]) {
        guard !pileArray.isEmpty else {
            startPile = MoneyPile(quality: 0, type: .ten, next: nil)
            return
        }
        
        startPile = MoneyPile(quality: pileArray[0].1, type: pileArray[0].0, next: nil)
        var previousPile = startPile
        var index = 1
        while (index < pileArray.count) {
            let pile = MoneyPile(quality: pileArray[index].1, type: pileArray[index].0, next: nil)
            previousPile.next = pile
            previousPile = pile
            index += 1
        }
    }
    
    func withdraw(_ amount: Int) -> Bool {
        startPile.withdraw(amount)
    }
}
