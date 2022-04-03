//
//  11-container-with-most-water.swift
//  AlgorithmExerciseTests
//
//  Created by Anno Musa on 03/04/22.
//

import Foundation
import XCTest

private class Solution {
    func maxArea(_ height: [Int]) -> Int {
        guard !height.isEmpty else { return 0 }
        guard height.count > 1 else { return height[0] }
        
        let MAX_INDEX = height.count - 1
        let MIN_INDEX = 0
        
        var p1 = 0
        var p2 = height.count - 1
        
        var maxWidth = 0
        
        while p1 < p2 && p1 <= MAX_INDEX && p2 >= MIN_INDEX {
            
            maxWidth = max(maxWidth, min(height[p1], height[p2]) * (p2 - p1))
            
            if height[p1] < height[p2] {
                p1 += 1
            } else {
                p2 -= 1
            }
        }
        
        return maxWidth
    }
}

class ContainerWithMostWater: XCTestCase {
    
    func test1() {
        let sut = Solution()
        
        let res = sut.maxArea([1])
        
        XCTAssertEqual(res, 1)
    }
    
    func test2() {
        let sut = Solution()
        
        let res = sut.maxArea([1,8,6,2,5,4,8,3,7])
        
        XCTAssertEqual(res, 49)
    }
    
}
