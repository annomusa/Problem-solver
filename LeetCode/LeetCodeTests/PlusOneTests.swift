//
//  PlusOneTests.swift
//  LeetCodeTests
//
//  Created by Anno Musa on 21/05/21.
//

import Foundation
import XCTest
@testable import LeetCode

class PlusOneTest: XCTestCase {
    
    var sut: PlusOne!
    
    override func setUp() {
        sut = PlusOne()
    }
    
    func testExample1() {
        let digits: [Int] = [1,2,3]
        let expectation: [Int] = [1,2,4]
        
        let result: [Int] = sut.plusOne(digits)
        
        XCTAssertEqual(result, expectation)
    }
    
    func testExample2() {
        let digits: [Int] = [4,3,2,1]
        let expectation: [Int] = [4,3,2,2]
        
        let result: [Int] = sut.plusOne(digits)
        
        XCTAssertEqual(result, expectation)
    }
    
    func testExample3() {
        let digits: [Int] = [0]
        let expectation: [Int] = [1]
        
        let result: [Int] = sut.plusOne(digits)
        
        XCTAssertEqual(result, expectation)
    }
    
    func testExample4() {
        let digits: [Int] = [7,2,8,5,0,9,1,2,9,5,3,6,6,7,3,2,8,4,3,7,9,5,7,7,4,7,4,9,4,7,0,1,1,1,7,4,0,0,6]
        let expectation: [Int] = [7,2,8,5,0,9,1,2,9,5,3,6,6,7,3,2,8,4,3,7,9,5,7,7,4,7,4,9,4,7,0,1,1,1,7,4,0,0,7]
        
        let result: [Int] = sut.plusOne(digits)
        
        XCTAssertEqual(result, expectation)
    }
    
    func testExample5() {
        let digits: [Int] = [9]
        let expectation: [Int] = [1,0]
        
        let result: [Int] = sut.plusOne(digits)
        
        XCTAssertEqual(result, expectation)
    }
    
    func testExample6() {
        let digits: [Int] = [9,8,9]
        let expectation: [Int] = [9,9,0]
        
        let result: [Int] = sut.plusOne(digits)
        
        XCTAssertEqual(result, expectation)
    }
    
    
}
