//
//  105-construct-bt-preorder-inorder.swift
//  AlgorithmExerciseTests
//
//  Created by Anno Musa on 29/03/22.
//

import XCTest
@testable import AlgorithmExercise

private class Solution {
    
    /*
     preorder   = M L R
     inorder    = L M R
     */
    func buildTree(_ preorder: [Int], _ inorder: [Int]) -> TreeNode? {
        guard let rootVal = preorder.first else { return nil }
        
        let root = TreeNode(rootVal)
        
        guard preorder.count != 1 else { return root }
        
        let inorderRootIndex = inorder.firstIndex(of: rootVal)!
        
        let inorderLeft = Array(inorder[0..<inorderRootIndex])
        let preorderLeft = Array(preorder[1..<inorderLeft.count + 1])
        
        let inorderRight = Array(inorder[(inorderRootIndex + 1)..<inorder.count])
        let preorderRight = Array(preorder[(inorderRootIndex + 1)..<inorder.count])
        
        root.left = buildTree(preorderLeft, inorderLeft)
        root.right = buildTree(preorderRight, inorderRight)
        
        return root
    }
}

class _05_construct_bt_preorder_inorder: XCTestCase {
    func test0() {
        let sut = Solution()
        
        let res = sut.buildTree([3,9,20,15,7], [9,3,15,20,7])
        
    }
    
    func test1() {
        let sut = Solution()
        
        let res = sut.buildTree([1,2,4,7,8,5,3,6,9,10], [7,4,8,2,5,1,3,9,6,10])
        
    }
}
