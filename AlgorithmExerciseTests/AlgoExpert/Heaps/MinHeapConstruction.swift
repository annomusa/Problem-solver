//
//  MinHeapConstruction.swift
//  AlgorithmExerciseTests
//
//  Created by Anno Musa on 05/04/22.
//

import Foundation
import XCTest

private class Program {
    class MinHeap {
        var heap = [Int]()
        
        init(array: [Int]) {
            var array = array
            heap = buildHeap(array: &array)
        }
        
        func buildHeap(array: inout [Int]) -> [Int] {
            let n = array.count
            let firstParentIndex = Int(Double((n - 1 - 1) / 2).rounded(.down))
            var endIndex = array.count - 1
            
            for var currentIndex in (0...firstParentIndex).reversed() {
                siftDown(currentIndex: &currentIndex, endIndex: &endIndex, heap: &array)
            }
            
            return array
        }
        
        func siftDown(currentIndex: inout Int, endIndex: inout Int, heap: inout [Int]) {
            var leftChildIndex = (currentIndex * 2) + 1
            
            while leftChildIndex <= endIndex {
                
                var rightChildIndex = leftChildIndex + 1
                var indexToSwap = leftChildIndex
                if rightChildIndex <= endIndex, heap[leftChildIndex] > heap[rightChildIndex] {
                    indexToSwap = rightChildIndex
                }
                
                if heap[indexToSwap] < heap[currentIndex] {
                    heap.swapAt(indexToSwap, currentIndex)
                    currentIndex = indexToSwap
                    leftChildIndex = (currentIndex * 2) + 1
                } else {
                    return
                }
            }
        }
        
        func siftUp(currentIndex: inout Int, heap: inout [Int]) {
            
            var parentIndex = Int(Double((currentIndex - 1) / 2).rounded(.down))
            
            while parentIndex >= 0 {
                
                if heap[parentIndex] > heap[currentIndex] {
                    heap.swapAt(parentIndex, currentIndex)
                    currentIndex = parentIndex
                    parentIndex = Int(Double((currentIndex - 1) / 2).rounded(.down))
                } else {
                    break
                }
            }
            
        }
        
        func peek() -> Int {
            return heap[0]
        }
        
        func remove() -> Int {
            var result = peek()
            heap.swapAt(0, heap.count - 1)
            heap.removeLast()
            var zero = 0
            var endIndex = heap.count - 1
            siftDown(currentIndex: &zero, endIndex: &endIndex, heap: &heap)
            return result
        }
        
        func insert(value: Int) {
            heap.append(value)
            var curr = heap.count - 1
            siftUp(currentIndex: &curr, heap: &heap)
        }
    }
}

class MinHeapConstructionTests: XCTestCase {
    private typealias MinHeap = Program.MinHeap
    func xtest1() {
        var array = [48, 12, 24, 7, 8, -5, 24, 391, 24, 56, 2, 6, 8, 41]
        let heap = MinHeap(array: array)
        heap.buildHeap(array: &array)
        heap.insert(value: 76)
        heap.peek()
        heap.remove()
        heap.peek()
        heap.remove()
        heap.peek()
        heap.insert(value: 87)
    }
    
    func test2() {
        var array = [17,12,30,102,9,18,23,44,31]
        
        let heap = MinHeap(array: array)
        
        heap.buildHeap(array: &array)
        
        heap.insert(value: 76)
        heap.peek()
        heap.remove()
        heap.peek()
        heap.remove()
        heap.peek()
        heap.insert(value: 87)
    }
    
    func xtest() {
        let program = Program()
        let minHeap = Program.MinHeap(array: [48, 12, 24, 7, 8, -5, 24, 391, 24, 56, 2, 6, 8, 41])
        minHeap.insert(value: 76)
        try assert(isMinHeapPropertySatisfied(array: minHeap.heap))
        try XCTAssertEqual(minHeap.peek(), -5)
        try XCTAssertEqual(minHeap.remove(), -5)
        try assert(isMinHeapPropertySatisfied(array: minHeap.heap))
        try XCTAssertEqual(minHeap.peek(), 2)
        try XCTAssertEqual(minHeap.remove(), 2)
        try assert(isMinHeapPropertySatisfied(array: minHeap.heap))
        try XCTAssertEqual(minHeap.peek(), 6)
        minHeap.insert(value: 87)
        try assert(isMinHeapPropertySatisfied(array: minHeap.heap))
    }
    
    func isMinHeapPropertySatisfied(array: [Int]) -> Bool {
        for currentIndex in 0 ..< array.count - 1 {
            var parentIndex = Double((currentIndex - 1) / 2)
            parentIndex = parentIndex.rounded(.down)
            
            if parentIndex < 0 {
                break
            }
            
            if array[Int(parentIndex)] > array[currentIndex] {
                return false
            }
        }
        return true
    }
}
