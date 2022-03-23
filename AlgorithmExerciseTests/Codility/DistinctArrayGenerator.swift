//
//  DistinctArrayGeneratorTests.swift
//  LeetCodeTests
//
//  Created by Anno Musa on 21/05/21.
//

import Foundation
import XCTest
@testable import AlgorithmExercise

class DistinctArrayGenerator {
    
    func solution(_ N : Int) -> [Int] {
        guard N != 0, N != 1 else { return [0] }
        
        var res: [Int] = []
        
        if N % 2 == 0 {
            let half = N / 2
            for i in 1...half {
                res.append(-i)
            }
            for i in 1...half {
                res.append(i)
            }
        } else {
            let half = N / 2
            for i in 1...half {
                res.append(-i)
            }
            res.append(0)
            for i in 1...half {
                res.append(i)
            }
        }
        
        return res
    }
    
}

class DistinctArrayGeneratorTests: XCTestCase {
    
    var sut: DistinctArrayGenerator!
    
    override func setUp() {
        sut = DistinctArrayGenerator()
    }
    
    func testExample1() {
        let res = sut.solution(1)
        
        var sum: Int = 0
        for i in res {
            sum += i
        }
        
        XCTAssertEqual(sum, 0)
    }
    
    func testExample2() {
        let res = sut.solution(2)
        
        var sum: Int = 0
        for i in res {
            sum += i
        }
        
        XCTAssertEqual(sum, 0)
    }
    
    func testExample3() {
        let res = sut.solution(3)
        
        var sum: Int = 0
        for i in res {
            sum += i
        }
        
        XCTAssertEqual(sum, 0)
    }
    
    func testExample4() {
        let res = sut.solution(4)
        
        var sum: Int = 0
        for i in res {
            sum += i
        }
        
        XCTAssertEqual(sum, 0)
    }
    
    func testExample5() {
        let res = sut.solution(5)
        
        var sum: Int = 0
        for i in res {
            sum += i
        }
        
        XCTAssertEqual(sum, 0)
    }
    
    func testExample6() {
        let res = sut.solution(6)
        
        var sum: Int = 0
        for i in res {
            sum += i
        }
        
        XCTAssertEqual(sum, 0)
    }
}
