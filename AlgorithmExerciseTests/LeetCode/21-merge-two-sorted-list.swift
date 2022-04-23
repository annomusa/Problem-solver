//
//  21-merge-two-sorted-list.swift
//  AlgorithmExerciseTests
//
//  Created by Anno Musa on 20/04/22.
//

import Foundation
@testable import AlgorithmExercise
import XCTest

private class Solution {
    func mergeTwoLists2(_ list1: ListNode?, _ list2: ListNode?) -> ListNode? {
        guard let list1 = list1 else {
            return list2
        }
        
        guard let list2 = list2 else {
            return list1
        }
        
        var res: ListNode?
        
        if list1.val <= list2.val {
            res = list1
            res?.next = mergeTwoLists(list1.next, list2)
        } else {
            res = list2
            res?.next = mergeTwoLists(list1, list2.next)
        }
        
        return res
    }
    
    func mergeTwoLists(_ list1: ListNode?, _ list2: ListNode?) -> ListNode? {
        
        var p1 = list1
        var p2 = list2
        
        var head: ListNode?
        if let l1 = list1, let l2 = list2, l1.val <= l2.val {
            head = l1
            p1 = l1.next
        } else if let l1 = list1, let l2 = list2 {
            head = list2
            p2 = list2?.next
        } else if let l1 = list1 {
            head = l1
            p1 = l1.next
        } else {
            head = list2
            p2 = list2?.next
        }
        
        var curr = head
        
        while let currP1 = p1, let currP2 = p2 {
            
            if currP1.val <= currP2.val {
                curr?.next = currP1
                curr = currP1
                p1 = currP1.next
            } else {
                curr?.next = currP2
                curr = currP2
                p2 = currP2.next
            }
            
        }
        
        if let p1 = p1 {
            curr?.next = p1
        } else if let p2 = p2 {
            curr?.next = p2
        }
        
        return head
    }
}

class MergeTwoSortedListTests: XCTestCase {
    
    func test1() {
        
        let sut = Solution()
        
        let l1 = ListNode(arr: [1,2,4])
        let l2 = ListNode(arr: [1,3,4])
        
        XCTAssertEqual(sut.mergeTwoLists2(l1, l2)?.toArray(), [1,1,2,3,4,4])
        
        XCTAssertEqual(sut.mergeTwoLists2(nil, ListNode(arr: [1]))?.toArray(), [1])
    }
    
}
