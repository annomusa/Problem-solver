//
//  MaxCounters.swift
//  AlgorithmExerciseTests
//
//  Created by Anno Musa on 03/04/22.
//

import Foundation
import XCTest

private func solution(_ N : Int, _ A : inout [Int]) -> [Int] {
    var additionalMap: [Int: Int] = [:]
    var lastMaxValue: Int = 0
    
    var defValue = 0
    
    for i in A {
        
        if i > N {
            defValue = lastMaxValue
            additionalMap.removeAll()
            continue
        } else {
            
            let valuei = additionalMap[i, default: defValue] + 1
            additionalMap[i] = valuei
            
            if valuei > lastMaxValue {
                lastMaxValue = valuei
            }
            
        }
        
    }
    
    var result: [Int] = []
    for i in 1...N {
        let val = additionalMap[i, default: defValue]
        result.append(val)
    }
    
    return result
}

class MaxCountersTests: XCTestCase {
    
    func test1() {
        var a1: [Int] = [3,4,4,6,1,4,4]
        XCTAssertEqual([3,2,2,4,2], solution(5, &a1))
    }
    
}
