//
//  268-missing-number.swift
//  AlgorithmExerciseTests
//
//  Created by Anno Musa on 20/04/22.
//

import Foundation
import XCTest

private class Solution {
    func missingNumber(_ nums: [Int]) -> Int {
        
        let expectedSum = nums.count * (nums.count + 1) / 2
        
        var actualSum = 0
        
        for num in nums {
            actualSum += num
        }
        
        return expectedSum - actualSum
    }
}

class MissingNumberTests: XCTestCase {
    
    func test1() {
        
        let sut = Solution()
        
        XCTAssertEqual(sut.missingNumber([3,0,1]), 2)
        
        XCTAssertEqual(sut.missingNumber([0,1]), 2)
        
        XCTAssertEqual(sut.missingNumber([9,6,4,2,3,5,7,0,1]), 8)
        
    }
    
}
