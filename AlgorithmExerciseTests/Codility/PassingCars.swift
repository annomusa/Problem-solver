//
//  PassingCars.swift
//  AlgorithmExerciseTests
//
//  Created by Anno Musa on 03/04/22.
//

import Foundation
import XCTest

private func solution(_ A : inout [Int]) -> Int {
    
    var result = 0
    
    var count1 = 0
    
    let LIMIT = 1_000_000_000
    
    for i in A.reversed() {
        
        if i == 0 {
            
            result = result + count1
            if result > LIMIT {
                return -1
            }
            
        } else {
            
            count1 += 1
            
        }
        
    }
    
    return result
}

class PassingCarsTests: XCTestCase {
    
    func test1() {
        var a1: [Int] = [0,1,0,1,1]
        XCTAssertEqual(5, solution(&a1))
        
        var a2: [Int] = [0,1,1,1,0,0,0,1,1,0,1,1,0,1]
        XCTAssertEqual(27, solution(&a2))
    }
    
}
