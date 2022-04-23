//
//  206-reverse-linked-list.swift
//  AlgorithmExerciseTests
//
//  Created by Anno Musa on 19/04/22.
//

import Foundation
@testable import AlgorithmExercise
import XCTest

private class Solution {
    func reverseList(_ head: ListNode?) -> ListNode? {
        var prevNode: ListNode?
        var headNode = head
        
        while headNode != nil {
            let next = headNode?.next
            headNode?.next = prevNode
            prevNode = headNode
            headNode = next
        }
        
        return prevNode
    }
}

class ReverseLinkedListTests: XCTestCase {
    
    func test1() {
        
        let sut = Solution()
        
        XCTAssertEqual(
            sut.reverseList(ListNode(arr: [1,2,3,4,5]))?.toArray(),
            [5,4,3,2,1]
        )
        
    }
    
}
