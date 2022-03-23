//
//  EvenWordTests.swift
//  LeetCodeTests
//
//  Created by Anno Musa on 21/05/21.
//

import Foundation
import XCTest
@testable import AlgorithmExercise

class EvenWord {
    
    public func solution(_ S : inout String) -> Int {
        
        var charDict: [Character: Int] = [:]
        for char in S {
            
            if let countChar = charDict[char] {
                charDict[char] = countChar + 1
            } else {
                charDict[char] = 1
            }
            
        }
        
        var shouldRemove: [Character] = []
        for pair in charDict {
            guard pair.value % 2 != 0 else { continue }
            shouldRemove.append(pair.key)
        }
        
        return shouldRemove.count
    }
    
}

class EvenWordTests: XCTestCase {
    
    var sut: EvenWord!
    
    override func setUp() {
        sut = EvenWord()
    }
    
    func testExample1() {
        var task = "acbcbba"
        
        let res = sut.solution(&task)
        
        XCTAssertEqual(res, 1)
    }
    
    func testExample2() {
        var task = "axxaxa"
        
        let res = sut.solution(&task)
        
        XCTAssertEqual(res, 2)
    }
    
    func testExample3() {
        var task = "aaaa"
        
        let res = sut.solution(&task)
        
        XCTAssertEqual(res, 0)
    }
}
