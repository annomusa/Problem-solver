//
//  SalesByMatch.swift
//  LeetCode
//
//  Created by Anno Musa on 23/05/21.
//

import Foundation

class SalesByMatch {
    func sockMerchant(n: Int, ar: [Int]) -> Int {
        
        var pairs: Int = 0
        var sockDictionary: [Int: Bool] = [:]
        for i in 0..<n {
            let current = ar[i]
            if let isExist = sockDictionary[current] {
                pairs += 1
                sockDictionary.removeValue(forKey: current)
            } else {
                sockDictionary[current] = true
            }
        }
        
        return pairs
    }
}
