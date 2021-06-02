//
//  XenditFirstTests.swift
//  LeetCodeTests
//
//  Created by Anno Musa on 24/05/21.
//

import Foundation
import XCTest
@testable import LeetCode

class XenditFirstTests: XCTestCase {
    
    var sut: XenditFirst!
    
    override func setUp() {
        sut = XenditFirst()
    }
    
    func testExample1() {
        let res = sut.solution()
        
        XCTAssertEqual(res, 0)
    }
    
//    func testExample2() {
//        let res = sut.solution()
//        
//        XCTAssertEqual(res, 0)
//    }
//    
//    func testExample3() {
//        let res = sut.solution()
//        
//        XCTAssertEqual(res, 0)
//    }
//    
//    func testExample4() {
//        let res = sut.solution()
//        
//        XCTAssertEqual(res, 0)
//    }
//    
//    func testExample5() {
//        let res = sut.solution()
//        
//        XCTAssertEqual(res, 0)
//    }
    
}
