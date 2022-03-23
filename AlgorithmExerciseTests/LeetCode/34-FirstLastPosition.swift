//
//  FirstLastPositionTests.swift
//  LeetCodeTests
//
//  Created by Anno Musa on 03/05/21.
//

import XCTest
@testable import AlgorithmExercise

class FirstLastPosition {
    func searchRange(_ nums: [Int], _ target: Int) -> [Int] {
        log(nums, target)
        
        guard !nums.isEmpty else { return [-1, -1] }
        
        var startIndex: Int = -1
        var endIndex: Int = -1
        
        for (index, val) in nums.enumerated() {
            if val == target, startIndex == -1 {
                startIndex = index
                endIndex = index
            } else if val == target, startIndex != -1 {
                endIndex = index
            }
        }
        
        return [startIndex, endIndex]
    }
    
    private func searchRange(nums: [Int], target: Int, direction: Direction) -> Int {
        var start = 0
        var end = nums.count - 1
        var result = -1
        
        while start <= end {
            let mid = (start + end) / 2
            if nums[mid] == target {
                result = mid
                if direction == .lo {
                    end = mid - 1
                } else {
                    start = mid + 1
                }
            } else if nums[mid] < target {
                start = mid + 1
            } else if nums[mid] > target {
                end = mid - 1
            }
        }
        
        return result
    }
    
    private enum Direction {
        case lo, hi
    }
}

class FirstLastPositionTests: XCTestCase {
    
    var sut: FirstLastPosition!
    
    override func setUp() {
        sut = FirstLastPosition()
    }
    
    func test_firstLastPosition() {
        
        let res = sut.searchRange([5,7,7,8,8,10], 8)
        
        XCTAssertEqual(res, [3,4])
    }
    
    func test_oneItem() {
        let res = sut.searchRange([1], 1)
        
        XCTAssertEqual(res, [0, 0])
    }
    
}
