//
//  FindClosestValueBST.swift
//  AlgorithmExerciseTests
//
//  Created by Anno Musa on 01/04/22.
//

import Foundation
import XCTest

private class Program {
    class BST {
        var value: Int
        var left: BST?
        var right: BST?
        
        init(value: Int) {
            self.value = value
            left = nil
            right = nil
        }
    }
    
    func findClosestValueInBST(tree: BST?, target: Int) -> Int {
        guard let tree = tree else { return -1 }
        return recurse(tree: tree, target: target, currentRes: tree.value)
    }
    
    private func recurse(tree: BST, target: Int, currentRes: Int) -> Int {
        var currentRes = currentRes
        
        let diffCurr = abs(target - currentRes)
        
        if let left = tree.left, target < tree.value {
            
            let diffLeft = abs(target - left.value)
            currentRes = diffLeft < diffCurr ? left.value : currentRes
            return recurse(tree: left, target: target, currentRes: currentRes)
            
        } else if let right = tree.right, target > tree.value {
            
            let diffRight = abs(target - right.value)
            currentRes = diffRight < diffCurr ? right.value : currentRes
            return recurse(tree: right, target: target, currentRes: currentRes)
            
        }
        
        return currentRes
    }
}

class FindClosestValueBSTTests: XCTestCase {
    private typealias BST = Program.BST
    func xtest1() {
        let tree = BST(value: 10)
        
        tree.left = BST(value: 5)
        tree.left?.left = BST(value: 2)
        tree.left?.right = BST(value: 7)
        tree.left?.left?.left = BST(value: 1)
        
        tree.right = BST(value: 15)
        tree.right?.right = BST(value: 22)
        tree.right?.left = BST(value: 13)
        tree.right?.left?.right = BST(value: 14)
        
        let sut = Program()
        sut.findClosestValueInBST(tree: tree, target: 9)
        
    }
    
    func test2() {
        let tree = BST(value: 10)
        
        tree.left = BST(value: 5)
        tree.left?.left = BST(value: 2)
        tree.left?.right = BST(value: 7)
        tree.left?.left?.left = BST(value: 1)
        
        tree.right = BST(value: 15)
        tree.right?.right = BST(value: 22)
        tree.right?.left = BST(value: 13)
        tree.right?.left?.right = BST(value: 14)
        
        let sut = Program()
        sut.findClosestValueInBST(tree: tree, target: 11)
        
    }
}
