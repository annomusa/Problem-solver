//
//  FindTheNumber.swift
//  LeetCode
//
//  Created by Anno Musa on 26/05/21.
//

import Foundation

class FindTheNumber {
    func findNumber(arr: [Int], k: Int) -> String {
        for i in arr {
            if i == k {
                return "YES"
            }
        }
        
        return "NO"
    }
}

class OddNumber {
    func oddNumbers(l: Int, r: Int) -> [Int] {
        
        return (l...r).filter { ($0 % 2 == 1) }
    }
}
