//
//  RepeatedStringTests.swift
//  LeetCodeTests
//
//  Created by Anno Musa on 23/05/21.
//

import Foundation
import XCTest
@testable import AlgorithmExercise

class RepeatedString {
    func repeatedString(s: String, n: Int) -> Int {
        var numberOfA: Int = s.reduce(0) { res, char in
            return res + ((char == "a") ? 1 : 0)
        }
        
        var factor = n / s.count
        var remaining = n % s.count
        numberOfA *= factor
        
        for i in 0..<remaining {
            if s[i] == "a" {
                numberOfA += 1
            }
        }
        
        return numberOfA
    }
}


class RepeatedStringTests: XCTestCase {
    
    var sut: RepeatedString!
    
    override func setUp() {
        sut = RepeatedString()
    }
    
    func testExample1() {
        let result = sut.repeatedString(s: "aba", n: 10)
        
        XCTAssertEqual(result, 7)
    }
    
    func testExample2() {
        let result = sut.repeatedString(s: "a", n: 1000000000000)
        
        XCTAssertEqual(result, 1000000000000)
    }
    
    func testExample3() {
        let result = sut.repeatedString(s: "abcac", n: 10)
        
        XCTAssertEqual(result, 4)
    }
}
