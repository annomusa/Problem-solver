//
//  287-find-duplicate-number.swift
//  AlgorithmExerciseTests
//
//  Created by Anno Musa on 25/04/22.
//

import Foundation
import XCTest

private class Solution {
    func findDuplicate(_ nums: [Int]) -> Int {
        var slow: Int = nums[0]
        var fast: Int = nums[0]
        
        repeat {
            slow = nums[slow]
            fast = nums[nums[fast]]
        } while slow != fast
        
        slow = nums[0]
        
        while fast != slow {
            slow = nums[slow]
            fast = nums[fast]
        }
        
        return slow
    }
}

class FindDuplicateNumber: XCTestCase {
    
    func test1() {
        
        var sut = Solution()
        
        XCTAssertEqual(sut.findDuplicate([1,3,4,2,2]), 2)
        
        XCTAssertEqual(sut.findDuplicate([3,1,3,4,2]), 3)
        
    }
    
}
