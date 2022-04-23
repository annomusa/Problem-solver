//
//  100-same-tree.swift
//  AlgorithmExerciseTests
//
//  Created by Anno Musa on 19/04/22.
//

import Foundation
@testable import AlgorithmExercise
import XCTest

private class Solution {
    func isSameTree(_ p: TreeNode?, _ q: TreeNode?) -> Bool {
        if p == nil, q == nil { return true }
        
        if p == nil || q == nil { return false }
        
        if p?.val == q?.val {
            let left = isSameTree(p?.left, q?.left)
            let right = isSameTree(p?.right, q?.right)
            return left && right
        }
        
        return false
    }
}

class SameTreeTests: XCTestCase {
    
    func test1() {
        
        let sut = Solution()
        
        XCTAssertTrue(
            sut.isSameTree(
                TreeNode(pos: 0, arr: [1,2,3]),
                TreeNode(pos: 0, arr: [1,2,3])
            )
        )
        
        XCTAssertFalse(
            sut.isSameTree(
                TreeNode(pos: 0, arr: [1,2,1]),
                TreeNode(pos: 0, arr: [1,1,2])
            )
        )
        
    }
    
}
