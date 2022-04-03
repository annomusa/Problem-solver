//
//  OddOccurrencesInArray.swift
//  AlgorithmExerciseTests
//
//  Created by Anno Musa on 03/04/22.
//

import Foundation
import XCTest

private func solution(_ A : inout [Int]) -> Int {
    
    var countElement: [Int: Int] = [:]
    
    for i in A {
        
        countElement[i, default: 0] += 1
        
    }
    
    return countElement.first { key, val in
        val % 2 == 1
    }?.key ?? 0
}

class OddOccurrencesInArray: XCTestCase {
    
    func test1() {
        
        var a1 = [9,3,9,3,9,7,9]
        XCTAssertEqual(7, solution(&a1))
        
    }
    
}
