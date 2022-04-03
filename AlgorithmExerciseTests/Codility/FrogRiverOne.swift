//
//  FrogRiverOne.swift
//  AlgorithmExerciseTests
//
//  Created by Anno Musa on 03/04/22.
//

import Foundation
import XCTest

private func solution(_ X : Int, _ A : inout [Int]) -> Int {
    
    var flag: [Int: Bool] = [:]
    let range = 1...X
    
    for i in A.enumerated() where range.contains(i.element) {
        flag[i.element] = true
        if flag.count == range.count {
            return i.offset
        } else {
            
        }
        
    }
    
    return -1
}

class FrogRiverOneTests: XCTestCase {
    
    func test1() {
        
        var a1: [Int] = [1,3,1,4,2,3,5,4]
        XCTAssertEqual(solution(5, &a1), 6)
        
    }
}
