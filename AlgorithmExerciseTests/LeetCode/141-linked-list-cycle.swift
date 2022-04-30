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
        var slow = head
        var fast = head?.next
        
        while slow != nil, fast != nil {
            guard slow !== fast else { return true }
            
            slow = slow?.next
            fast = fast?.next?.next
        }
        
        return false
    }
}

class LinkedListCycleTests: XCTestCase {
    
    func test1() {
        
        let sut = Solution()
        
        let entry = ListNode(2)
        let postEntry1 = ListNode(0)
        let postEntry2 = ListNode(4)
        entry.next = postEntry1
        postEntry1.next = postEntry2
        postEntry2.next = entry
        let list1 = ListNode(3, entry)
        XCTAssertTrue(sut.hasCycle(list1))
        
        let list2 = ListNode(1)
        let entry2 = ListNode(2, list2)
        list2.next = entry2
        XCTAssertTrue(sut.hasCycle(list2))
        
        XCTAssertFalse(sut.hasCycle(ListNode(1)))
    }
    
}
