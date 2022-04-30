//
//  142-linked-list-cycle-ii.swift
//  AlgorithmExerciseTests
//
//  Created by Anno Musa on 25/04/22.
//

import Foundation
import XCTest
@testable import AlgorithmExercise

private class Solution {
    func detectCycle(_ head: ListNode?) -> ListNode? {
        
        var entrance = entranceFor(head)
        
        if entrance == nil {
            return nil
        }
        
        var idx = 0
        
        var p1 = head
        var p2 = entrance?.next
        
        while p1 !== p2 {
            p1 = p1?.next
            p2 = p2?.next
        }
        
        return p1
    }
    
    private func entranceFor(_ head: ListNode?) -> ListNode? {
        var slow = head
        var fast = head?.next
        
        while let s = slow, let f = fast {
            if s === f {
                return s
            }
            slow = slow?.next
            fast = fast?.next?.next
        }
        
        return nil
    }
}

class LinkedListCycle2: XCTestCase {
    
    func test1() {
        
        var sut = Solution()
        
        let n11 = ListNode(3)
        let n21 = ListNode(2)
        let n31 = ListNode(0)
        let n41 = ListNode(-4)
        n11.next = n21
        n21.next = n31
        n31.next = n41
        n41.next = n21
        
        XCTAssertEqual(sut.detectCycle(n11)?.val, 2)
        
        let n12 = ListNode(1)
        let n22 = ListNode(2)
        n12.next = n22
        n22.next = n12
        
        XCTAssertEqual(sut.detectCycle(n12)?.val, 1)
        
        let n13 = ListNode(0)
        
        XCTAssertEqual(sut.detectCycle(n13)?.val, nil)
    }
    
}
