//
//  SortKSortedArray.swift
//  AlgorithmExerciseTests
//
//  Created by Anno Musa on 10/04/22.
//

import Foundation
import XCTest
@testable import AlgorithmExercise

private class Program {
    /*
     [3,1,2,2]
     [1,3,2,2]
     [1,2,3,2]
     [1,2,2,3]
     */
    func sortKSortedArray(_ array: inout [Int], _ k: Int) -> [Int] {
        var res: [Int] = Array(repeating: .max, count: array.count)
        
        var currIndex = 0
        
        while !array.isEmpty {
            
            var smallestIndex: Int = 0
            
            var newK = k
            if array.count - 1 < k {
                newK = array.count - 1
            }
            for i in 0...newK {
                if array[i] < res[currIndex] {
                    res[currIndex] = array[i]
                    smallestIndex = i
                }
            }
            currIndex += 1
            array.remove(at: smallestIndex)
        }
        
        return res
    }
}

private class Program2 {
    func sortKSortedArray(_ array: inout [Int], _ k: Int) -> [Int] {
        guard array.count != 0 && k != 0 else { return array }
        
        var res: [Int] = Array(repeating: .max, count: array.count)
        
        let heap = MinHeap(Array(array[0...min(k, array.count - 1)]))
        
        var currIndex = 0
        
        for i in stride(from: k+1, to: array.count, by: 1) {
            
            res[currIndex] = heap.remove()!
            
            currIndex += 1
            
            heap.insertValue(array[i])
        }
        
        while !heap.isEmpty() {
            res[currIndex] = heap.remove()!
            currIndex += 1
        }
        
        return res
    }
}

class SortKSortedArrayTests: XCTestCase {
    
    func test1() {
        let sut = Program2()
        var arr = [3, 2, 1, 5, 4, 7, 6, 5]
        var res = sut.sortKSortedArray(&arr, 3)
        XCTAssertEqual(res, [1,2,3,4,5,5,6,7])
    }
    
    func test2() {
        let sut = Program2()
        var arr = [3,1,2,2]
        var res = sut.sortKSortedArray(&arr, 4)
        XCTAssertEqual(res, [1,2,2,3])
    }
    
    func test3() {
        let sut = Program2()
        
        var arr = [0]
        XCTAssertEqual(sut.sortKSortedArray(&arr, 0), [0])
        
        var arr1 = [1]
        XCTAssertEqual(sut.sortKSortedArray(&arr1, 1), [1])
        
        var arr2 = [-1,-5]
        XCTAssertEqual(sut.sortKSortedArray(&arr2, 1), [-5,-1])
    }
    
    func test4() {
        let sut = Program2()
        var arr = [1, 2, 3, 4, 5, 6, 1]
        var res = sut.sortKSortedArray(&arr, 8)
        XCTAssertEqual(res, [1, 1, 2, 3, 4, 5, 6])
    }
}
