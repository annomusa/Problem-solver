//
//  DistinctArrayGeneratorTests.swift
//  LeetCodeTests
//
//  Created by Anno Musa on 21/05/21.
//

import Foundation
import XCTest
@testable import LeetCode

class DistinctArrayGeneratorTests: XCTestCase {
    
    var sut: DistinctArrayGenerator!
    
    override func setUp() {
        sut = DistinctArrayGenerator()
    }
    
    func testExample1() {
        let res = sut.solution(1)
        
        var sum: Int = 0
        for i in res {
            sum += i
        }
        
        XCTAssertEqual(sum, 0)
    }
    
    func testExample2() {
        let res = sut.solution(2)
        
        var sum: Int = 0
        for i in res {
            sum += i
        }
        
        XCTAssertEqual(sum, 0)
    }
    
    func testExample3() {
        let res = sut.solution(3)
        
        var sum: Int = 0
        for i in res {
            sum += i
        }
        
        XCTAssertEqual(sum, 0)
    }
    
    func testExample4() {
        let res = sut.solution(4)
        
        var sum: Int = 0
        for i in res {
            sum += i
        }
        
        XCTAssertEqual(sum, 0)
    }
    
    func testExample5() {
        let res = sut.solution(5)
        
        var sum: Int = 0
        for i in res {
            sum += i
        }
        
        XCTAssertEqual(sum, 0)
    }
    
    func testExample6() {
        let res = sut.solution(6)
        
        var sum: Int = 0
        for i in res {
            sum += i
        }
        
        XCTAssertEqual(sum, 0)
    }
}
