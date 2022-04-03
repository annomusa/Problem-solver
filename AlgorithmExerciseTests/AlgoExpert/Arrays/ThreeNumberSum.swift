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
            
            let newTargetSum = targetSum - val
            
            let res = twoSum(array: array, targetSum: newTargetSum)
            
            for re in res {
                var new = [val]
                new.append(contentsOf: re)
                new.sort()
                result.append(new)
            }
        }
        
//        for val in array {
//
//            let newTargetSum = targetSum - val
//
//            let excludedArr = array.filter { i in
//                i != val
//            }
//
//            let res = twoSum(array: excludedArr, targetSum: newTargetSum)
//
//            for re in res {
//                var new = [val]
//                new.append(contentsOf: re)
//                new.sort()
//                result.append(new)
//            }
//        }
        
        let unique = Array(Set(result))
        
        let sorted = unique.sorted { first, second in
            if first[0] != second[0] { return first[0] < second[0] }
            if first[1] != second[1] { return first[1] < second[1] }
            return first[2] < second[2]
        }
        
        return sorted
    }
    
    private func twoSum(array: [Int], targetSum: Int) -> [[Int]] {
        var res: [[Int]] = []
        var existMap: [Int: Bool] = [:]
        for i in array {
            if existMap[targetSum - i, default: false] {
                res.append([i, targetSum - i])
            }
            existMap[i] = true
        }
        return res
    }
}

class ThreeNumberSumTests: XCTestCase {
    
    func test1() {
        
        let sut = Program()
        var arr = [12,3,1,2,-6,5,-8,6]
        let res = sut.threeNumberSum(
            array: &arr,
            targetSum: 0
        )
        
        XCTAssertEqual([[-8,2,6], [-8,3,5], [-6,1,5]], res)
    }
    
    func test2() {
        
        let sut = Program()
        var arr = [12, 3, 1, 2, -6, 5, -8, 6]
        let res = sut.threeNumberSum(
            array: &arr,
            targetSum: 0
        )
        
        XCTAssertEqual([[-8,2,6], [-8,3,5], [-6,1,5]], res)
    }
}

private class Program2 {
    func threeNumberSum(array: inout [Int], targetSum: Int) -> [[Int]] {
        var result: [[Int]] = []
        
        array.sort()
        
        for i in 0..<array.count - 2 {
            var left = i + 1
            var right = array.count - 1
            
            while left < right {
                
                let currentSum = array[i] + array[left] + array[right]
                
                if currentSum == targetSum {
                    result.append([array[i], array[left], array[right]])
                    left += 1
                    right -= 1
                } else if currentSum < targetSum {
                    
                    left += 1
                } else if currentSum > targetSum {
                    
                    right -= 1
                } else {
                    
                    
                }
                
            }
        }
        
        return result
    }
}
