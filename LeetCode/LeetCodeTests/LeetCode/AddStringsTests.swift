//
//  AddStringsTests.swift
//  LeetCodeTests
//
//  Created by Anno Musa on 22/05/21.
//

import Foundation
import XCTest
@testable import LeetCode

class AddStringsTests: XCTestCase {
    var sut: AddStrings!
    
    override func setUp() {
        sut = AddStrings()
    }
    
    func testExample1() {
        let expectation = "134"
        let result = sut.addStrings("11", "123")
        XCTAssertEqual(result, expectation)
    }
    
    func testExample2() {
        let expectation = "533"
        let result = sut.addStrings("456", "77")
        XCTAssertEqual(result, expectation)
    }
    
    func testExample3() {
        let expectation = "0"
        let result = sut.addStrings("0", "0")
        XCTAssertEqual(result, expectation)
    }
    
    func testExample4() {
        let expectation = "10405985147604178950"
        let result = sut.addStrings("3876620623801494171", "6529364523802684779")
        XCTAssertEqual(result, expectation)
    }
}
