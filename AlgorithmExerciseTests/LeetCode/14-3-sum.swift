//
//  14-3-sum.swift
//  AlgorithmExerciseTests
//
//  Created by Anno Musa on 25/04/22.
//

import Foundation
import XCTest

private class Solution {
    func threeSum(_ nums: [Int]) -> [[Int]] {
        guard nums.count >= 3 else { return [] }
        
        var nums = nums.sorted()
        
        var results: [[Int]] = []
        var lastValue: Int?
        for i in 0..<nums.count-2 {
            
            if nums[i] == lastValue {
                continue
            } else {
                lastValue = nums[i]
            }
            
            var p1 = i+1
            var p2 = nums.count-1
            
            while p1 < p2 {
                var sum = nums[i] + nums[p1] + nums[p2]
                if sum == 0, Set([nums[i], nums[p1], nums[p2]]).count > 1 {
                    results.append([nums[i], nums[p1], nums[p2]])
                    
                    p2 -= 1
                    p1 += 1
                    while p1 < p2, nums[p1] == nums[p1-1] {
                        p1 += 1
                    }
                    
                } else if sum < 0 {
                    p1 += 1
                } else {
                    p2 -= 1
                }
            }
            
        }
        
        return results
    }
}

class ThreeSumTests: XCTestCase {
    
    func test1() {
        
        var sut = Solution()
        
        XCTAssertEqual(sut.threeSum([-1,0,1,2,-1,-4]), [[-1,-1,2],[-1,0,1]])
        
        XCTAssertEqual(sut.threeSum([-2,0,0,2,2]), [[-2,0,2]])
        
        XCTAssertEqual(sut.threeSum([]), [])
        
        XCTAssertEqual(sut.threeSum([0]), [])
        
    }
    
}
