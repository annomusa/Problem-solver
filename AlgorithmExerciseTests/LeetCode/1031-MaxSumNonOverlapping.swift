//
//  MaxSumNonOverlappingTests.swift
//  LeetCodeTests
//
//  Created by Anno Musa on 30/05/21.
//

import Foundation
import XCTest
@testable import AlgorithmExercise

class MaxSumNonOverlapping {
    
    func maxSumTwoNoOverlap(_ nums: [Int], _ firstLen: Int, _ secondLen: Int) -> Int {
        
        return 0
    }
    
}


class MaxSumNonOverlappingTests: XCTestCase {
    
    var sut: MaxSumNonOverlapping!
    
    override func setUp() {
        sut = MaxSumNonOverlapping()
    }
    
    func testExample1() {
        let res = sut.maxSumTwoNoOverlap([0,6,5,2,2,5,1,9,4], 1, 2)
        XCTAssertEqual(res, 0)
    }
    
}
