//
//  SNTest1.swift
//  AlgorithmExerciseTests
//
//  Created by Anno Musa on 03/04/22.
//

import Foundation
import XCTest

private func solution(_ A : inout [Int]) -> Int {
    let n = A.count
    
    guard n > 4 else { return 0 }
    guard n > 5 else { return A[1] + A[3] }
    
    var breakers: [(Int, ClosedRange<Int>)] = []
    var range = 0...2
    
    let lastStartBreakers = n - 4
    for i in 1...lastStartBreakers {
        breakers.append(
            (i, i+2...n-2)
        )
    }
    
    var min: Int = .max
    
    for i in breakers {
        
        for j in i.1 {
            
            let val = A[i.0] + A[j]
            if val < min {
                min = val
            }
            
        }
        
    }
    
    return min
}

private func solution2(_ A : inout [Int]) -> Int {
    let n = A.count
    
    guard n > 4 else { return 0 }
    guard n > 5 else { return A[1] + A[3] }
    
    var result: Int = .max
    
    var p1 = 1
    var p2 = n-2
    
    while p1 < p2 {
        result = min(result, A[p1] + A[p2])
        
        if A[p1] > A[p2] {
            p1 += 1
        } else {
            p2 -= 1
        }
    }
    
    return result
}

class SNTest1: XCTestCase {
    
    func test1() {
        var a1 = [5,2,4,6,3]
        XCTAssertEqual(8, solution(&a1))
        
        var a2 = [5,2,4,6,3,7]
        XCTAssertEqual(5, solution(&a2))
        
        var a3 = [5,2,4,6,3,7,1]
        XCTAssertEqual(5, solution(&a3))
        
        var a4 = [5,2,4,6,3,7,1,5]
        XCTAssertEqual(3, solution(&a4))
        
        var a5 = [5,2,4,6,3,7,1,5,1,2,413,3,2,1,7,3,6,8,9,1,5,12,3,7,12]
        XCTAssertEqual(2, solution(&a5))
    }
    
    func test2() {
        var a1 = [5,2,4,6,3]
        XCTAssertEqual(8, solution2(&a1))
        
        var a2 = [5,2,4,6,3,7]
        XCTAssertEqual(5, solution2(&a2))
        
        var a3 = [5,2,4,6,3,7,1]
        XCTAssertEqual(5, solution2(&a3))
        
        var a4 = [5,2,4,6,3,7,1,5]
        XCTAssertEqual(3, solution2(&a4))
        
        var a5 = [5,2,4,6,3,7,1,5,1,2,413,3,2,1,7,3,6,8,9,1,5,12,3,7,12]
        XCTAssertEqual(2, solution(&a5))
        
    }
}
