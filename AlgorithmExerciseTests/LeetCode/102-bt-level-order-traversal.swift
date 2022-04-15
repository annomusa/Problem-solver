//
//  102-bt-level-order-traversal.swift
//  AlgorithmExerciseTests
//
//  Created by Anno Musa on 29/03/22.
//

import XCTest
@testable import AlgorithmExercise

private class Solution {
    func levelOrder(_ root: TreeNode?) -> [[Int]] {
        guard let root = root else {
            return []
        }
        
        var res: [[Int]] = [[]]
        
        recurse(level: 0, root: root, res: &res)
        
        return res
    }
    
    private func recurse(level: Int, root: TreeNode?, res: inout [[Int]]) {
        guard let root = root else { return }
        
        if res[safe: level] == nil {
            if res.count == level {
                res.append([root.val])
            } else {
                
            }
        } else {
            res[level].append(root.val)
        }
        
        recurse(level: level + 1, root: root.left, res: &res)
        recurse(level: level + 1, root: root.right, res: &res)
    }
}

class _102_bt_level_order_traversal: XCTestCase {
    
    func test0() {
        let a = TreeNode(pos: 0, arr: [3,9,20,nil,nil,15,7])
        let sut = Solution()
        XCTAssertEqual(
            [[3],[9,20],[15,7]],
            sut.levelOrder(a)
        )
    }
    
}
