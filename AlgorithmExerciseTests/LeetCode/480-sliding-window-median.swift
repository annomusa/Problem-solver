//
//  480-sliding-window-median.swift
//  AlgorithmExerciseTests
//
//  Created by Anno Musa on 12/04/22.
//

import Foundation
import XCTest
@testable import AlgorithmExercise

private class Solution {
    /*
     n = 8
     k = 3
     r = 6 = n - k + 1
     prev = i - 1
     next = i + k - 1
     0,1, 2, 3,4,5,6,7
     
     1,3,-1,-3,5,3,6,7
     
     l -1 -3
     h 3
     
     3,1,2,2,1,3,1
     */
    func medianSlidingWindow(_ nums: [Int], _ k: Int) -> [Double] {
        var res: [Double] = []
        var word = "word".map { Character("\($0)") }
        let n = nums.count
        let maxIndex = n - k // n - k
        
        let lowerHeap: Heap<Int> = Heap([], comparator: { $0 > $1 })
        let higherHeap: Heap<Int> = Heap([], comparator: { $0 < $1 })
        
        guard k != 1 else { return nums.map { Double($0) } }
        
        // first window
        for i in 0..<k {
            let val = nums[i]
            inserVal(val: val, lowerHeap: lowerHeap, higherHeap: higherHeap)
        }
        
        res.append(findMedian(lowerHeap: lowerHeap, higherHeap: higherHeap))
        
        guard maxIndex > 0 else { return res }
        
        for i in 1...maxIndex {
            let prev = nums[i-1]
            let next = nums[i+k-1]
            removeVal(val: prev, lowerHeap: lowerHeap, higherHeap: higherHeap)
            inserVal(val: next, lowerHeap: lowerHeap, higherHeap: higherHeap)
            res.append(findMedian(lowerHeap: lowerHeap, higherHeap: higherHeap))
        }
        
        return res
    }
    
    private func removeVal(val: Int, lowerHeap: Heap<Int>, higherHeap: Heap<Int>) {
        if let peek = lowerHeap.peek(), peek >= val {
            lowerHeap.remove(value: val)
        } else {
            higherHeap.remove(value: val)
        }
    }
    
    private func inserVal(val: Int, lowerHeap: Heap<Int>, higherHeap: Heap<Int>) {
        if lowerHeap.isEmpty() && higherHeap.isEmpty() {
            lowerHeap.insertValue(val)
        } else if let peek = lowerHeap.peek(), peek >= val {
            lowerHeap.insertValue(val)
        } else {
            higherHeap.insertValue(val)
        }
        if abs(lowerHeap.count() - higherHeap.count()) > 1 {
            if lowerHeap.count() > higherHeap.count() {
                higherHeap.insertValue(lowerHeap.remove()!)
            } else {
                lowerHeap.insertValue(higherHeap.remove()!)
            }
        }
    }
    
    private func findMedian(lowerHeap: Heap<Int>, higherHeap: Heap<Int>) -> Double {
        if lowerHeap.isEmpty() && higherHeap.isEmpty() {
            return 0
        } else if lowerHeap.count() > higherHeap.count() {
            return Double(lowerHeap.peek()!)
        } else if lowerHeap.count() < higherHeap.count() {
            return Double(higherHeap.peek()!)
        } else {
            return (Double(higherHeap.peek()!) + Double(lowerHeap.peek()!)) / 2
        }
    }
}

class SlidingWindoMedianTests: XCTestCase {
    
    func test1() {
        
        var sut = Solution()
        
        XCTAssertEqual(
            sut.medianSlidingWindow([1,3,-1,-3,5,3,6,7], 3),
            [1.00000,-1.00000,-1.00000,3.00000,5.00000,6.00000]
        )
        
        XCTAssertEqual(
            sut.medianSlidingWindow([1,2,3,4,2,3,1,4,2], 3),
            [2.00000,3.00000,3.00000,3.00000,2.00000,3.00000,2.00000]
        )
        
        XCTAssertEqual(
            sut.medianSlidingWindow([1,4,2,3], 4),
            [2.5]
        )
        
        XCTAssertEqual(
            sut.medianSlidingWindow([1,2], 1),
            [1.0,2.0]
        )
        
        XCTAssertEqual(
            sut.medianSlidingWindow([10,0,5], 2),
            [5.0,2.5]
        )
    }
    
}
