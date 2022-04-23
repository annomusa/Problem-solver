//
//  1438-longest-conti-subarray-with-abs-diff-less-equal.swift
//  AlgorithmExerciseTests
//
//  Created by Anno Musa on 16/04/22.
//

import Foundation
import XCTest

private class Solution {
    func longestSubarray(_ nums: [Int], _ limit: Int) -> Int {
        guard nums.count > 0 else { return 0 }
        
        let n = nums.count
        
        var p1 = 0
        var p2 = 0
        var longestCount = 1
        
        var minDeque: [Int] = []
        var maxDeque: [Int] = []
        
        while p2 < n {
            
            while let lastMinDeq = minDeque.last, nums[lastMinDeq] >= nums[p2] {
                minDeque.removeLast()
            }
            while let lastMaxDeq = maxDeque.last, nums[lastMaxDeq] <= nums[p2] {
                maxDeque.removeLast()
            }
            minDeque.append(p2)
            maxDeque.append(p2)
            
            while nums[maxDeque.first!] - nums[minDeque.first!] > limit {
                p1 += 1
                if p1 > minDeque.first! {
                    minDeque.removeFirst()
                }
                if p1 > maxDeque.first! {
                    maxDeque.removeFirst()
                }
            }
            longestCount = max(longestCount, p2 - p1 + 1)
            p2 += 1
        }
        
        return longestCount
    }
}

class LongestContiSubArrayWithAbsDiffTests: XCTestCase {
    
    func test1() {
        
        var sut = Solution()
        
        XCTAssertEqual(
            sut.longestSubarray([8,2,4,7], 4),
            2
        )
        
        XCTAssertEqual(
            sut.longestSubarray([10,1,2,4,7,2], 5),
            4
        )
        
        XCTAssertEqual(
            sut.longestSubarray([4,2,2,2,4,4,2,2], 0),
            3
        )
    }
    
}
