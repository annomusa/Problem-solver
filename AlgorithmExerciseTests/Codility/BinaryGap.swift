//
//  BinaryGap.swift
//  AlgorithmExerciseTests
//
//  Created by Anno Musa on 03/04/22.
//

import Foundation
import XCTest

private func solution(_ N : Int) -> Int {
    
    let binary = String(N, radix: 2)
    print(binary)
    
    var binaryGaps: [Int] = []
    var runningCount: Int? = 0
    for i in binary {
        
        if i == "1", let count = runningCount {
            binaryGaps.append(count)
            runningCount = 0
        } else {
            runningCount? += 1
        }
        
    }
    
    return binaryGaps.max() ?? 0
}

class BinaryGapTests: XCTestCase {
    
    func test1() {
        
        XCTAssertEqual(solution(9), 2)
        
        XCTAssertEqual(solution(529), 4)
        
        XCTAssertEqual(solution(20), 1)
        
        XCTAssertEqual(solution(15), 0)
        
        XCTAssertEqual(solution(32), 0)
        
        XCTAssertEqual(solution(1041), 5)
        
        XCTAssertEqual(solution(695271806), 7)
        
        XCTAssertEqual(solution(0), 0)
        
        XCTAssertEqual(solution(1), 0)
        
        XCTAssertEqual(solution(2), 0)
        
        XCTAssertEqual(solution(3), 0)
        
        XCTAssertEqual(solution(4), 0)
        
        XCTAssertEqual(solution(5), 1)
        
        XCTAssertEqual(solution(6), 0)
        
        XCTAssertEqual(solution(7), 0)
    }
    
}
