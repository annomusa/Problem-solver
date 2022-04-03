//
//  PermMissingElem.swift
//  AlgorithmExerciseTests
//
//  Created by Anno Musa on 03/04/22.
//

import Foundation
import XCTest

private func solution(_ A : inout [Int]) -> Int {
    A.sort()
    
    for i in A.enumerated() {
        if i.offset + 1 != i.element {
            return i.offset + 1
        }
    }
    
    return A.count + 1
}

class PermMissingElemTests: XCTestCase {
    
    func test1() {
        var a1 = [2,3,1,5]
        XCTAssertEqual(solution(&a1), 4)
        
        var a2: [Int] = []
        XCTAssertEqual(solution(&a2), 1)
        
        var a3 = [1]
        XCTAssertEqual(solution(&a3), 2)
        
        var a4 = [2,3,1,5]
        XCTAssertEqual(solution(&a4), 4)
    }
    
}
