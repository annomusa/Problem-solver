//
//  MaxNumberPageRead.swift
//  AlgorithmExerciseTests
//
//  Created by Anno Musa on 16/04/22.
//

import Foundation
import XCTest
@testable import AlgorithmExercise

private func maxNumberPageRead(node: ListNode) -> Int {
    var slow: ListNode? = node
    var fast: ListNode? = node
    
    while true {
        if let fa = fast?.next?.next {
            slow = slow?.next
            fast = fa
        } else {
            fast = fast?.next
            break
        }
        
    }
    
    var secHalfNode = slow?.next
    slow?.next = nil
    
    let newSecHalfNode = reverseList(head: secHalfNode)
    
    var firstList: ListNode? = node
    var secondList: ListNode? = newSecHalfNode
    var ans = 0
    while let f = firstList, let s = secondList {
        ans = max(ans, f.val + s.val)
        firstList = f.next
        secondList = s.next
    }
    return ans
}

private func reverseList(head: ListNode?) -> ListNode? {
    var prevNode: ListNode? = nil
    var headNode = head
    
    while headNode != nil {
        let nextHead = headNode?.next
        headNode?.next = prevNode
        prevNode = headNode
        headNode = nextHead
    }
    
    return prevNode
}

class MaxNumberPageReadTests: XCTestCase {
    
    func test1() {
        var list = ListNode(
            5,
            ListNode(
                4,
                ListNode(
                    7,
                    ListNode(
                        8,
                        ListNode(
                            9,
                            ListNode(
                                3,
                                ListNode(
                                    2,
                                    ListNode(
                                        8
                                    )
                                )
                            )
                        )
                    )
                )
            )
        )
        
        XCTAssertEqual(
            maxNumberPageRead(node: list),
            17
        )
    }
    
}
