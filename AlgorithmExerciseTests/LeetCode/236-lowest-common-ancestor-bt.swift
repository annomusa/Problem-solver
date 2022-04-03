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
        
        _ = recurse(root, p, q)
        
        return res
    }
    
    private var res: TreeNode?
    
    private func recurse(_ root: TreeNode?, _ p: TreeNode?, _ q: TreeNode?) -> Bool {
        
        let curr = root?.desc ?? ""
        let left = root?.left?.desc ?? ""
        let right = root?.right?.desc ?? ""
        log(curr)
        
        guard let root = root else { return false }
        
        let foundInLeft = recurse(root.left, p, q)
        
        let foundInRight = recurse(root.right, p, q)
        
        let foundInCurrent = root.val == p?.val || root.val == q?.val
        
        if [foundInLeft, foundInCurrent, foundInRight]
            .filter { $0 }.count >= 2 {
            res = root
        }
        
        return foundInLeft || foundInRight || foundInCurrent
    }
}

import XCTest

class LowestCommonAncestorBTTest: XCTestCase {
    
    func xtestInit() {
        let a = TreeNode(pos: 0, arr: [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15])
    }
    
    func xtest0() {
        let sut = Solution()
        
        let a = TreeNode(pos: 0, arr: [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15])
        let p = TreeNode(9)
        let q = TreeNode(11)
        
        let res = sut.lowestCommonAncestor(a, p, q)
        
//        XCTAssertEqual(res?.val, 2)
    }
    
    func xtest1() {
        let sut = Solution()
        
        let a = TreeNode(pos: 0, arr: [3,5,1,6,2,0,8,nil,nil,7,4])
        let p = TreeNode(5)
        let q = TreeNode(1)
        
        let res = sut.lowestCommonAncestor(a, p, q)
        
        XCTAssertEqual(res?.val, 3)
    }
    
    /*
            3
        5       1
      6   2   0   8
     - - 7 4 - - - -
     */
    func test2() {
        let sut = Solution()
        
        let a = TreeNode(pos: 0, arr: [3,5,1,6,2,0,8,nil,nil,7,4])
        let p = TreeNode(5)
        let q = TreeNode(4)
        
        let res = sut.lowestCommonAncestor(a, p, q)
        
        XCTAssertEqual(res?.val, 5)
    }
    
    func xtest3() {
        let sut = Solution()
        
        let a = TreeNode(pos: 0, arr: [1,2])
        let p = TreeNode(1)
        let q = TreeNode(2)
        
        let res = sut.lowestCommonAncestor(a, p, q)
        
        XCTAssertEqual(res?.val, 1)
    }
}
