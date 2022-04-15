//
//  230-kth-smallest-bst.swift
//  AlgorithmExerciseTests
//
//  Created by Anno Musa on 29/03/22.
//

import XCTest
@testable import AlgorithmExercise

private class Solution {
    func kthSmallest(_ root: TreeNode?, _ k: Int) -> Int {
//        var res = 0
        self.k = k
        
        inorder(root)
        
        return res
    }
    
    private var res: Int = 0
    private var k: Int = 0
    private var curr: Int = 0
    private func inorder(_ root: TreeNode?) {
        guard let root = root else { return }
        
        inorder(root.left)
        
        curr += 1
        if curr == k {
            res = root.val
            return
        }
        log(root.val)
        
        inorder(root.right)
    }
}

class _230_kth_smallest_bst: XCTestCase {
    
    func test0() {
        let a = TreeNode(pos: 0, arr: [3,1,4,nil,2])
        let sut = Solution()
        XCTAssertEqual(1, sut.kthSmallest(a, 1))
    }
    
    func test1() {
        let a = TreeNode(pos: 0, arr: [5,3,6,2,4,nil,nil,1])
        let sut = Solution()
        XCTAssertEqual(3, sut.kthSmallest(a, 3))
    }
}
