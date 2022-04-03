//
//  SNTrialTest1.swift
//  AlgorithmExerciseTests
//
//  Created by Anno Musa on 03/04/22.
//

import Foundation
import XCTest

// you can write to stdout for debugging purposes, e.g.
// print("this is a debug message")

private func solution(_ A : inout [Int]) -> Int {
    
    A.sort()
    
    guard let last = A.last, last > 0 else { return 1 }
    
    A = A.filter { $0 > 0 }
    
    var target = 1
    
    for i in A.enumerated() {
        
        if i.element > target {
            break
        } else {
            target = i.element + 1
        }
        
    }
    
    return target
}

class SNTrialTest1Tests: XCTestCase {
    
    func xtest1() {
        var a: [Int] = [1,2,3]
        XCTAssertEqual(
            solution(&a),
            4
        )
    }
    
    func xtest2() {
        var a: [Int] = [-1,-3]
        XCTAssertEqual(
            solution(&a),
            1
        )
    }
    
    func test3() {
        var a: [Int] = [1, 3, 6, 4, 1, 2]
        XCTAssertEqual(
            solution(&a),
            5
        )
    }
    
    func test4() {
        var a: [Int] = [1,3,5,7,-1,-2,-3]
        XCTAssertEqual(
            solution(&a),
            2
        )
    }
    
    func test5() {
        var a: [Int] = [2,3,5,7,-1,-2,-3]
        XCTAssertEqual(
            solution(&a),
            1
        )
    }
    
    func test6() {
        var a: [Int] = [0]
        XCTAssertEqual(
            solution(&a),
            1
        )
    }
}
