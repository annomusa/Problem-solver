//
//  Demo2.swift
//  AlgorithmExerciseTests
//
//  Created by Anno Musa on 16/04/22.
//

import Foundation
import XCTest

private func countGroups(related: [String]) -> Int {
    var res = 0
    
    let n = related.count
    var flag: [Bool] = Array(repeating: false, count: related.count)
    
    for i in 0..<n {
        
        if flag[i] == false {
            recurse(related: related, flag: &flag, idx: i)
            res += 1
        }
        
    }
    
    return res
}

private func recurse(related: [String], flag: inout [Bool], idx: Int) {
    let n = related.count
    
    let currRow = Array(related[idx])
    
    for j in 0..<n {
        if currRow[j] == "1", flag[j] == false {
            flag[j] = true
            recurse(related: related, flag: &flag, idx: j)
        }
        
    }
}

class AmazonDemo2Tests: XCTestCase {
    
    func test1() {
        
        XCTAssertEqual(
            countGroups(related: ["1100",
                                  "1110",
                                  "0110",
                                  "0001"]),
            2
        )
        
        XCTAssertEqual(
            countGroups(related: ["10000",
                                  "01000",
                                  "00100",
                                  "00010",
                                  "00001"]),
            5
        )
        
        XCTAssertEqual(
            countGroups(related: ["10000",
                                  "01000",
                                  "00100",
                                  "00011",
                                  "00001"]),
            4
        )
        
        XCTAssertEqual(
            countGroups(related: ["10",
                                  "01"]),
            2
        )
        
        XCTAssertEqual(
            countGroups(related: ["11",
                                  "01"]),
            1
        )
        
        XCTAssertEqual(
            countGroups(related: ["11",
                                  "11"]),
            1
        )
        
    }
    
}
