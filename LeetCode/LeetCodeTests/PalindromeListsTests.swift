//
//  PalindromeListsTests.swift
//  LeetCodeTests
//
//  Created by Anno Musa on 22/05/21.
//

import Foundation
import XCTest
@testable import LeetCode

class PalindromeListsTests: XCTestCase {
    
    var sut: PalindromeLists!
    
    override func setUp() {
        sut = PalindromeLists()
    }
    
    func testExample1() {
        let task = ListNode(1, ListNode(0, ListNode(1)))
        
        XCTAssertTrue(sut.isPalindrome(task))
    }
}
