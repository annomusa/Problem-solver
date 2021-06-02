//
//  MakingAnagrams.swift
//  LeetCode
//
//  Created by Anno Musa on 23/05/21.
//

import Foundation

class MakingAnagrams {
    func makeAnagram(a: String, b: String) -> Int {
        var countRemove: Int = 0
        
        var dictionary: [Character: Int] = [:]
        
        for char in a {
            if let countChar = dictionary[char] {
                dictionary[char] = countChar + 1
            } else {
                dictionary[char] = 1
            }
        }
        
        for char in b {
            if let countChar = dictionary[char] {
                dictionary[char] = countChar - 1
            } else {
                dictionary[char] = -1
            }
        }
        
        for (k,v) in dictionary {
            countRemove += abs(v)
        }
        
        return countRemove
    }
}
