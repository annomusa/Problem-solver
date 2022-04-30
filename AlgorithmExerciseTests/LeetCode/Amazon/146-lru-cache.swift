//
//  146-lru-cache.swift
//  AlgorithmExerciseTests
//
//  Created by Anno Musa on 16/04/22.
//

import Foundation
@testable import AlgorithmExercise

class LRUCache {
    
    var capacity: Int
    var count: Int
    var cache: [Int: DoubleListNode]
    
    var head: DoubleListNode?
    var tail: DoubleListNode?
    
    init(_ capacity: Int) {
        self.capacity = capacity
        self.count = 0
        self.cache = [:]
        
        head = DoubleListNode(key: -1, value: -1)
        tail = DoubleListNode(key: -1, value: -1)
        
        head?.next = tail
        tail?.prev = head
    }
    
    func get(_ key: Int) -> Int {
        if let node = cache[key] {
            moveNodeToHead(node)
            return node.value
        } else {
            return -1
        }
    }
    
    func put(_ key: Int, _ value: Int) {
        if let node = cache[key] {
            node.value = value
            moveNodeToHead(node)
        } else {
            var newNode = DoubleListNode(key: key, value: value)
            cache[key] = newNode
            addNode(newNode)
            
            count += 1
            
            if count > capacity, var tail = popTail() {
                // poptail
                cache.removeValue(forKey: tail.key)
                count -= 1
            }
        }
    }
}

extension LRUCache {
    private func addNode(_ node: DoubleListNode) {
        /*
         1 2 -> x <- 4 5
                ^
         */
        
        node.prev = head
        node.next = head?.next
        
        head?.next?.prev = node
        head?.next = node
    }
    
    private func removeNode(_ node: DoubleListNode) {
        var prev = node.prev
        var next = node.next
        
        prev?.next = next
        next?.prev = prev
    }
    
    private func moveNodeToHead(_ node: DoubleListNode) {
        removeNode(node)
        addNode(node)
    }
    
    private func popTail() -> DoubleListNode? {
        guard let res = tail?.prev else { return nil }
        removeNode(res)
        return res
    }
}

/**
 * Your LRUCache object will be instantiated and called as such:
 * let obj = LRUCache(capacity)
 * let ret_1: Int = obj.get(key)
 * obj.put(key, value)
 */
