//
//  AlternatingCharactersTests.swift
//  LeetCodeTests
//
//  Created by Anno Musa on 24/05/21.
//

import Foundation
import XCTest
@testable import LeetCode

class AlternatingCharactersTests: XCTestCase {
    
    var sut: AlternatingCharacters!
    
    override func setUp() {
        sut = AlternatingCharacters()
    }
    
    func testExample1() {
        let res = sut.alternatingCharacters(s: "AAAA")
        
        XCTAssertEqual(res, 3)
    }
    
    func testExample2() {
        let res = sut.alternatingCharacters(s: "BBBBB")
        
        XCTAssertEqual(res, 4)
    }
    
    func testExample3() {
        let res = sut.alternatingCharacters(s: "ABABABABABAB")
        
        XCTAssertEqual(res, 0)
    }
    
    func testExample4() {
        let res = sut.alternatingCharacters(s: "AAABBB")
        
        XCTAssertEqual(res, 4)
    }
    
}
