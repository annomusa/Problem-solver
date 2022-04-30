//
//  215-kth-largest-element.swift
//  AlgorithmExerciseTests
//
//  Created by Anno Musa on 25/04/22.
//

import Foundation
import XCTest
@testable import AlgorithmExercise

private class Solution {
    
    func findKthLargest(_ nums: [Int], _ k: Int) -> Int {
        var heap = Heap<Int>([], comparator: { $0 < $1 })
        
        for num in nums {
            heap.insertValue(num)
            if heap.count() > k {
                heap.remove()
            }
        }
        
        return heap.remove()!
    }
    
}

class KthLargestElementTests: XCTestCase {
    
    func test1() {
        
        var sut = Solution()
        
        XCTAssertEqual(sut.findKthLargest([3,2,1,5,6,4], 2), 5)
        
        XCTAssertEqual(sut.findKthLargest([3,2,3,1,2,4,5,5,6], 4), 4)
        
    }
    
}
