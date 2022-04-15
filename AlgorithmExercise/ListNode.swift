//
//  ListNode.swift
//  LeetCode
//
//  Created by Anno Musa on 22/05/21.
//

import Foundation

public class ListNode {
    public var val: Int
    public var next: ListNode?
    
    public init() {
        self.val = 0
        self.next = nil
    }
    
    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }
    
    public init(_ val: Int, _ next: ListNode?) {
        self.val = val
        self.next = next;
    }
    
    public func print() {
        var currentNode: ListNode? = self
        while let loopNode = currentNode {
            Swift.print("merged: ", loopNode.val)
            currentNode = loopNode.next
        }
    }
}

public extension ListNode {
    
    convenience init?(arr: [Int]) {
        guard let first = arr.first else { return nil }
        self.init(first)
        
        let arr = arr.dropFirst()
        var curr: ListNode? = self
        for i in arr {
            curr?.next = ListNode(i)
            curr = curr?.next
        }
    }
    
    func toArray() -> [Int] {
        var arr: [Int] = []
        
        var currentNode: ListNode? = self
        while let loopNode = currentNode {
            arr.append(loopNode.val)
            currentNode = loopNode.next
        }
        
        return arr
    }
    
}
