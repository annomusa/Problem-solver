//
//  TwoSumTests.swift
//  LeetCodeTests
//
//  Created by Anno Musa on 03/05/21.
//

import Foundation
import XCTest
@testable import LeetCode

final class TwoSumTests: XCTestCase {
    
    var sut: TwoSum!
    
    override func setUp() {
        sut = TwoSum()
    }
    
    func test_twoSum() {
        let res = sut.twoSum([2,7,11,15], 9)
        
        XCTAssertEqual(res, [0,1])
    }
    
}
