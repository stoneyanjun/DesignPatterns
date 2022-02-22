//
//  MoneyPile.swift
//  DesignPatterns
//
//  Created by stone on 2022/2/22.
//

import Foundation

protocol Withdrawing {
    func withdraw(_ amount: Int) -> Bool
}

class MoneyPile: Withdrawing {
    enum MoneyPileType: Int, Hashable {
        case hundred = 100
        case fifty = 50
        case ten = 10
    }
    
    private var type: MoneyPileType
    private var value: Int
    private var quality: Int
    public var next: Withdrawing?
    
    init(quality: Int, type: MoneyPileType, next: Withdrawing?) {
        self.quality = quality
        self.next = next
        self.type = type
        self.value = type.rawValue
    }
    
    
    func withdraw(_ amount: Int) -> Bool {
        guard canWithDrawSome(amount) else {
            return next?.withdraw(amount) ?? false
        }
        
        let maxWithdrawQuality: Int = amount / value
        let withdrawQuality = (maxWithdrawQuality > quality) ? quality : maxWithdrawQuality
        let remainAmount = amount - (withdrawQuality * value)
        if remainAmount == 0 {
            quality -= withdrawQuality
            return true
        } else {
            let result = next?.withdraw(remainAmount) ?? false
            if result {
                quality -= withdrawQuality
            }
            return result
        }
    }
    
    private func canWithDrawSome(_ amount: Int) -> Bool {
        (value <= amount && quality > 0)
    }
}
