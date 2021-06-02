//
//  SherlockValidString.swift
//  LeetCode
//
//  Created by Anno Musa on 24/05/21.
//

import Foundation

class SherlockValidString {
    
    func isValid(s: String) -> String {
        
        return (isYes(s: s) ? "YES" : "NO")
    }
    
    func isYes(s: String) -> Bool {
        var dictChar: [Character: Int] = [:] // char, count
        for char in s {
            dictChar[char, default: 0] += 1
        }
        
        var dictOcc: [Int: Int] = [:] // count, occ
        for v in dictChar.values {
            dictOcc[v, default: 0] += 1
        }
        
        if dictOcc.values.count == 2 {
            let sorted = dictOcc.sorted { $0.value < $1.value }
            
            if sorted[0].1 > 1 { return false }
            
            return sorted[0].0 - 1 == sorted[1].0
                || sorted[0].0 - 1 == 0
        }
        
        return !(dictOcc.values.count > 2)
    }
    
}
