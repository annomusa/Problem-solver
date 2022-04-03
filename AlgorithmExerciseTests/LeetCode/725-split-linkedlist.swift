//
//  725-split-linkedlist.swift
//  AlgorithmExerciseTests
//
//  Created by Anno Musa on 28/03/22.
//

import XCTest
@testable import AlgorithmExercise

private class Solution {
    func splitListToParts(_ head: ListNode?, _ k: Int) -> [ListNode?] {
        
        var count = 0
        var curr = head
        while let node = curr {
            count += 1
            curr = node.next
        }
        
        var res: [ListNode?] = Array(repeating: nil, count: k)
        
        let remainder = count % k
        let countPerIndex = count / k
        
        curr = head
        
        for i in 0..<k where curr != nil {
            
            var arrHead: ListNode = ListNode()
            var write: ListNode? = arrHead
            
            let width = i < remainder ? countPerIndex + 1 : countPerIndex
            for j in 0..<width {
                // [1,2,3,4,5,6,7,8,9,10]
                // 1 - 1 2 - 1 2 3-
                // [ [1,2,3,4], [5,6,7], [8,9,10] ]
                
                write?.next = ListNode(curr!.val)
                write = write?.next
                
                if curr != nil {
                    curr = curr?.next
                }
            }
            
            res[i] = arrHead.next
            
        }
        
        return res
    }
}

class _25_split_linkedlist: XCTestCase {
    func xtest0() {
        let sut = Solution()
        let head = ListNode(arr: [1,2,3])
        
        XCTAssertEqual(
            [[1],[2],[3],[],[]],
            sut.splitListToParts(head, 5).map {
                $0?.toArray() ?? []
            }
        )
    }
    
    func test1() {
        let sut = Solution()
        let head = ListNode(arr: [1,2,3,4,5,6,7,8,9,10])
        
        XCTAssertEqual(
            [[1,2,3,4],[5,6,7],[8,9,10]],
            sut.splitListToParts(head, 3).map {
                $0?.toArray()
            }
        )
    }
}
