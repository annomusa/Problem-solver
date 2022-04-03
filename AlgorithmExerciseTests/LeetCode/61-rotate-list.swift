//
//  61-rotate-list.swift
//  AlgorithmExerciseTests
//
//  Created by Anno Musa on 25/03/22.
//

import XCTest
@testable import AlgorithmExercise
/**
 * Definition for singly-linked list.
 * public class ListNode {
 *     public var val: Int
 *     public var next: ListNode?
 *     public init() { self.val = 0; self.next = nil; }
 *     public init(_ val: Int) { self.val = val; self.next = nil; }
 *     public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
 * }
 * 1,2,3,4,5
 * 5,1,2,3,4
 * 4,5,1,2,3
 *
 * n = 16
 * 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16
 * k5
 * 12,13,14,15,16,1,2,3,4,5,6,7,8,9,10,11
 * k3
 * 14,15,16,1,2,3,4,5,6,7,8,9,10,11,12,14
 * k1
 * 16,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15
 */
private class Solution {
    
    func rotateRight(_ head: ListNode?, _ k: Int) -> ListNode? {
        guard head != nil else { return nil }
        
        guard head?.next != nil else { return head }
        
        var count = 0
        
        var currentNode = head
        var tail: ListNode?
        while let curr = currentNode {
            count += 1
            tail = currentNode
            currentNode = curr.next
        }
        
        tail?.next = head
        
        var newTailIndex = count - k % count - 1
        
        var newTail = head
        
        for i in stride(from: 0, to: newTailIndex, by: +1) {
            newTail = newTail?.next
        }
        
        var newHead = newTail?.next
        newTail?.next = nil
        
        return newHead
    }
}

class _1_rotate_list: XCTestCase {
    
    func test0() {
        let sut = Solution()
        let ln = ListNode(arr: [])
        ln?.print()
        
        XCTAssertEqual(
            nil,
            sut.rotateRight(ln, 2)?.toArray()
        )
    }
    
    func test1() {
        let sut = Solution()
        let ln = ListNode(arr: [1,2,3,4,5])
        ln?.print()
        
        XCTAssertEqual(
            [4,5,1,2,3],
            sut.rotateRight(ln, 2)?.toArray()
        )
    }
    
    func test2() {
        let sut = Solution()
        let ln = ListNode(arr: [1])
        ln?.print()
        
        XCTAssertEqual(
            [1],
            sut.rotateRight(ln, 0)?.toArray()
        )
    }
}
