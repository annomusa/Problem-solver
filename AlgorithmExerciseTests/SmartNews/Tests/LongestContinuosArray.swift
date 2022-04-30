//
//  LongestContinuosArray.swift
//  AlgorithmExerciseTests
//
//  Created by Anno Musa on 27/04/22.
//

import Foundation
import XCTest

// Given an unsorted integer list
// Find the longest number sequence which is continuous
// Example 1:
// Input: nums = [4,7,5,9,10,8,1,20]
// Output: [7,8,9,10]
// Example 2:
// Input: nums = [3,7,2,5,100,8,4,6,0,1]
// Output: [0,1,2,3,4,5,6,7,8]

// n log n * o (n => n log n)
private func longestSequence(nums: [Int]) -> [Int] {
    var res: [Int] = [] // n
    
    let nums = nums.sorted()
    
    var temp: [Int] = [nums[0]]
    
    for i in 1..<nums.count {
        
        let prev = nums[i-1]
        let curr = nums[i]
        
        if prev + 1 == curr {
            temp.append(curr)
        } else {
            if temp.count > res.count {
                res = temp
            }
            temp = [curr]
        }
    }
    
    return res
}

class LongestContinuousArrayTest : XCTestCase {
    
    func test1() {
        
        XCTAssertEqual(
            longestSequence(nums: [4,7,5,9,10,8,1,20]),
            [7,8,9,10]
        )
        
        XCTAssertEqual(
            longestSequence(nums: [3,7,2,5,100,8,4,6,0,1]),
            [0,1,2,3,4,5,6,7,8]
        )
    }
}

