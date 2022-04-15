//
//  ThreeNumberSum.swift
//  AlgorithmExerciseTests
//
//  Created by Anno Musa on 01/04/22.
//

import Foundation
@testable import AlgorithmExercise
import XCTest

private class Program {
    
    /*
     [12,3,1,2,-6,5,-8,6] -> 0
     [-8,-6,1,2,3,5,6,12] -> hasmap?
     dictionary two sum =
     8,6,-1,-2,-3,-5,-6,-12
     
     */
    
    func threeNumberSum(array: inout [Int], targetSum: Int) -> [[Int]] {
        
        array.sort()
        
        var result: [[Int]] = []
        
        while let val = array.first {
            _ = array.removeFirst()
            
            let res = twoSum(array: array, targetSum: targetSum - val)
            
            for re in res {
                var new = [val]
                new.append(contentsOf: re)
                result.append(new)
            }
        }
        
        let unique = Array(Set(result))
        
        let sorted = unique.sorted { first, second in
            if first[0] != second[0] { return first[0] < second[0] }
            if first[1] != second[1] { return first[1] < second[1] }
            return first[2] < second[2]
        }
        
        return result
    }
    
    private func twoSum(array: [Int], targetSum: Int) -> [[Int]] {
        var res: [[Int]] = []
        var existMap: [Int: Bool] = [:]
        for i in array {
            if existMap[targetSum - i, default: false] {
                if i > targetSum - i {
                    res.append([targetSum - i, i])
                } else {
                    res.append([i, targetSum - i])
                }
            }
            existMap[i] = true
        }
        return res
    }
}

class ThreeNumberSumTests: XCTestCase {
    private let sut = Program3()
    
    func test1() {
        var arr = [12,3,1,2,-6,5,-8,6]
        let res = sut.threeNumberSum(
            array: &arr,
            targetSum: 0
        )
        
        XCTAssertEqual([[-8,2,6], [-8,3,5], [-6,1,5]], res)
    }
    
    func test2() {
        var arr = [12, 3, 1, 2, -6, 5, -8, 6]
        let res = sut.threeNumberSum(
            array: &arr,
            targetSum: 0
        )
        
        XCTAssertEqual([[-8,2,6], [-8,3,5], [-6,1,5]], res)
    }
}

private class Program3 {
    func threeNumberSum(array: inout [Int], targetSum: Int) -> [[Int]] {
        array.sort()
        var result: [[Int]] = []
        
        for i in 0..<array.count-2 {
            var p1 = i+1
            var p2 = array.count-1
            
            while p1 < p2 {
                let res = array[i] + array[p1] + array[p2]
                if targetSum == res {
                    result.append([array[i], array[p1], array[p2]])
                    p1 += 1
                    p2 -= 1
                } else if targetSum > res {
                    p1 += 1
                } else { // targetSum < res
                    p2 -= 1
                }
            }
        }
        
        return result
    }
}
