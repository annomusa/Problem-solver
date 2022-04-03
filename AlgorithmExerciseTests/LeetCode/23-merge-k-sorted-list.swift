//
//  23-merge-k-sorted-list.swift
//  AlgorithmExerciseTests
//
//  Created by Anno Musa on 03/04/22.
//

import Foundation
@testable import AlgorithmExercise
import XCTest

private class Solution {
    func mergeKLists(_ lists: [ListNode?]) -> ListNode? {
        
        return nil
    }
}

class _33_merge_k_sorted_list: XCTestCase {
    
    func test1() {
        let sut = Solution()
        
        let input = [
            ListNode(arr: [1,4,5]),
            ListNode(arr: [1,3,4]),
            ListNode(arr: [2,6])
        ]
        
        sut.mergeKLists(input)
    }
    
}
