//
//  226-invert-binary-tree.swift
//  AlgorithmExerciseTests
//
//  Created by Anno Musa on 19/04/22.
//

import Foundation
@testable import AlgorithmExercise
import XCTest

private class Solution {
    func invertTree(_ root: TreeNode?) -> TreeNode? {
        guard let root = root else {
            return nil
        }
        
        let left = invertTree(root.right)
        let right = invertTree(root.left)
        
        root.left = left
        root.right = right
        
        return root
    }
}

class InvertBinaryTreeTests: XCTestCase {
    
    func test1() {
        
        let sut = Solution()
        
        var root1 = TreeNode(pos: 0, arr: [4,2,7,1,3,6,9])
        sut.invertTree(root1)
        
    }
    
}
