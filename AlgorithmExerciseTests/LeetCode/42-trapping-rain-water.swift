//
//  42-trapping-rain-water.swift
//  AlgorithmExerciseTests
//
//  Created by Anno Musa on 26/04/22.
//

import Foundation
import XCTest

private class Solution {
    func trap(_ height: [Int]) -> Int {
        var res: Int = 0
        
        var p1 = 0
        var p2 = height.count - 1
        
        var leftMax = 0
        var rightMax = 0
        
        while p1 < p2 {
            
            if height[p1] < height[p2] {
                
                if height[p1] >= leftMax {
                    leftMax = height[p1]
                } else {
                    res += leftMax - height[p1]
                }
                
                p1 += 1
                
            } else {
                
                if height[p2] >= rightMax {
                    rightMax = height[p2]
                } else {
                    res += rightMax - height[p2]
                }
                
                p2 -= 1
                
            }
            
        }
        
        return res
    }
}

class TrappingRainWaterTests: XCTestCase {
    
    func test1() {
        
        var sut = Solution()
        
        XCTAssertEqual(sut.trap([0,1,0,2,1,0,1,3,2,1,2,1]), 6)

        XCTAssertEqual(sut.trap([4,2,0,3,2,5]), 9)
        
        XCTAssertEqual(sut.trap([0,0,1,0,0,0]), 0)
        
    }
    
}
