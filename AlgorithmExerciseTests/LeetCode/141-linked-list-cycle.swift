//
//  141-linked-list-cycle.swift
//  AlgorithmExerciseTests
//
//  Created by Anno Musa on 19/04/22.
//

import Foundation
@testable import AlgorithmExercise
import XCTest

private class Solution {
    func hasCycle(_ head: ListNode?) -> Bool {
        guard head != nil else { return false }
        
        var slow = head
        var fast = head?.next
        
        while slow != nil, fast != nil {
            
            if slow === fast {
                return true
            }
            
            slow = slow?.next
            fast = fast?.next?.next
            
        }
        
        return true
    }
}

class LinkedListCycleTests: XCTestCase {
    
    func xtest1() {
        
        let sut = Solution()
        
        XCTAssertTrue(sut.hasCycle(ListNode(arr: [3,2,0,-4,2])))
        
        XCTAssertTrue(sut.hasCycle(ListNode(arr: [1,2,1])))
        
        XCTAssertFalse(sut.hasCycle(ListNode(arr: [1])))
    }
    
}
