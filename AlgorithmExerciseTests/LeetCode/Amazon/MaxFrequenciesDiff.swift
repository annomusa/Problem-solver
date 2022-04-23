//
//  Random1.swift
//  AlgorithmExerciseTests
//
//  Created by Anno Musa on 16/04/22.
//
// https://leetcode.com/discuss/interview-question/1947476/Amazon-or-OA-or-USA

import Foundation
import XCTest

private func maximumFrequencyDifference(_ str: String) -> Int {
    var res = 0
    var str = Array(str)
    let n = str.count
    
    for i in 0..<n {
        
        for j in (i+1..<n).reversed() {
            
            var temp = Array(str[i...j])
            
            var dict: [Character: Int] = [:]
            
            for k in 0..<temp.count {
                dict[temp[k], default: 0] += 1
            }
            
            var minVal = dict.min(by: { $0.value < $1.value })
            var maxVal = dict.max(by: { $0.value < $1.value })
            
            res = max(res, (maxVal?.value ?? 0) - (minVal?.value ?? 0))
            
        }
        
    }
    
    return res
}

class MaxFrequenciesDiffTests: XCTestCase {
    
    func test1() {
        
        XCTAssertEqual(
            maximumFrequencyDifference("aab"),
            1
        )
        
        XCTAssertEqual(
            maximumFrequencyDifference("aabbbcacba"),
            3
        )
        
    }
    
}

/*
 aabbbcacba
 
 aa 2-2 0 0
 aab 2-1 1 1
 aabb 2-2 0 1
 aabbb 3-2 0 1
 aabbbc 3-1 2 2
 aabbbca 3-1 2 2
 aabbbcac 3-1 2 2
 aabbbcacb 4-2 2 2
 aabbbcacba 4-2 2 2
 
 ab 1-1 0 2
 abb 2-1 1 2
 abbb 3-1 2 2
 abbbc 3-1 2 2
 abbbca 3-1 2 2
 abbbcac 3-2 1 2
 
 bb 1-1 0 2
 bbb 3-3 0 2
 bbbc 3-1 2 2
 bbbca 3-1 2 2
 bbbcac 3-1 2 2
 bbbcacb 4-1 3 3
 */
