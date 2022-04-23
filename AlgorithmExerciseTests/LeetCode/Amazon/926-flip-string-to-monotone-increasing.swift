//
//  926-flip-string-to-monotone-increasing.swift
//  AlgorithmExerciseTests
//
//  Created by Anno Musa on 16/04/22.
//

import Foundation
import XCTest

private class Solution {
    func minFlipsMonoIncr(_ s: String) -> Int {
        
        let n = s.count
        let chars = Array(s)
        var prefixSum: [Int] = Array(repeating: 0, count: s.count + 1)
        
        for i in 0..<n {
            prefixSum[i+1] = prefixSum[i] + (chars[i] == "1" ? 1 : 0)
        }
        
        var res: Int = .max
        for i in 0...n {
            res = min(
                res,
                prefixSum[i] + (n - i) - (prefixSum[n] - prefixSum[i])
            )
        }
        
        return res
    }
    
    private func ansFor(prefixSum: [Int], count: Int, idx: Int) -> Int {
        return prefixSum[idx] + count - idx - (prefixSum[count] - prefixSum[idx])
    }
}

class FlipStringToMonotoneIncreasingTests: XCTestCase {
    
    func test1() {
        var sut = Solution()
        
        XCTAssertEqual(sut.minFlipsMonoIncr("00110"), 1)
        
        XCTAssertEqual(sut.minFlipsMonoIncr("010110"), 2)
        
        XCTAssertEqual(sut.minFlipsMonoIncr("00011000"), 2)
        
//        XCTAssertEqual(sut.minFlipsMonoIncr("00110"), 1)
    }
    
}
