//
//  TapeEquilibrium.swift
//  AlgorithmExerciseTests
//
//  Created by Anno Musa on 03/04/22.
//

import Foundation
import XCTest

private func solution(_ A : inout [Int]) -> Int {
    let n = A.count
    
    let pMax = n - 1
    
    var res: Int = .max
    
    var allSum = 0
    for i in A {
        allSum += i
    }
    
    var sumFirstPart = 0
    var sumSecondPart = 0
    
    for p in 0..<pMax {
        sumFirstPart += A[p]
        sumSecondPart = allSum - sumFirstPart
        res = min(abs(sumFirstPart - sumSecondPart), res)
    }
    
    return res
}

class TapeEquilibriumTests: XCTestCase {
    
    func test1() {
        
        var a1: [Int] = [3,1,2,4,3]
        XCTAssertEqual(1, solution(&a1))
    }
    
}
