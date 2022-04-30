//
//  2-add-two-numbers.swift
//  AlgorithmExerciseTests
//
//  Created by Anno Musa on 25/04/22.
//

import Foundation
import XCTest
@testable import AlgorithmExercise

private class Solution {
    func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        var head: ListNode? = ListNode()
        
        var c1: ListNode? = l1
        var c2: ListNode? = l2
        var curr = head
        
        var saving = 0
        while let curr1 = c1, let curr2 = c2 {
            
            let new = ListNode()
            curr?.next = new
            curr = new
            
            let add = curr1.val + curr2.val + saving
            curr?.val = add % 10
            saving = add / 10
            
            c1 = curr1.next
            c2 = curr2.next
        }
        
        var remaining = c1 ?? c2
        while let rem = remaining {
            let new = ListNode()
            curr?.next = new
            curr = new
            
            let add = rem.val + saving
            curr?.val = add % 10
            saving = add / 10
            
            remaining = rem.next
        }
        
        if saving > 0 {
            let new = ListNode(saving)
            curr?.next = new
            curr = new
        }
        
        return head?.next
    }
}

class AddTwoNumbersTests: XCTestCase {
    
    func test1() {
        
        var sut = Solution()
        
        let l1 = ListNode(arr: [2,4,3])
        let l2 = ListNode(arr: [5,6,4])
        XCTAssertEqual(sut.addTwoNumbers(l1, l2)?.toArray(), [7,0,8])
        
        let l21 = ListNode(arr: [9,9,9,9,9,9,9])
        let l22 = ListNode(arr: [9,9,9,9])
        XCTAssertEqual(sut.addTwoNumbers(l21, l22)?.toArray(), [8,9,9,9,0,0,0,1])
    }
    
}
