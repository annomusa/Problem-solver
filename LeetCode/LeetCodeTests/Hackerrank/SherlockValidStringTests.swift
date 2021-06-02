//
//  SherlockValidStringTests.swift
//  LeetCodeTests
//
//  Created by Anno Musa on 24/05/21.
//

import Foundation
import XCTest
@testable import LeetCode

class SherlockValidStringTests: XCTestCase {
    
    var sut: SherlockValidString!
    
    override func setUp() {
        sut = SherlockValidString()
    }
    
    func testExample1() {
        let res = sut.isYes(s: "abc")
        
        XCTAssertTrue(res)
    }
    
    func testExample2() {
        let res = sut.isYes(s: "abcc")
        
        XCTAssertTrue(res)
    }
    
    func testExample3() {
        let res = sut.isYes(s: "abccc")
        
        XCTAssertFalse(res)
    }
    
    func testExample4() {
        let res = sut.isYes(s: "aabbcd")
        
        XCTAssertFalse(res)
    }
    
    func testExample5() {
        let res = sut.isYes(s: "aabbccddeefghi")
        
        XCTAssertFalse(res)
    }
    
    func testExample6() {
        let res = sut.isYes(s: "abcdefghhgfedecba")
        
        XCTAssertTrue(res)
    }
}
