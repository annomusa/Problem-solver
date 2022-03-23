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
    }
}

/*
 0 1 2 3 4 5 6 7 8 9 10 11 12 13 14
 
         0
    1          2
  3   4     5     6
 7 8 9 10 11 12 13 14
 */
public extension TreeNode {
    convenience init?(_ val: Int?) {
        guard let val = val else { return nil }
        self.init(val)
    }
    
    convenience init?(pos: Int, arr: [Int?]) {
//        log("pos   \(pos)")
        
        self.init(arr[safe: pos] ?? nil)
        
        let leftIndex = pos * 2 + 1
        if leftIndex < arr.count - 1 {
            self.left = TreeNode(pos: leftIndex, arr: arr)
//            log("left  \(self.left!.val)")
        }
        
        let rightIndex = leftIndex + 1
        if rightIndex < arr.count - 1 {
            self.right = TreeNode(pos: rightIndex, arr: arr)
//            log("right \(self.right!.val)")
        }
    }
}
