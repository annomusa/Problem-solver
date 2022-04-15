//
//  1650-lca-bt-3.swift
//  AlgorithmExerciseTests
//
//  Created by Anno Musa on 25/03/22.
//

import XCTest
@testable import AlgorithmExercise

private class Solution {
    func lowestCommonAncestor(_ p: Node?,_ q: Node?) -> Node? {
        var dict: [Int: Node] = [:]
        var pNext: Node? = p
        var qNext: Node? = q
        
        while pNext != nil || qNext != nil {
            if let next = pNext {
                if let res = dict[next.val] {
                    return res
                } else {
                    dict[next.val] = next
                    pNext = pNext?.parent
                }
            }
            if let next = qNext {
                if let res = dict[next.val] {
                    return res
                } else {
                    dict[next.val] = next
                    qNext = qNext?.parent
                }
            }
        }
        
        return nil
    }
    
    func xlowestCommonAncestor(_ p: Node?,_ q: Node?) -> Node? {
        
        guard let p = p, let q = q else {
            return nil
        }
        
        var pPath: [Node] = []
        var pParent: Node? = p
        while let parent = pParent {
            pPath.append(parent)
            pParent = parent.parent
        }
        
        var qPath: [Node] = []
        var qParent: Node? = q
        while let parent = qParent {
            qPath.append(parent)
            qParent = parent.parent
        }
        qPath.reverse()
        pPath.reverse()
        
        let shortestPath = (qPath.count < pPath.count) ? qPath.count : qPath.count
        let index = shortestPath - 1
        
        for index in (0...shortestPath - 1).reversed() {
            if let qNode = qPath[safe: index],
               let pNode = pPath[safe: index],
               pNode.val == qNode.val {
                return qNode
            }
        }
        
        return nil
    }
}

class _1650_lca_bt_3: XCTestCase {
    
    func test0() {
        let sut = Solution()
        let a = Node(pos: 0, arr: [3,5,1,6,2,0,8,nil,nil,7,4])
        let p = findNode(root: a, val: 5)
        let q = findNode(root: a, val: 1)
        
        XCTAssertEqual(sut.lowestCommonAncestor(p, q)?.val, 3)
    }
    
    func test1() {
        let sut = Solution()
        let a = Node(pos: 0, arr: [3,5,1,6,2,0,8,nil,nil,7,4])
        let p = findNode(root: a, val: 5)
        let q = findNode(root: a, val: 4)
        
        XCTAssertEqual(sut.lowestCommonAncestor(p, q)?.val, 5)
    }
    
    func test2() {
        let sut = Solution()
        let a = Node(pos: 0, arr: [1,2])
        let p = findNode(root: a, val: 1)
        let q = findNode(root: a, val: 2)
        
        XCTAssertEqual(sut.lowestCommonAncestor(p, q)?.val, 1)
    }
}
