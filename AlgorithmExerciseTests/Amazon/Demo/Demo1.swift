//
//  Demo1.swift
//  AlgorithmExerciseTests
//
//  Created by Anno Musa on 16/04/22.
//
// https://leetcode.com/discuss/interview-question/1184534/amazon-oa-sde2-optimizing-box-weight-gift-grouping
import Foundation
import XCTest

/*
 * Complete the 'minimalHeaviestSetA' function below.
 *
 * The function is expected to return an INTEGER_ARRAY.
 * The function accepts INTEGER_ARRAY arr as parameter.
 */

private func minimalHeaviestSetA(arr: [Int]) -> [Int] {
    var res: [Int] = []
    
    var arr = arr
    
    var aSum = 0
    var bSum = arr.reduce(0, { $0 + $1 })
    
    var last: Int = .max
    
    arr.sort(by: >)
    
    for i in arr {
        if aSum > bSum {
            break
        }
        
        last = i
        res.append(last)
        aSum += last
        bSum -= last
    }
    
    return res.sorted()
}

class AmazonDemo1Tests: XCTestCase {
    
    func test1() {
        
        XCTAssertEqual(minimalHeaviestSetA(arr: [3,7,5,6,2]), [6,7])

        XCTAssertEqual(minimalHeaviestSetA(arr: [5,3,2,4,1,2]), [4,5])

        XCTAssertEqual(minimalHeaviestSetA(arr: [4,2,5,1,6]), [5,6])

        XCTAssertEqual(minimalHeaviestSetA(arr: [1,1,1,4]), [4])
        
        XCTAssertEqual(minimalHeaviestSetA(arr: [1,1,1,1]), [1,1,1])
        
    }
    
}
