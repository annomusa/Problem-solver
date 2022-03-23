//
//  ArrayManipulationTests.swift
//  LeetCodeTests
//
//  Created by Anno Musa on 23/05/21.
//

import Foundation
import XCTest
@testable import AlgorithmExercise

class ArrayManipulation {
    func arrayManipulation(n: Int, queries: [[Int]]) -> Int {
        var slopes: [Int] = [Int](repeating: 0, count: n+1)
        
        for i in 0..<queries.count {
            let row = queries[i]
            let a = row[0]
            let b = row[1]
            let k = row[2]
            slopes[a] += k
            if b+1 <= n {
                slopes[b+1] -= k
            }
        }
//        print("manipulation \(slopes)")
        
        var max = 0
        var current = 0
        
        for i in 1...n {
            current += slopes[i]
            max = (max < current) ? current : max
//            print("manipulation current \(curr ent)")
        }
        
        return max//slopes.scan(initial: 0, +).max()!
    }
}

class ArrayManipulationTests: XCTestCase {
    
    var sut: ArrayManipulation!
    
    override func setUp() {
        sut = ArrayManipulation()
    }
    
    func testExample1() {
        let res = sut.arrayManipulation(n: 10, queries: [[1,5,3],[4,8,7],[6,9,1]])
        
        XCTAssertEqual(res, 10)
    }
    
    func testExample2() {
        let res = sut.arrayManipulation(n: 5, queries: [[1,2,100],[2,5,100],[3,4,100]])
        
        XCTAssertEqual(res, 200)
    }
}
