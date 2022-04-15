//
//  23-merge-k-sorted-lists.swift
//  AlgorithmExerciseTests
//
//  Created by Anno Musa on 12/04/22.
//

import Foundation
import XCTest
@testable import AlgorithmExercise

private class Solution {
    func mergeKLists(_ lists: [ListNode?]) -> ListNode? {
        
        var head: ListNode = ListNode()
        var curr: ListNode = head
        var lists = lists
        
        while true {
            guard !lists.compactMap { $0 }.isEmpty else { break }
            
            var min: (val: Int, idx: Int) = (val: .max, idx: 0)
            
            for list in lists.enumerated() {
                guard let node = list.element else { continue }
                if node.val < min.val {
                    min.val = node.val
                    min.idx = list.offset
                }
            }
            lists[min.idx] = lists[min.idx]?.next
            
            let new = ListNode(min.val)
            curr.next = new
            curr = new
        }
        
        return head.next
    }
}

private struct Node {
    let val: Int, idx: Int
}

extension Node: Comparable {
    static func < (lhs: Node, rhs: Node) -> Bool {
        return lhs.val < rhs.val
    }
}

private class Solution2 {
    func mergeKLists(_ lists: [ListNode?]) -> ListNode? {
        var lists: [ListNode?] = lists.filter { $0 != nil }
        guard !lists.isEmpty else { return nil }
        
        let head: ListNode = ListNode()
        var curr: ListNode = head
        
        let firstBatch: [Node] = lists.enumerated().map {
            Node(val: $0.element!.val, idx: $0.offset)
        }
        
        let heap = Heap(firstBatch, comparator: { $0 < $1 })
        
        while let smallest = heap.remove() {
            let new = ListNode(smallest.val)
            curr.next = new
            curr = new
            
            lists[smallest.idx] = lists[smallest.idx]?.next
            
            guard let nextItem = lists[smallest.idx] else { continue }
            heap.insertValue(
                Node(val: nextItem.val, idx: smallest.idx)
            )
            
        }
        
        return head.next
    }
}

class MergeKSortedListsTests: XCTestCase {
    
    func test1() {
        let sut = Solution2()
        
        var lists: [ListNode?] = [
            ListNode(arr: [1,4,5]),
            ListNode(arr: [1,3,4]),
            ListNode(arr: [2,6])
        ]
        let res = sut.mergeKLists(lists)
        
        let res2 = sut.mergeKLists([ListNode()])
        
    }
    
}
