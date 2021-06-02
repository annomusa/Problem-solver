//
//  PlusOperatorTests.swift
//  LeetCodeTests
//
//  Created by Anno Musa on 26/05/21.
//

import Foundation
import XCTest
@testable import LeetCode

class PlusOperatorTests: XCTestCase {
    
    func testExample1() {
        print("plus operator: ", Array<Int>.plus([1,2,3], [1,2,3]))
        print("plus operator: ", Array<Int>.plus([1,2], [1,2,3,4]))
        print("plus operator: ", Array<Int>.plus([1,2,3,4], [1,2]))
        print("plus operator: ", Array<Int>.plus([-1,2], [1,2,3,4]))
        
        print("plus operator: ", Array<Int>.plus([-1,2], []))
    }
    
}
