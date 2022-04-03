//
//  Node.swift
//  AlgorithmExercise
//
//  Created by Anno Musa on 25/03/22.
//

import Foundation

 public class Node {
     public var val: Int
     public var left: Node?
     public var right: Node?
     public var parent: Node?
     public init(_ val: Int) {
         self.val = val
         self.left = nil
         self.right = nil
         self.parent = nil
     }
 }

/*
 0 1 2 3 4 5 6 7 8 9 10 11 12 13 14
 
         0
    1          2
  3   4     5     6
 7 8 9 10 11 12 13 14
 */
public extension Node {
    convenience init?(_ val: Int?) {
        guard let val = val else { return nil }
        self.init(val)
    }
    
    convenience init?(pos: Int, arr: [Int?]) {
        
        self.init(arr[safe: pos] ?? nil)
        
        let leftIndex = pos * 2 + 1
        if leftIndex < arr.count {
            self.left = Node(pos: leftIndex, arr: arr)
            self.left?.parent = self
        }
        
        let rightIndex = leftIndex + 1
        if rightIndex < arr.count {
            self.right = Node(pos: rightIndex, arr: arr)
            self.right?.parent = self
        }
        
        let curr = desc
        let left = self.left?.desc ?? ""
        let right = self.right?.desc ?? ""
        log(curr)
    }
}

public func findNode(root: Node?, val: Int) -> Node? {
    guard let root = root else { return nil }
    
    if root.val == val {
        return root
    }
    
    let left = findNode(root: root.left, val: val)
    let right = findNode(root: root.right, val: val)
    
    return left ?? right ?? nil
}

public extension Node {
    var desc: String {
        "\(val)"
    }
}
