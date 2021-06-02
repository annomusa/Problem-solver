//
//  ReverseStringTests.swift
//  LeetCodeTests
//
//  Created by Anno Musa on 02/05/21.
//

import Foundation
import XCTest
@testable import LeetCode

final class ReverseStringTests: XCTestCase {
    
    var sut: ReverseStringSolution!
    
    override func setUp() {
        sut = ReverseStringSolution()
    }
    
    func test_hello_olleh() {
        let string = "Hello"
        var chars: [Character] = Array(string)
        sut.reverseString(&chars)
        
        let expectation: [Character] = Array("olleH")
        XCTAssertEqual(chars, expectation)
    }
}
