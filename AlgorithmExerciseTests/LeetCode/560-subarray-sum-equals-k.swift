//
//  560-subarray-sum-equals-k.swift
//  AlgorithmExerciseTests
//
//  Created by Anno Musa on 26/04/22.
//

import Foundation
import XCTest

private class Solution {
    func subarraySum(_ nums: [Int], _ k: Int) -> Int {
        var result: Int = 0
        
        for p1 in 0..<nums.count {
            
            for p2 in p1+1...nums.count {
                
                var sum = 0
                for i in p1..<p2 {
                    sum += nums[i]
                }
                if sum == k {
                    result += 1
                }
            }
            
        }
        
        return result
    }
}

private class Solution2 {
    // cumulative sum
    func subarraySum(_ nums: [Int], _ k: Int) -> Int {
        var result: Int = 0
        
        var sums: [Int] = Array(repeating: 0, count: nums.count + 1)
        for num in nums.enumerated() {
            sums[num.offset + 1] = sums[num.offset] + num.element
        }
        
        for p1 in 0..<nums.count {
            
            for p2 in p1+1...nums.count {
                
                var sum = sums[p2] - sums[p1]
                if sum == k {
                    result += 1
                }
                
            }
            
        }
        
        return result
    }
    
    func subarraySum2(_ nums: [Int], _ k: Int) -> Int {
        var result: Int = 0
        
        for p1 in 0..<nums.count {
            var sum = 0
            for p2 in p1..<nums.count {
                sum += nums[p2]
                if sum == k {
                    result += 1
                }
                
            }
            
        }
        
        return result
    }
}

private class Solution3 {
    // hashmap
    func subarraySum(_ nums: [Int], _ k: Int) -> Int {
        var result = 0
        
        var sum = 0
        
        var dict: [Int: Int] = [0:1]
        
        for num in nums {
            
            sum += num
            if let currSum = dict[sum - k] {
                result += currSum
            }
            dict[sum] = dict[sum, default: 0] + 1
        }
        
        return result
    }
}

class SubArraySumEqualsK: XCTestCase {
    
    func test1() {
        
        var sut = Solution3()
        
//        XCTAssertEqual(sut.subarraySum([1,1,1], 2), 2)
//
//        XCTAssertEqual(sut.subarraySum([1,2,3], 3), 2)
        
        XCTAssertEqual(sut.subarraySum([1,-1,0], 0), 3)
        
    }
    
}
