//
//  TreeNode.swift
//  AlgorithmExercise
//
//  Created by Anno Musa on 23/03/22.
//

import Foundation

/**
 * Definition for a binary tree node.
 */
public class TreeNode {
    public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?
    public init(_ val: Int) {
        self.val = val
        self.left = nil
        self.right = nil
    }
}

public extension TreeNode {
    convenience init(from root: Int?...) throws {
        guard let first = root.first! else { throw NSError() }
        
        self.init(first)
        
        
    }
}
