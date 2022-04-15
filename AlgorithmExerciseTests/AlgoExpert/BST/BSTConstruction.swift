//
//  BSTConstruction.swift
//  AlgorithmExerciseTests
//
//  Created by Anno Musa on 09/04/22.
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
        
        func insert(value: Int) -> BST {
            if value < self.value {
                if let left = left {
                    left.insert(value: value)
                } else {
                    left = BST(value: value)
                }
            } else {
                if let right = right {
                    right.insert(value: value)
                } else {
                    right = BST(value: value)
                }
            }
            return self
        }
        
        func contains(value: Int) -> Bool {
            if value < self.value {
                return left?.contains(value: value) ?? false
            } else if value > self.value {
                return right?.contains(value: value) ?? false
            }
            
            return true
        }
        
        func remove(value: Int?, parentNode: BST?) -> BST {
            
            if let valueToRemove = value, valueToRemove < self.value {
                if let left = left {
                    left.remove(value: value, parentNode: self)
                }
            } else if let valueToRemove = value, valueToRemove > self.value {
                if let right = right {
                    right.remove(value: value, parentNode: self)
                }
            } else {
                if let left = left, let right = right {
                    self.value = right.getMinValue()
                    right.remove(value: self.value, parentNode: self)
                } else if parentNode === nil {
                    if let left = left {
                        self.value = left.value
                        right = left.right
                        self.left = left.left
                    } else if let right = right {
                        self.value = right.value
                        left = right.left
                        self.right = right.right
                    } else {
                        
                    }
                } else if let parent = parentNode, let parentLeft = parent.left, parentLeft === self {
                    if let left = left {
                        parent.left = left
                    } else {
                        parent.left = right
                    }
                } else if let parent = parentNode, let parentRight = parent.right, parentRight === self {
                    if let left = left {
                        parent.right = left
                    } else {
                        parent.right = right
                    }
                }
            }
            
            return self
        }
        
        private func getMinValue() -> Int {
            if let left = left {
                return left.getMinValue()
            } else {
                return value
            }
        }
    }
}

class BSTConstructionTests: XCTestCase {
    
    
    
}
