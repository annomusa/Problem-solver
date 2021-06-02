//
//  CountingValleys.swift
//  LeetCode
//
//  Created by Anno Musa on 23/05/21.
//

import Foundation

class CountingValleys {
    
    func countingValleys(steps: Int, path: String) -> Int {
        
        var sumOfValleys: Int = 0
        
        var isEnteringValleys: Bool = false
        var isExitingValleys: Bool = false
        var currentPosition: Int = 0 {
            didSet {
                
                if currentPosition < 0 {
                    isEnteringValleys = true
                    print("valleys: ", isEnteringValleys)
                }
                
                if currentPosition == 0, isEnteringValleys {
                    sumOfValleys += 1
                    isEnteringValleys = false
                    isExitingValleys = true
                    print("valleys sum: ", sumOfValleys)
                    print("valleys: ", currentPosition, "\n")
                } else {
                    print("valleys: ", currentPosition, "\n")
                }
            }
        }
        
        for char in path {
            print("valleys: ", char)
            if char == "D" {
                currentPosition -= 1
            } else { // char == "U"
                currentPosition += 1
            }
        }
        
        return sumOfValleys
    }
}
