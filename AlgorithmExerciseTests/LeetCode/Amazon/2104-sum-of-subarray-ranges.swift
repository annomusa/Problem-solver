//
//  2104-sum-of-subarray-ranges.swift
//  AlgorithmExerciseTests
//
//  Created by Anno Musa on 16/04/22.
//

import Foundation
import XCTest
@testable import AlgorithmExercise

private class Solution {
    func subArrayRanges(_ nums: [Int]) -> Int {
        var res = 0
        
        for i in 0..<nums.count {
            
            var min: Heap<Int> = Heap([], comparator: { $0 < $1 })
            var max: Heap<Int> = Heap([], comparator: { $0 > $1 })
            
            for j in i..<nums.count {
                min.insertValue(nums[j])
                max.insertValue(nums[j])
                res += (max.peek()! - min.peek()!)
            }
            
        }
        
        return res
    }
    
    func subArrayRanges2(_ nums: [Int]) -> Int {
        return sumSubarraysMax(nums: nums) - sumSubarraysMin(nums: nums)
    }
    
    private func sumSubarraysMax(nums: [Int]) -> Int {
        let n = nums.count
        
        var sum = 0
        
        var dp: [Int] = Array(repeating: 0, count: n)
        var stack: [Int] = []
        
        for i in 0..<n {
            
            if stack.isEmpty || nums[stack.last!] <= nums[i] {
                while !stack.isEmpty, nums[stack.last!] <= nums[i] {
                    stack.popLast()
                }
                dp[i] = stack.isEmpty ? (i+1) * nums[i] : dp[stack.last!] + (i-stack.last!) * nums[i]
            } else {
                dp[i] = dp[stack.last!] + (i-stack.last!) * nums[i]
            }
            sum += dp[i]
            stack.append(i)
        }
        return sum
    }
    
    private func sumSubarraysMin(nums: [Int]) -> Int {
        let n = nums.count
        
        var sum = 0
        
        var dp: [Int] = Array(repeating: 0, count: n)
        var stack: [Int] = []
        
        for i in 0..<n {
            
            if stack.isEmpty || nums[stack.last!] >= nums[i] {
                while !stack.isEmpty, nums[stack.last!] >= nums[i] {
                    stack.popLast()
                }
                dp[i] = stack.isEmpty ? (i+1) * nums[i] : dp[stack.last!] + (i-stack.last!) * nums[i]
            } else {
                dp[i] = dp[stack.last!] + (i-stack.last!) * nums[i]
            }
            sum += dp[i]
            stack.append(i)
        }
        return sum
    }
}

class SumOfSubarrayRanges1Tests: XCTestCase {
    
    func test1() {
        
        var sut = Solution()
        
        XCTAssertEqual(sut.subArrayRanges2([1,2,3]), 4)
        
        XCTAssertEqual(sut.subArrayRanges2([1,3,3]), 4)
        
        XCTAssertEqual(sut.subArrayRanges2([4,-2,-3,4,1]), 59)
        
    }
    
}
