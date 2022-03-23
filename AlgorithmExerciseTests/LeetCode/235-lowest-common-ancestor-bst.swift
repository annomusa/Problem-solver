//
//  TreeNode.swift
//  AlgorithmExercise
//
//  Created by Anno Musa on 23/03/22.
//

import Foundation
@testable import AlgorithmExercise

private class Solution {
    func lowestCommonAncestor(_ root: TreeNode?, _ p: TreeNode?, _ q: TreeNode?) -> TreeNode? {
        
        guard let parentVal = root?.val,
              let pVal = p?.val,
              let qVal = q?.val
        else { return root }
        
        if pVal > parentVal, qVal > parentVal {
            return lowestCommonAncestor(root?.right, p, q)
        } else if pVal < parentVal, qVal < parentVal {
            return lowestCommonAncestor(root?.left, p, q)
        }
        
        return root
    }
}

import XCTest

class LowestCommonAncestorBSTTest: XCTestCase {
    
    func testInit() {
        let a = TreeNode(pos: 0, arr: [0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15])
    }
    
    func test1() {
        let sut = Solution()
        
        let a = TreeNode(pos: 0, arr: [6,2,8,0,4,7,9,nil,nil,3,5])
        let p = TreeNode(2)
        let q = TreeNode(8)
        
        let res = sut.lowestCommonAncestor(a, p, q)
        
        XCTAssertEqual(res?.val, 6)
    }
    
    func test2() {
        let sut = Solution()
        
        let a = TreeNode(pos: 0, arr: [6,2,8,0,4,7,9,nil,nil,3,5])
        let p = TreeNode(2)
        let q = TreeNode(4)
        
        let res = sut.lowestCommonAncestor(a, p, q)
        
        XCTAssertEqual(res?.val, 2)
    }
}
