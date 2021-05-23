//
//  MakingAnagramsTests.swift
//  LeetCodeTests
//
//  Created by Anno Musa on 23/05/21.
//

import Foundation
import XCTest
@testable import LeetCode

class MakingAnagramsTests: XCTestCase {
    var sut: MakingAnagrams!
    
    override func setUp() {
        sut = MakingAnagrams()
    }
    
    func testExample1() {
        var res = sut.makeAnagram(a: "cde", b: "dcf")
        
        XCTAssertEqual(res, 2)
    }
    
    func testExample2() {
        var res = sut.makeAnagram(a: "cde", b: "abc")
        
        XCTAssertEqual(res, 4)
    }
    
    
}
