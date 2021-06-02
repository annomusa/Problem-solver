//
//  RepeatedString.swift
//  LeetCode
//
//  Created by Anno Musa on 23/05/21.
//

import Foundation

class RepeatedString {
    func repeatedString(s: String, n: Int) -> Int {
        var numberOfA: Int = s.reduce(0) { res, char in
            return res + ((char == "a") ? 1 : 0)
        }
        
        var factor = n / s.count
        var remaining = n % s.count
        numberOfA *= factor
        
        for i in 0..<remaining {
            if s[i] == "a" {
                numberOfA += 1
            }
        }
        
        return numberOfA
    }
}
