//
//  MergeSortedListsTests.swift
//  LeetCodeTests
//
//  Created by Anno Musa on 22/05/21.
//

import Foundation
import XCTest
@testable import LeetCode

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
