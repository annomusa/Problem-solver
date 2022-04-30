//
//  Heap.swift
//  AlgorithmExercise
//
//  Created by Anno Musa on 12/04/22.
//

import Foundation

class Heap<T: Comparable> {
    
    private(set) var heap: [T] = []
    private let comparator: (T, T) -> Bool
    
    init(_ array: [T], comparator: @escaping (T, T) -> Bool) {
        self.heap = array
        self.comparator = comparator
        
        guard !array.isEmpty else { return }
        
        let n = heap.count
        let firstParentIndex = Int(Double((n - 1 - 1) / 2).rounded(.down))
        
        for currentIndex in (0...firstParentIndex).reversed() {
            siftDownIndex(currentIndex)
        }
    }
    
    func peek() -> T? {
        guard !heap.isEmpty else { return nil }
        return heap[0]
    }
    
    func remove() -> T? {
        guard !heap.isEmpty else { return nil }
        let result = heap[0]
        heap.swapAt(0, heap.count - 1)
        heap.removeLast()
        siftDownIndex(0)
        return result
    }
    
    func insertValue(_ val: T) {
        heap.append(val)
        siftUpIndex(heap.count - 1)
    }
    
    func isEmpty() -> Bool {
        return heap.isEmpty
    }
    
    func count() -> Int {
        return heap.count
    }
    
    func remove(value: T) -> T? {
        guard let index = heap.firstIndex(where: { $0 == value }),
              index < count()
        else { return nil }
        
        let lastIndex = heap.count - 1
        var res: T?
        if index != lastIndex {
            heap.swapAt(index, lastIndex)
            res = heap.removeLast()
            siftDownIndex(index)
            siftUpIndex(index)
        } else {
            res = heap.removeLast()
        }
        return res
    }
    
    private func siftDownIndex(_ index: Int) {
        let endIndex = heap.count - 1
        
        var currentIndex = index
        var leftChildIndex = (index * 2) + 1
        
        while leftChildIndex <= endIndex {
            
            let rightChildIndex = leftChildIndex + 1
            var indexToSwap = leftChildIndex
            
            if rightChildIndex <= endIndex,
               comparator(heap[rightChildIndex], heap[leftChildIndex]) {
                indexToSwap = rightChildIndex
            }
            
            if comparator(heap[indexToSwap], heap[currentIndex]) {
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
            
            if comparator(heap[currentIndex], heap[parentIndex]) {
                heap.swapAt(parentIndex, currentIndex)
                currentIndex = parentIndex
                parentIndex = Int(Double((currentIndex - 1) / 2).rounded(.down))
            } else {
                break
            }
        }
    }
}
