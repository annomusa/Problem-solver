//
//  MergedSortedArrays.swift
//  AlgorithmExerciseTests
//
//  Created by Anno Musa on 05/04/22.
//

import Foundation
import XCTest
@testable import AlgorithmExercise

private extension Array {
    subscript (safe idx: Index) -> Element? {
        return idx < count ? self[idx] : nil
    }
}

private class Program {
    static func mergeSortedArrays(_ arrays: [[Int]]) -> [Int] {
        var arrays = arrays
        var totalCount: Int = arrays.reduce(0) { partialResult, arr in
            return partialResult + arr.count
        }
        
        var result: [Int] = []
        
        for currIdx in 0..<totalCount {
            var minCurrent: (Int, Int) = (.max, 0)
            for arr in arrays.enumerated() {
                guard let first = arr.element[safe: 0] else { continue }
                if first < minCurrent.0 {
                    minCurrent = (first, arr.offset)
                }
            }
            arrays[minCurrent.1].removeFirst()
            result.append(minCurrent.0)
        }
        
        return result// [-124,-1,0,1,3,5,6,9,12,20,21,81,121,150]
    }
}

private struct Item {
    let value: Int, idx: Int, arrIdx: Int
}

extension Item: Comparable {
    static func < (lhs: Item, rhs: Item) -> Bool {
        return lhs.value < rhs.value
    }
}

private class Program2 {
    
    static func mergeSortedArrays(_ arrays: [[Int]]) -> [Int] {
        
        var result: [Int] = []
        
        var firstBatch: [Item] = arrays.enumerated().map { array in
            Item(value: array.element[0], idx: 0, arrIdx: array.offset)
        }
        let heap = Heap<Item>(firstBatch, comparator: { $0 < $1 })
        
        while let smallestItem = heap.remove() {
            result.append(smallestItem.value)
            
            let maxIdxArray = arrays[smallestItem.arrIdx].count - 1
            let nextIdx = smallestItem.idx + 1
            guard nextIdx <= maxIdxArray else { continue }
            
            let value = arrays[smallestItem.arrIdx][nextIdx]
            heap.insertValue(
                Item(value: value, idx: nextIdx, arrIdx: smallestItem.arrIdx)
            )
        }
        
        return result
    }
}

class MergedSortedArraysTests: XCTestCase {
    
    func test1() {
        
        let a1 = [
            [1, 5, 9, 21],
            [-1, 0],
            [-124, 81, 121],
            [3, 6, 12, 20, 150]
        ]
        XCTAssertEqual(
            [-124,-1,0,1,3,5,6,9,12,20,21,81,121,150],
            Program2.mergeSortedArrays(a1)
        )
        
    }
    
}
