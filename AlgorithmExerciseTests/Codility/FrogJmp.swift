//
//  FrogJmp.swift
//  AlgorithmExerciseTests
//
//  Created by Anno Musa on 03/04/22.
//

import Foundation
import XCTest

private func solution(_ X : Int, _ Y : Int, _ D : Int) -> Int {
    
    let distance = Y - X
    
    guard distance > 0, D > 0 else { return 0 }
    
    let res = distance / D
    let mod = distance % D
    
    return mod != 0 ? res + 1 : res
}

class FrogJmpTests: XCTestCase {
    
    func test1() {
        
        XCTAssertEqual(3, solution(10, 85, 30))
        
    }
    
}
