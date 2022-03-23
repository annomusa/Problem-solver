//
//  ReverseListsTests.swift
//  LeetCodeTests
//
//  Created by Anno Musa on 22/05/21.
//

import Foundation
import XCTest
@testable import AlgorithmExercise

class ReverseLists {
    func reverseList(_ head: ListNode?) -> ListNode? {
        var prev: ListNode?
        var curr: ListNode? = head
        
        while curr != nil {
            var temp = curr?.next
            curr?.next = prev
            prev = curr
            curr = temp
        }
        
        return prev
    }
}


class ReverseListsTests: XCTestCase {
    
    var sut: ReverseLists!
    
    override func setUp() {
        sut = ReverseLists()
    }
    
    func testExample1() {
        let head = ListNode(1, ListNode(2, ListNode(3, ListNode(4))))
        let res = sut.reverseList(head)
        
        res?.print()
    }
}
