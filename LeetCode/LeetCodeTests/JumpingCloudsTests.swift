//
//  JumpingCloudsTests.swift
//  LeetCodeTests
//
//  Created by Anno Musa on 23/05/21.
//

import Foundation
import XCTest
@testable import LeetCode

class JumpingCloudsTests: XCTestCase {
    
    var sut: JumpingClouds!
    
    override func setUp() {
        sut = JumpingClouds()
    }
    
    func testExample1() {
        let result = sut.jumpingOnClouds(c: [0,0,1,0,0,1,0])
        
        XCTAssertEqual(result, 4)
    }
    
    func testExample2() {
        let result = sut.jumpingOnClouds(c: [0,0,0,0,1,0])
        
        XCTAssertEqual(result, 3)
    }
    
    func testExample3() {
        let result = sut.jumpingOnClouds(c: [0,1,0,0,0,1,0])
        
        XCTAssertEqual(result, 3)
    }
}
