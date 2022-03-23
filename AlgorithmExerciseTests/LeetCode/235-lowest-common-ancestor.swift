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
        let parentVal = root?.val
        let pVal = p?.val
        let qVal = q?.val
        
        if let parentVal = parentVal, let pVal = pVal, let qVal = qVal,
            pVal > parentVal && qVal > parentVal {
            return lowestCommonAncestor(root?.right, p, q)
        } else if let parentVal = parentVal, let pVal = pVal, let qVal = qVal,
            pVal < parentVal, qVal < parentVal {
            return lowestCommonAncestor(root?.left, p, q)
        }
        return root
    }
}

import XCTest

class LowestCommonAncestorTest: XCTestCase {
    
    func test1() {
        let sut = Solution()
        
//        let root = [6,2,8,0,4,7,9,nil,nil,3,5]
        let root = TreeNode(6)
        root.left = TreeNode(2)
        root.right = TreeNode(8)
        root.left?.left = TreeNode(0)
        root.left?.right = TreeNode(4)
        root.right?.left = TreeNode(7)
        root.right?.right = TreeNode(9)
        root.left?.right?.left = TreeNode(3)
        root.left?.right?.right = TreeNode(5)
        
        let p = TreeNode(2)
        let q = TreeNode(8)
        let res = sut.lowestCommonAncestor(root, p, q)
        
        XCTAssertEqual(res?.val, 6)
    }
    
}
