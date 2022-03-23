//
//  NewYearChaosTests.swift
//  LeetCodeTests
//
//  Created by Anno Musa on 23/05/21.
//

import Foundation
import XCTest
@testable import AlgorithmExercise

class NewYearChaos {
    
    func minimumBribes(q: [Int]) {
        print(minimumBribesString(q: q))
    }
    
    func minimumBribesString(q: [Int]) -> String {
        var bribesCount: Int = 0
        var expectedFirst = 1
        var expectedSecond = 2
        var expectedThird = 3
        
        for i in 0..<q.count {
            if q[i] == expectedFirst {
                expectedFirst = expectedSecond
                expectedSecond = expectedThird
                expectedThird += 1
            } else if q[i] == expectedSecond {
                bribesCount += 1
                expectedSecond = expectedThird
                expectedThird += 1
            } else if q[i] == expectedThird {
                bribesCount += 2
                expectedThird += 1
            } else {
                return "Too chaotic"
            }
        }
        return "\(bribesCount)"
    }
    
}


class NewYearChaosTests: XCTestCase {
    
    var sut: NewYearChaos!
    
    override func setUp() {
        sut = NewYearChaos()
    }
    
    func testExample1() {
        let q = [1,2,3,5,4,6,7,8]
        let res: String = sut.minimumBribesString(q: q)
        
        XCTAssertEqual(res, "1")
    }
    
    func testExample2() {
        let q = [5, 1, 2, 3, 7, 8, 6, 4]
        let res: String = sut.minimumBribesString(q: q)
        
        XCTAssertEqual(res, "Too chaotic")
    }
    
    func testExample3() {
        let r = [1, 2, 3, 4, 5, 6, 7, 8]
        let s = [1, 2, 5, 3, 4, 6, 7, 8] // 2
        let t = [1, 2, 5, 3, 7, 4, 6, 8] // 4
        let u = [1, 2, 5, 3, 7, 8, 4, 6] // 6
        let v = [1, 2, 5, 3, 7, 8, 6, 4] // 7
        
        let q = [1, 2, 5, 3, 7, 8, 6, 4]
        let res: String = sut.minimumBribesString(q: q)
        
        XCTAssertEqual(res, "7")
    }
}
