//
//  MergeSortedListsTests.swift
//  LeetCodeTests
//
//  Created by Anno Musa on 22/05/21.
//

import Foundation
import XCTest
@testable import AlgorithmExercise

class MergeSortedLists {
    func mergeTwoLists(
        _ l1: ListNode?,
        _ l2: ListNode?
    ) -> ListNode? {
        var result: ListNode? = nil
        
        guard let l1 = l1 else { return l2 }
        guard let l2 = l2 else { return l1 }
        
        if l1.val < l2.val {
            result = l1
            result?.next = mergeTwoLists(l1.next, l2)
        } else {
            result = l2
            result?.next = mergeTwoLists(l1, l2.next)
        }
        
        return result
    }
}


class MergeSortedListsTests: XCTestCase {
    
    var sut: MergeSortedLists!
    
    override func setUp() {
        sut = MergeSortedLists()
    }
    
    func testExample1() {
        let l1 = ListNode(1, ListNode(2, ListNode(4)))
        let l2 = ListNode(1, ListNode(3, ListNode(4)))
        
        let res = sut.mergeTwoLists(l1, l2)
//        l1.print()
//        l2.print()
        res?.print()
    }
}
