//
//  104-max-depth-binary-tree.swift
//  AlgorithmExerciseTests
//
//  Created by Anno Musa on 19/04/22.
//

import Foundation
@testable import AlgorithmExercise
import XCTest

private class Solution {
    func maxDepth(_ root: TreeNode?) -> Int {
        if root == nil {
            return 0
        }
        
        var res = 1
        
        var left = maxDepth(root?.left)
        var right = maxDepth(root?.right)
        
        return res + max(left, right)
    }
}

class MaxDepthBinaryTreeTests: XCTestCase {
    
    func test1() {
        
        var sut = Solution()
        
        var root1 = TreeNode(pos: 0, arr: [3,9,20,nil,nil,15,7])
        XCTAssertEqual(
            sut.maxDepth(root1),
            3
        )
        
        
        var root2 = TreeNode(pos: 0, arr: [1,nil,2])
        XCTAssertEqual(
            sut.maxDepth(root2),
            2
        )
    }
    
}
