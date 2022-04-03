//
//  SingleCycleCheck.swift
//  AlgorithmExerciseTests
//
//  Created by Anno Musa on 03/04/22.
//

import Foundation
import XCTest

private class Program {
    func hasSingleCycle(array: [Int]) -> Bool {
        let n = array.count
        
        var visiting: [Int: Int] = [:]
        for jump in array.enumerated() {
            
            var newLocation = (jump.element % n) + jump.offset
            
            if newLocation < 0 {
                newLocation = n - abs(newLocation)
            } else if newLocation >= n {
                newLocation = newLocation - n
            }
            
            visiting[jump.offset] = newLocation
            
        }
        
        var isVisited: [Int: Bool] = [:]
        var currVisitorIndex: Int? = 0
        
        while let index = currVisitorIndex {
            if isVisited[index, default: false] {
                break
            } else {
                isVisited[index] = true
                currVisitorIndex = visiting[index]
            }
        }
        
        let isEndingInStart: Bool = currVisitorIndex != nil ? currVisitorIndex! == 0 : false
        return isVisited.count == n && isEndingInStart
    }
}

class SingleCycleCheckTests: XCTestCase {
    
    func test1() {
        let sut = Program()
        
        let res = sut.hasSingleCycle(array: [2, 3, 1, -4, -4, 2])
        XCTAssertTrue(res)
    }
    
    func test2() {
        let sut = Program()
        
        let res = sut.hasSingleCycle(array: [10, 11, -6, -23, -2, 3, 88, 909, -26])
        XCTAssertFalse(res)
    }
    
    func test3() {
        let sut = Program()
        
        let res = sut.hasSingleCycle(array: [1, -1, 1, -1])
        XCTAssertFalse(res)
    }
    
    func test4() {
        let sut = Program()
        
        let res = sut.hasSingleCycle(array: [1, 1, 1, 1, 2])
        XCTAssertFalse(res)
    }
}
