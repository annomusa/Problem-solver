//
//  SalesByMatchTests.swift
//  LeetCodeTests
//
//  Created by Anno Musa on 23/05/21.
//

import Foundation
import XCTest
@testable import LeetCode

class SalesByMatchTests: XCTestCase {
    
    var sut: SalesByMatch!
    
    override func setUp() {
        sut = SalesByMatch()
    }
    
    func testExample1() {
        let result = sut.sockMerchant(n: 7, ar: [1,2,1,2,1,3,2])
        
        XCTAssertEqual(result, 2)
    }
    
    func testExample2() {
        let result = sut.sockMerchant(
            n: 9,
            ar: [10, 20, 20, 10, 10, 30, 50, 10, 20]
        )
        
        XCTAssertEqual(result, 3)
    }
}
