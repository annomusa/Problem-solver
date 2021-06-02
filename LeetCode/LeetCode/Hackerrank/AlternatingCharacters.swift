//
//  AlternatingCharacters.swift
//  LeetCode
//
//  Created by Anno Musa on 24/05/21.
//

import Foundation

class AlternatingCharacters {
    func alternatingCharacters(s: String) -> Int {
        var res = 0
        
        var prevChar: Character?
        for char in s {
            if let prev = prevChar {
                if prev == char {
                    res += 1
                } else {
                    prevChar = char
                }
            } else {
                prevChar = char
            }
        }
        
        return res
    }
}
