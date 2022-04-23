//
//  572-subtree-of-another-tree.swift
//  AlgorithmExerciseTests
//
//  Created by Anno Musa on 19/04/22.
//

import Foundation
import XCTest
@testable import AlgorithmExercise

private class Solution {
    func isSubtree(_ root: TreeNode?, _ subRoot: TreeNode?) -> Bool {
        if subRoot == nil { return true }
        if root == nil { return false }
        
        if isIdentical(first: root, second: subRoot) {
            return true
        }
        return isSubtree(root?.left, subRoot) || isSubtree(root?.right, subRoot)
    }
    
    private func isIdentical(first: TreeNode?, second: TreeNode?) -> Bool {
        if first == nil, second == nil { return true }
        if first == nil || second == nil { return false }
        
        if first?.val == second?.val,
           isIdentical(first: first?.left, second: second?.left),
           isIdentical(first: first?.right, second: second?.right) {
            return true
        }
        return false
    }
}

class SubtreeOfAnotherTreeTests: XCTestCase {
    
    func test1() {
        
        var sut = Solution()
        
        let root = TreeNode(pos: 0, arr: [3,4,5,1,2])
        let sub = TreeNode(pos: 0, arr: [4,1,2])
        XCTAssertTrue(sut.isSubtree(root, sub))
        
        let root2 = TreeNode(pos: 0, arr: [3,4,5,1,2,nil,nil,nil,nil,0])
        let sub2 = TreeNode(pos: 0, arr: [4,1,2])
        XCTAssertFalse(sut.isSubtree(root2, sub2))
        
        
    }
    
}
