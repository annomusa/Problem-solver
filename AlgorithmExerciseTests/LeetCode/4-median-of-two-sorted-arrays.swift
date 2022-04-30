//
//  4-median-of-two-sorted-arrays.swift
//  AlgorithmExerciseTests
//
//  Created by Anno Musa on 27/04/22.
//

import Foundation
import XCTest
@testable import AlgorithmExercise

private class Solution {
    func findMedianSortedArrays(_ nums1: [Int], _ nums2: [Int]) -> Double {
        var res: Double = 0
        
        var lowerHeap: Heap<Int> = Heap([], comparator: { $0 > $1 })
        var higherHeap: Heap<Int> = Heap([], comparator: { $0 < $1 })
        
        var p1 = 0
        var p2 = 0
        var max1 = nums1.count - 1
        var max2 = nums2.count - 1
        
        for num in nums1 {
            if lowerHeap.count() == 0 || num < lowerHeap.peek()! {
                lowerHeap.insertValue(num)
            } else {
                higherHeap.insertValue(num)
            }
            
            if lowerHeap.count() - higherHeap.count() == 2 {
                higherHeap.insertValue(lowerHeap.remove()!)
            } else if higherHeap.count() - lowerHeap.count() == 2 {
                lowerHeap.insertValue(higherHeap.remove()!)
            }
        }
        
        print("medzz lower \(lowerHeap.heap)")
        print("medzz higher \(higherHeap.heap)")
        
        for num in nums2 {
            if lowerHeap.count() == 0 || num < lowerHeap.peek()! {
                lowerHeap.insertValue(num)
            } else {
                higherHeap.insertValue(num)
            }
            
            if lowerHeap.count() - higherHeap.count() == 2 {
                higherHeap.insertValue(lowerHeap.remove()!)
            } else if higherHeap.count() - lowerHeap.count() == 2 {
                lowerHeap.insertValue(higherHeap.remove()!)
            }
        }
        
        print("medzz lower \(lowerHeap.heap)")
        print("medzz higher \(higherHeap.heap)")
        
        if lowerHeap.count() == higherHeap.count() {
            return Double(lowerHeap.peek()! + higherHeap.peek()!) / 2
        } else if lowerHeap.count() > higherHeap.count() {
            return Double(lowerHeap.peek()!)
        } else {
            return Double(higherHeap.peek()!)
        }
        
        return res
    }
}

class MedianOfTwoSortedArraysTests: XCTestCase {
    
    func test1() {
        
        var sut = Solution()
        
//        XCTAssertEqual(sut.findMedianSortedArrays([1,3], [2]), 2)
//
//        XCTAssertEqual(sut.findMedianSortedArrays([1,2], [3,4]), 2.5)
        
        XCTAssertEqual(sut.findMedianSortedArrays([3], [-2,-1]), -1)
    }
    
}
