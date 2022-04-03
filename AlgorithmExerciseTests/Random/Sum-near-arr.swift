//
//  Sum-near-arr.swift
//  AlgorithmExerciseTests
//
//  Created by Anno Musa on 29/03/22.
//

import XCTest

private class Solution {
    
    func run(arr1: [Int], arr2: [Int], x: Int) -> [[Int]] {
        var res: [[Int]] = []
        
        var arr1s = arr1.sorted()
        var arr2s = arr2.sorted()
        
        // row arr1, col arr2
        let rowSize = arr1.count
        let colSize = arr2.count
        
        var emptyCol: [Int] = Array(repeating: 0, count: colSize)
        var table: [[Int]] = Array(repeating: emptyCol, count: rowSize)
        for i in arr1s.enumerated() {
            
            for j in arr2s.enumerated() {
                
                table[i.offset][j.offset] = i.element + j.element
                
            }
            
        }
        
        return res
    }
    
}

class Sum_near_arr: XCTestCase {
    func test0() {
        
        let sut = Solution()
        let res = sut.run(
            arr1: [-1,3,8,2,9,5],
            arr2: [4,1,2,10,5,20],
            x: 24
        )
        
    }
}
