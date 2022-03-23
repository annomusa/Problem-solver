//
//  SherlockValidStringTests.swift
//  LeetCodeTests
//
//  Created by Anno Musa on 24/05/21.
//

import Foundation
import XCTest
@testable import AlgorithmExercise

class SherlockValidString {
    
    func isValid(s: String) -> String {
        
        return (isYes(s: s) ? "YES" : "NO")
    }
    
    func isYes(s: String) -> Bool {
        var dictChar: [Character: Int] = [:] // char, count
        for char in s {
            dictChar[char, default: 0] += 1
        }
        
        var dictOcc: [Int: Int] = [:] // count, occ
        for v in dictChar.values {
            dictOcc[v, default: 0] += 1
        }
        
        if dictOcc.values.count == 2 {
            let sorted = dictOcc.sorted { $0.value < $1.value }
            
            if sorted[0].1 > 1 { return false }
            
            return sorted[0].0 - 1 == sorted[1].0
                || sorted[0].0 - 1 == 0
        }
        
        return !(dictOcc.values.count > 2)
    }
    
}

class SherlockValidStringTests: XCTestCase {
    
    var sut: SherlockValidString!
    
    override func setUp() {
        sut = SherlockValidString()
    }
    
    func testExample1() {
        let res = sut.isYes(s: "abc")
        
        XCTAssertTrue(res)
    }
    
    func testExample2() {
        let res = sut.isYes(s: "abcc")
        
        XCTAssertTrue(res)
    }
    
    func testExample3() {
        let res = sut.isYes(s: "abccc")
        
        XCTAssertFalse(res)
    }
    
    func testExample4() {
        let res = sut.isYes(s: "aabbcd")
        
        XCTAssertFalse(res)
    }
    
    func testExample5() {
        let res = sut.isYes(s: "aabbccddeefghi")
        
        XCTAssertFalse(res)
    }
    
    func testExample6() {
        let res = sut.isYes(s: "abcdefghhgfedecba")
        
        XCTAssertTrue(res)
    }
}
