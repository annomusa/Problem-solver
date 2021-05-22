//
//  EvenWord.swift
//  LeetCode
//
//  Created by Anno Musa on 21/05/21.
//

import Foundation

class EvenWord {
    
    public func solution(_ S : inout String) -> Int {
        
        var charDict: [Character: Int] = [:]
        for char in S {
            
            if let countChar = charDict[char] {
                charDict[char] = countChar + 1
            } else {
                charDict[char] = 1
            }
            
        }
        
        var shouldRemove: [Character] = []
        for pair in charDict {
            guard pair.value % 2 != 0 else { continue }
            shouldRemove.append(pair.key)
        }
        
        return shouldRemove.count
    }
    
}
