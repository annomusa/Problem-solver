//
//  98-validate-bst.swift
//  AlgorithmExerciseTests
//
//  Created by Anno Musa on 29/03/22.
//

import XCTest
@testable import AlgorithmExercise

private class Solution {
    func isValidBST(_ root: TreeNode?) -> Bool {
        return inorder(root)
    }
    
    private var prev: TreeNode?
    private func inorder(_ root: TreeNode?) -> Bool {
        guard let root = root else { return true }
        
        if !inorder(root.left) {
            return false
        }
        
        if let prev = prev, root.val <= prev.val {
            return false
        }
        prev = root
        return inorder(root.right)
    }
}

class _98_validate_bst: XCTestCase {
    func test0() {
        let a = TreeNode(pos: 0, arr: [2,1,3])
        let sut = Solution()
        
        XCTAssertEqual(true, sut.isValidBST(a))
    }
    
    func test1() {
        let a = TreeNode(pos: 0, arr: [2,2,2])
        let sut = Solution()
        
        XCTAssertEqual(false, sut.isValidBST(a))
    }
    
    func test2() {
        let a = TreeNode(pos: 0, arr: [2,2])
        let sut = Solution()
        
        XCTAssertEqual(false, sut.isValidBST(a))
    }
    
    func test3() {
        let a = TreeNode(pos: 0, arr: [5,4,6,nil,nil,3,7])
        let sut = Solution()
        
        XCTAssertEqual(false, sut.isValidBST(a))
    }
}
