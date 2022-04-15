//
//  450-delete-node-bst.swift
//  AlgorithmExerciseTests
//
//  Created by Anno Musa on 10/04/22.
//

import Foundation
@testable import AlgorithmExercise
import XCTest

private class Solution {
    
    /*
     
     find key, and apply this case
     case 1: left and right nil. ->
     case 2: right is nil. -> using predecessor of left
     case 3: left is nil. -> using successor of right
     case 4: none of it nil. -> using successor of right
     */
    func deleteNode(_ root: TreeNode?, _ key: Int) -> TreeNode? {
        guard var root: TreeNode? = root, let rootVal = root?.val else { return nil }
        
        if key > rootVal {
            root?.right = deleteNode(root?.right, key)
        } else if key < rootVal {
            root?.left = deleteNode(root?.left, key)
        } else {
            
            if root?.left == nil, root?.right == nil {
                root = nil
            } else if let right = root?.right, let successor = successor(root) {
                root?.val = successor
                root?.right = deleteNode(root?.right, successor)
            } else if let left = root?.left, let predecessor = predecessor(root) {
                root?.val = predecessor
                root?.left = deleteNode(root?.left, predecessor)
            }
            
        }
        
        return root
    }
    
    private func predecessor(_ root: TreeNode?) -> Int? {
        guard let left = root?.left else { return nil }
        var predecessor: TreeNode? = left
        while let right = predecessor?.right {
            predecessor = right
        }
        return predecessor?.val
    }
    
    private func successor(_ root: TreeNode?) -> Int? {
        guard let right = root?.right else { return nil }
        var successor: TreeNode? = right
        while let left = successor?.left {
            successor = left
        }
        return successor?.val
    }
}

class DeleteNodeBSTTests: XCTestCase {
    private let sut = Solution()
    func test1() {
        
        let root = TreeNode(pos: 0, arr: [5,3,6,2,4,nil,7])
        sut.deleteNode(root, 3)
        
    }
}
