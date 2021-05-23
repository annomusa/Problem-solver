//
//  ListNode.swift
//  LeetCode
//
//  Created by Anno Musa on 22/05/21.
//

import Foundation

class ListNode {
    var val: Int
    var next: ListNode?
    
    init() {
        self.val = 0
        self.next = nil
    }
    
    init(_ val: Int) {
        self.val = val
        self.next = nil
    }
    
    init(_ val: Int, _ next: ListNode?) {
        self.val = val
        self.next = next;
    }
    
    func print() {
        var currentNode: ListNode? = self
        while let loopNode = currentNode {
            Swift.print("merged: ", loopNode.val)
            currentNode = loopNode.next
        }
    }
}
