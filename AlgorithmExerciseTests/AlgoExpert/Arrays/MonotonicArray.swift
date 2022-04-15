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
        
        var result = true
        var stack: [Int] = [array[0]]
        
        for i in array {
            
            if stack.count < 2, i != stack.first {
                stack.append(i)
            } else if stack.count < 2, i == stack.first {
                continue
            } else if i == stack[1] {
                continue
            } else {
                let isMonotonicIncreasing = stack[1] > stack[0]
                let isCurrentIncreasing = i > stack[1]
                if isMonotonicIncreasing != isCurrentIncreasing {
                    return false
                } else {
                    stack.removeFirst()
                    stack.append(i)
                }
            }
            
        }
        
        return result
    }
}

class MonotonicArrayTests: XCTestCase {
    private let sut = Program2()
    
    func test1() {
        let res = sut.isMonotonic(array: [-1, -5, -10, -1100, -1100, -1101, -1102, -9001])
        XCTAssertTrue(res)
    }
    
    func test2() {
        let res = sut.isMonotonic(array: [-1, -1, -2, -3, -4, -5, -5, -5, -6, -7, -8, -7, -9, -10, -11])
        XCTAssertFalse(res)
    }
    
}

private class Program2 {
    func isMonotonic(array: [Int]) -> Bool {
        guard array.count > 2 else { return true }
        
        var result = true
        var direction = array[1] - array[0]
        
        for i in 2..<array.count {
            if direction == 0 {
                direction = array[i] - array[i-1]
                continue
            }
            
            var currDirection = array[i] - array[i-1]
            if currDirection == 0 {
                continue
            } else if (currDirection < 0) != (direction < 0) {
                return false
            }
        }
        
        return result
    }
}
