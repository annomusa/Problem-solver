//
//  ArrayManipulationTests.swift
//  LeetCodeTests
//
//  Created by Anno Musa on 23/05/21.
//

import Foundation
import XCTest
@testable import LeetCode

class ArrayManipulationTests: XCTestCase {
    
    var sut: ArrayManipulation!
    
    override func setUp() {
        sut = ArrayManipulation()
    }
    
    func testExample1() {
        let res = sut.arrayManipulation(n: 10, queries: [[1,5,3],[4,8,7],[6,9,1]])
        
        XCTAssertEqual(res, 10)
    }
    
    func testExample2() {
        let res = sut.arrayManipulation(n: 5, queries: [[1,2,100],[2,5,100],[3,4,100]])
        
        XCTAssertEqual(res, 200)
    }
}
