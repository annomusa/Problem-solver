//
//  PermCheck.swift
//  AlgorithmExerciseTests
//
//  Created by Anno Musa on 03/04/22.
//

import Foundation
import XCTest

private func solution(_ A : inout [Int]) -> Int {
    
    var flag: [Int: Bool] = [:]
    let range = 1...A.count
    
    for i in A.enumerated() {
        if !range.contains(i.element) {
            return 0
        } else if flag[i.element, default: false] {
            return 0
        } else {
            flag[i.element] = true
        }
    }
    
    return 1
}

class PermCheckTests: XCTestCase {
    
    func test1() {
        
        var a1: [Int] = [4,1,3,2]
        XCTAssertEqual(1, solution(&a1))
        
        var a2: [Int] = [4,1,3]
        XCTAssertEqual(0, solution(&a2))
        
    }
    
}
