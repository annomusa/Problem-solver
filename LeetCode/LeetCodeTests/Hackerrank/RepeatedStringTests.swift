//
//  RepeatedStringTests.swift
//  LeetCodeTests
//
//  Created by Anno Musa on 23/05/21.
//

import Foundation
import XCTest
@testable import LeetCode

class RepeatedStringTests: XCTestCase {
    
    var sut: RepeatedString!
    
    override func setUp() {
        sut = RepeatedString()
    }
    
    func testExample1() {
        let result = sut.repeatedString(s: "aba", n: 10)
        
        XCTAssertEqual(result, 7)
    }
    
    func testExample2() {
        let result = sut.repeatedString(s: "a", n: 1000000000000)
        
        XCTAssertEqual(result, 1000000000000)
    }
    
    func testExample3() {
        let result = sut.repeatedString(s: "abcac", n: 10)
        
        XCTAssertEqual(result, 4)
    }
}
