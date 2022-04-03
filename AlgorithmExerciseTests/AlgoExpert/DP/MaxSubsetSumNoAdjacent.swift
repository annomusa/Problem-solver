//
//  MaxSubsetSumNoAdjacent.swift
//  AlgorithmExerciseTests
//
//  Created by Anno Musa on 02/04/22.
//

import Foundation
import XCTest

private class Program {
    
    /*
     [75,105,120,75,90,135]
     [75,105,195,180,285,330]
     75 120 135
     
     [75,105,120,75,90,135,200,10]
     [75,105,195,180,285,330,485,340]
     75 120 90 200 = 485
     */
    func maximumSubsetSum(array: [Int]) -> Int {
        if array.count < 1 {
            return 0
        } else if array.count < 2 {
            return array[0]
        } else if array.count < 3 {
            return max(array[0], array[1])
        } else if array.count < 4 {
            return max(array[0] + array[2], array[1])
        }
        
        
        var newArr: [Int] = Array(repeating: 0, count: array.count)
        newArr[0] = array[0]
        newArr[1] = array[1]
        newArr[2] = array[0] + array[2]
        
        for i in 3..<array.count {
            
            let findex = i-2
            let sindex = i-3
            newArr[i] = max(newArr[findex], newArr[sindex]) + array[i]
            
        }
        
        return max(newArr.removeLast(), newArr.removeLast())
    }
}

private extension Collection {
    subscript(safe idx: Index) -> Element? {
        return indices.contains(idx) ? self[idx] : nil
    }
}

class MaxSubsetSumNoAdjacentTests: XCTestCase {
    
    func test1() {
        let sut = Program()
        let res = sut.maximumSubsetSum(array: [75,105,120,75,90,135])
        
        XCTAssertEqual(res, 330)
    }
    
    func test2() {
        let sut = Program()
        let res = sut.maximumSubsetSum(array: [1])
        
        XCTAssertEqual(res, 1)
    }
}
