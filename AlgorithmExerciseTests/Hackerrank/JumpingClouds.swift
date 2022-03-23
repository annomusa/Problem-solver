//
//  JumpingCloudsTests.swift
//  LeetCodeTests
//
//  Created by Anno Musa on 23/05/21.
//

import Foundation
import XCTest
@testable import AlgorithmExercise

class JumpingClouds {
    func jumpingOnClouds(c: [Int]) -> Int {
        var totalJumps: Int = 0
        var totalClouds: Int = c.count
        var currentCloudIndex: Int = 0
        
        while currentCloudIndex < (totalClouds - 1) {
            
            // check +2
            if let check2 = c[safe: currentCloudIndex + 2], check2 == 0 {
                totalJumps += 1
                currentCloudIndex += 2
            } else {
                totalJumps += 1
                currentCloudIndex += 1
            }
            
        }
        
        return totalJumps
    }
}

class JumpingCloudsTests: XCTestCase {
    
    var sut: JumpingClouds!
    
    override func setUp() {
        sut = JumpingClouds()
    }
    
    func testExample1() {
        let result = sut.jumpingOnClouds(c: [0,0,1,0,0,1,0])
        
        XCTAssertEqual(result, 4)
    }
    
    func testExample2() {
        let result = sut.jumpingOnClouds(c: [0,0,0,0,1,0])
        
        XCTAssertEqual(result, 3)
    }
    
    func testExample3() {
        let result = sut.jumpingOnClouds(c: [0,1,0,0,0,1,0])
        
        XCTAssertEqual(result, 3)
    }
}
