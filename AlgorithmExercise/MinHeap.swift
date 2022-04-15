//
//  MinHeap.swift
//  AlgorithmExercise
//
//  Created by Anno Musa on 10/04/22.
//

import Foundation

class MinHeap {
    
    private(set) var heap: [Int] = []
    
    init(_ array: [Int]) {
        self.heap = array
        
        guard !array.isEmpty else { return }
        
        let n = heap.count
        let firstParentIndex = Int(Double((n - 1 - 1) / 2).rounded(.down))
        var endIndex = array.count - 1
        
        for currentIndex in (0...firstParentIndex).reversed() {
            siftDownIndex(currentIndex)
        }
    }
    
    func peek() -> Int? {
        guard !heap.isEmpty else { return nil }
        return heap[0]
    }
    
    func remove() -> Int? {
        guard !heap.isEmpty else { return nil }
        var result = heap[0]
        heap.swapAt(0, heap.count - 1)
        heap.removeLast()
        siftDownIndex(0)
        return result
    }
    
    func insertValue(_ val: Int) {
        heap.append(val)
        siftUpIndex(heap.count - 1)
    }
    
    func isEmpty() -> Bool {
        return heap.isEmpty
    }
    
    func count() -> Int {
        return heap.count
    }
    
    private func siftDownIndex(_ index: Int) {
        let endIndex = heap.count - 1
        
        var currentIndex = index
        var leftChildIndex = (index * 2) + 1
        
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
    
    private func siftUpIndex(_ index: Int) {
        var currentIndex = index
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
}
