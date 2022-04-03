//
//  SNTest2.swift
//  AlgorithmExerciseTests
//
//  Created by Anno Musa on 03/04/22.
//

import Foundation
import XCTest

private func solution(_ A : inout [Int]) -> Int {
    let n = A.count
    guard n > 1 else { return 1 }
    guard n > 2 else { return 2 }
    
    var result: Int = .min
    var tempResult = 0
    
    var bivalued: (old: Int?, new: Int?) = (nil, nil)
    var lastSeqCount = 0
    
    for i in A {
        
        if i == bivalued.new || i == bivalued.old {
            tempResult += 1
        } else {
            tempResult = lastSeqCount + 1
        }
        
        if i == bivalued.new {
            lastSeqCount += 1
        } else {
            lastSeqCount = 1
            bivalued.old = bivalued.new
            bivalued.new = i
        }
        
        result = max(tempResult, result)
    }
    
    return result
}

class SNTest2: XCTestCase {
    
    func test1() {
        
        var a0 = [1,2,1,2,2,3,3,2,3]
        XCTAssertEqual(6, solution(&a0))
        
        var a1 = [4,5,5,4,5]
        XCTAssertEqual(5, solution(&a1))
        
        var a2 = [4,2,2,4,2]
        XCTAssertEqual(5, solution(&a2))
        
        var a3 = [1,2,3,2]
        XCTAssertEqual(3, solution(&a3))
        
        var a4 = [0,5,4,4,5,12]
        XCTAssertEqual(4, solution(&a4))
        
        var a5 = [4,4]
        XCTAssertEqual(2, solution(&a5))
        
        var a6 = [-1,0,-1,0,0,-2,-2,0,-2]
        XCTAssertEqual(6, solution(&a6))
        
        
    }
}

private func solution2(_ A: inout [Int]) -> Int {
    
    var result: Int = .min
    var lastSeen = -1
    var secondLastSeen = -1
    var tempCount = 0
    var lastSeenNumberRepeatedCount = 0
    
    for i in A {
        
        if i == lastSeen || i == secondLastSeen {
            tempCount += 1
        } else {
            tempCount = lastSeenNumberRepeatedCount + 1
        }
        
        if i == lastSeen {
            lastSeenNumberRepeatedCount += 1
        } else {
            lastSeenNumberRepeatedCount = 1
            secondLastSeen = lastSeen
            lastSeen = i
        }
        
        result = max(tempCount, result)
        
    }
    
    return result
}

extension SNTest2 {
    func test2() {
        
        var a0 = [1,2,1,2,2,3,3,2,3]
        XCTAssertEqual(6, solution2(&a0))
        
        var a1 = [4,5,5,4,5]
        XCTAssertEqual(5, solution2(&a1))
        
        var a2 = [4,2,2,4,2]
        XCTAssertEqual(5, solution2(&a2))
        
        var a3 = [1,2,3,2]
        XCTAssertEqual(3, solution2(&a3))
        
        var a4 = [0,5,4,4,5,12]
        XCTAssertEqual(4, solution2(&a4))
        
        var a5 = [4,4]
        XCTAssertEqual(2, solution2(&a5))
        
        var a6 = [4,4,3]
        XCTAssertEqual(2, solution2(&a5))
    }
}
