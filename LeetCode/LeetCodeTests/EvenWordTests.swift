//
//  EvenWordTests.swift
//  LeetCodeTests
//
//  Created by Anno Musa on 21/05/21.
//

import Foundation
import XCTest
@testable import LeetCode

class EvenWordTests: XCTestCase {
    
    var sut: EvenWord!
    
    override func setUp() {
        sut = EvenWord()
    }
    
    func testExample1() {
        var task = "acbcbba"
        
        let res = sut.solution(&task)
        
        XCTAssertEqual(res, 1)
    }
    
    func testExample2() {
        var task = "axxaxa"
        
        let res = sut.solution(&task)
        
        XCTAssertEqual(res, 2)
    }
    
    func testExample3() {
        var task = "aaaa"
        
        let res = sut.solution(&task)
        
        XCTAssertEqual(res, 0)
    }
}
