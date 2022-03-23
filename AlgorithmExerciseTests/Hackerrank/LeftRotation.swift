//
//  LeftRotationTests.swift
//  LeetCodeTests
//
//  Created by Anno Musa on 23/05/21.
//

import Foundation
import XCTest
@testable import AlgorithmExercise

class LeftRotation {
    
    func rotLeft(a: [Int], d: Int) -> [Int] {
        
        var mod = d % a.count
        
        var res: [Int] = Array(a.dropFirst(mod))
        res += Array(a.dropLast(a.count - d))
        
        return res
    }
    
}

class LeftRotationTests: XCTestCase {
    
    var sut: LeftRotation!
    
    override func setUp() {
        sut = LeftRotation()
    }
    
    func testExample1() {
        let res = sut.rotLeft(a: [1,2,3,4,5], d: 4)
        
        XCTAssertEqual(res, [5, 1, 2, 3, 4])
    }
}
