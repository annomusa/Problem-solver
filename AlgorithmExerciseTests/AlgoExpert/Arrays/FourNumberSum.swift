//
//  FourNumberSum.swift
//  AlgorithmExerciseTests
//
//  Created by Anno Musa on 06/04/22.
//

import Foundation
import XCTest

private class Program {
    func fourNumberSum(array: [Int], targetSum: Int) -> [[Int]] {
        let n = array.count
        let sortedArray = array.sorted()
        
        var res: [[Int]] = []
        for i in 0..<n-3 {
            
            let targetThreeSum = targetSum - sortedArray[i]
            let res3 = threeNumberSum(array: Array(sortedArray[i+1..<n]), targetSum: targetThreeSum).forEach {
                res.append([sortedArray[i], $0[0], $0[1], $0[2]])
            }
            
        }
        
        return res
    }
    
    private func threeNumberSum(array: [Int], targetSum: Int) -> [[Int]] {
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

class FourNumberSumTests: XCTestCase {
    
    private let sut = Program2()
    
    func test1() {
        let res = sut.fourNumberSum(
            array: [7, 6, 4, -1, 1, 2],
            targetSum: 16
        )
        let exp = [
            [7, 6, 4, -1],
            [7, 6, 1, 2],
        ]
        XCTAssertEqual(exp, res)
    }
    
    func test2() {
        let res = sut.fourNumberSum(
            array: [1, 2, 3, 4, 5, 6, 7],
            targetSum: 10
        )
        let exp = [
            [1, 2, 3, 4]
        ]
        XCTAssertEqual(exp, res)
    }
    
}
private class Program2 {
    // Average: 0(n^2) time | 0(n^2) space
    // Worst: 0(n^3) time | 0(n^2) space
    func fourNumberSum(array: [Int], targetSum: Int) -> [[Int]] {
        
        var allPairSums = [Int: [(Int, Int)]]()
        var quadruplets = [[Int]]()
        
        for i in 1..<array.count - 1 {
            
            for j in i+1..<array.count {
                let currentSum = array[i] + array[j]
                let difference = targetSum - currentSum
                if allPairSums.keys.contains(difference) {
                    for pair in allPairSums[difference]! {
                        quadruplets.append([pair.0, pair.1, array[i], array[j]])
                    }
                }
            }
            
            for k in 0..<i {
                let currentSum = array[k] + array[i]
                if !allPairSums.keys.contains(currentSum) {
                    allPairSums[currentSum] = [(array[k], array[i])]
                } else {
                    allPairSums[currentSum]!.append((array[k], array[i]))
                }
            }
        }
        
        return quadruplets
    }
}
