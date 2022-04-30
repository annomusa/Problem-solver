//
//  91-decode-ways.swift
//  AlgorithmExerciseTests
//
//  Created by Anno Musa on 26/04/22.
//

import Foundation
import XCTest

private extension Int {
    init?(str: String) {
        if Array(str)[0] == "0" {
            return nil
        }
        
        self.init(str)
    }
}

private class Solution {
    // 2206 -> 2,2,6 / 2,2
    func numDecodings(_ s: String) -> Int {
        var s = Array(s)
        
        var res = 0
        
        var cumulativeSum: [Int] = Array(repeating: 0, count: s.count+1)
        cumulativeSum[0] = 1
        
        // 1 1 0 0 0 0 0 0 
        cumulativeSum[1] = s[0] == "0" ? 0 : 1
        
        for i in 2..<cumulativeSum.count {
            
            if s[i-1] != "0" {
                cumulativeSum[i] = cumulativeSum[i-1]
            }
            
            let doubleStr: String = "\(s[i-2])\(s[i-1])"
            if let letterIdx = Int(str: doubleStr), letterIdx <= 26 {
                cumulativeSum[i] += cumulativeSum[i - 2]
                // 12 -> 1 1 2
                // 226 -> 1 1 2 2
            }
        }
        
        return cumulativeSum.last!
    }
}

class DecodeWaysTests: XCTestCase {
    
    func test1() {
        
        var sut = Solution()
        
        
        XCTAssertEqual(sut.numDecodings("12"), 2)
        
        XCTAssertEqual(sut.numDecodings("226"), 3)
        
        XCTAssertEqual(sut.numDecodings("06"), 0)
        
    }
    
}
