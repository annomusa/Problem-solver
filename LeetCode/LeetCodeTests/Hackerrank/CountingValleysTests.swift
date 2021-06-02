//
//  CountingValleysTests.swift
//  LeetCodeTests
//
//  Created by Anno Musa on 23/05/21.
//

import Foundation
import XCTest
@testable import LeetCode

class CountingValleysTests: XCTestCase {
    
    var sut: CountingValleys!
    
    override func setUp() {
        sut = CountingValleys()
    }
    
    func testExample1() {
        let res = sut.countingValleys(steps: 8, path: "UDDDUDUU")
        
        XCTAssertEqual(res, 1)
    }
    
    func testExample2() {
        let res = sut.countingValleys(steps: 8, path: "DDUUUUDD")
        
        XCTAssertEqual(res, 1)
    }
}
