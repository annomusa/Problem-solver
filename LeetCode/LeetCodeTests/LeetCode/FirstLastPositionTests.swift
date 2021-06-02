//
//  FirstLastPositionTests.swift
//  LeetCodeTests
//
//  Created by Anno Musa on 03/05/21.
//

import XCTest
@testable import LeetCode

class FirstLastPositionTests: XCTestCase {
    
    var sut: FirstLastPosition!
    
    override func setUp() {
        sut = FirstLastPosition()
    }
    
    func test_firstLastPosition() {
        
        let res = sut.searchRange([5,7,7,8,8,10], 8)
        
        XCTAssertEqual(res, [3,4])
    }
    
    func test_oneItem() {
        let res = sut.searchRange([1], 1)
        
        XCTAssertEqual(res, [0, 0])
    }
    
}
