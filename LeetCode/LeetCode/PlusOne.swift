//
//  PlusOne.swift
//  LeetCode
//
//  Created by Anno Musa on 21/05/21.
//

import Foundation

class PlusOne {
    func plusOne(_ digits: [Int]) -> [Int] {
        
        var result: [Int] = []
        var isExceeding: Bool = false
        for (index, digit) in digits.reversed().enumerated() {
            
            if isExceeding {
                if digit == 9 {
                    result.append(0)
                    isExceeding = true
                    if digits.count == index + 1 {
                        result.append(1)
                    }
                } else {
                    result.append(digit + 1)
                    isExceeding = false
                }
            } else if result.isEmpty {
                if digit == 9 {
                    result.append(0)
                    isExceeding = true
                    if digits.count == index + 1 {
                        result.append(1)
                    }
                } else {
                    result.append(digit + 1)
                    isExceeding = false
                }
            } else {
                result.append(digit)
                isExceeding = false
            }
        }
        
        return result.reversed()
    }
    
}
