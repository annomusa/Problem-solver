//
//  MonotonicArray.swift
//  AlgorithmExerciseTests
//
//  Created by Anno Musa on 02/04/22.
//

import Foundation
import XCTest

private class Program {
    func isMonotonic(array: [Int]) -> Bool {
        guard array.count > 2 else { return true }
        var sdf = String("asdf".reversed()) == "fdsa"
        var isIncreasing = false
        var isDecreasing = false
        var isSame = false
        
        var previousVal = array[0]
        for i in array.enumerated() {
            guard i.offset != 0 else { continue }
            
            if previousVal < i.element {
                isIncreasing = true
            } else if previousVal > i.element {
                isDecreasing = true
            } else {
                isSame = true
            }
            previousVal = i.element
        }
        
        return (isIncreasing && isDecreasing) || (isIncreasing && isSame) || (isDecreasing && isSame)
    }
}

class MonotonicArrayTests: XCTestCase {
    
    func test1() {
        
        let sut = Program()
        
        let res = sut.isMonotonic(array: [-1, -5, -10, -1100, -1100, -1101, -1102, -9001])
        XCTAssertTrue(res)
    }
    
    func test2() {
        
        let sut = Program()
        
        let res = sut.isMonotonic(array: [-1, -5, -10, -1100, -1101, -1102, -1103, -9001])
        XCTAssertFalse(res)
    }
    
}
