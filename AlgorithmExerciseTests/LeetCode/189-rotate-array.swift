//
//  189-rotate-array.swift
//  AlgorithmExerciseTests
//
//  Created by Anno Musa on 25/03/22.
//

import XCTest

private class Solution {
    func rotate(_ nums: inout [Int], _ k: Int) {
        let k = k % nums.count
        reverse(&nums, 0, nums.count - 1)
        reverse(&nums, 0, k - 1)
        reverse(&nums, k, nums.count - 1)
    }
    
    private func reverse(_ nums: inout [Int], _ start: Int, _ end: Int) {
        var start = start
        var end = end
        while start < end {
            let temp = nums[start]
            nums[start] = nums[end]
            nums[end] = temp
            start += 1
            end -= 1
        }
    }
}

class _89_rotate_array: XCTestCase {
    func test0() {
        let sut = Solution()
        var arr = [1,2,3,4,5,6,7]
        sut.rotate(&arr, 3)
        XCTAssertEqual(arr, [5,6,7,1,2,3,4])
    }
    
    func test1() {
        let sut = Solution()
        var arr = [-1,-100,3,99]
        sut.rotate(&arr, 2)
        XCTAssertEqual(arr, [3,99,-1,-100])
    }
    
}
