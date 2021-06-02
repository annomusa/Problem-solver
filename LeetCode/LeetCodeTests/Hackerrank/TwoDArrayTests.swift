//
//  TwoDArray.swift
//  LeetCodeTests
//
//  Created by Anno Musa on 23/05/21.
//

import Foundation
import XCTest
@testable import LeetCode

class TwoDArrayTests: XCTestCase {
    
    var sut: TwoDArray!
    
    override func setUp() {
        sut = TwoDArray()
    }
    
    func testExample1() {
        let arr = [
            [1, 1, 1, 0, 0, 0],
            [0, 1, 0, 0, 0, 0],
            [1, 1, 1, 0, 0, 0],
            [0, 0, 2, 4, 4, 0],
            [0, 0, 0, 2, 0, 0],
            [0, 0, 1, 2, 4, 0]
        ]
        
        let res = sut.hourglassSum(arr: arr)
        
        XCTAssertEqual(res, 19)
    }
    
    func testExample2() {
        let arr = [
            [1, 1, 1, 0, 0, 0],
            [0, 1, 0, 0, 0, 0],
            [1, 1, 1, 0, 0, 0],
            [0, 0, 2, 4, 4, 0],
            [0, 0, 0, 2, 0, 0],
            [0, 0, 1, 2, 4, 0]
        ]
        
        let res = sut.hourglassSum(arr: arr)
        
        XCTAssertEqual(res, 19)
    }
}
