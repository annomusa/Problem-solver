//
//  WholeWeeksTests.swift
//  LeetCodeTests
//
//  Created by Anno Musa on 22/05/21.
//

import Foundation
import XCTest
@testable import LeetCode

class WholeWeeksTests: XCTestCase {
    
    var sut: WholeWeeks!
    
    override func setUp() {
        sut = WholeWeeks()
    }
    
    func testExample1() {
        let expectation = 7
        var Y = 2014, A = "April", B = "May", W = "Wednesday"
        let result = sut.solution(Y, &A, &B, &W)
        
        XCTAssertEqual(expectation, result)
    }
    
    func testExample2() {
        let expectation = 4
        var Y = 2021, A = "January", B = "January", W = "Wednesday"
        let result = sut.solution(Y, &A, &B, &W)
        
        XCTAssertEqual(expectation, result)
    }
    
    func testExample3() {
        let expectation = 29
        var Y = 2021, A = "January", B = "July", W = "Wednesday"
        let result = sut.solution(Y, &A, &B, &W)
        
        XCTAssertEqual(expectation, result)
    }
    
    func testExample4() {
        let expectation = 8
        var Y = 2020, A = "April", B = "May", W = "Wednesday"
        let result = sut.solution(Y, &A, &B, &W)
        
        XCTAssertEqual(expectation, result)
    }
    
    func testExample5() {
        let expectation = 7
        var Y = 2014, A = "April", B = "May", W = "Wednesday"
        let result = sut.solution(Y, &A, &B, &W)
        
        XCTAssertEqual(expectation, result)
    }
    
    func testExample6() {
        let expectation = 7
        var Y = 2014, A = "April", B = "May", W = "Wednesday"
        let result = sut.solution(Y, &A, &B, &W)
        
        XCTAssertEqual(expectation, result)
    }
    
    func testExample7() {
        let expectation = 7
        var Y = 2014, A = "April", B = "May", W = "Wednesday"
        let result = sut.solution(Y, &A, &B, &W)
        
        XCTAssertEqual(expectation, result)
    }
    
    
}
