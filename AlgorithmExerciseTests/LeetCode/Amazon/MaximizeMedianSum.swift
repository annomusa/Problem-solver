//
//  MaximizeMedianSum.swift
//  AlgorithmExerciseTests
//
//  Created by Anno Musa on 17/04/22.
//
// https://leetcode.com/discuss/interview-question/1565781/Amazon-or-OA-or-maximize-the-median-sum/1142854

import Foundation
import XCTest

private func maximizeMedianSum(packets: [Int], channel: Int) -> Double {
    var res: Double = 0
    
    if channel == 1 {
        res = Double(packets.reduce(0, +))
        return res
    }
    
    var packets = packets.sorted(by: >)
    
    for i in 0..<channel-1 {
        res += Double(packets[i])
    }
    
    var medianTemp = Array(packets[(channel-1)...])
    
    var temp: Double = 0
    var medianTempSize = medianTemp.count
    if medianTempSize % 2 == 0 {
        temp = (Double(medianTemp[medianTempSize/2]) + Double(medianTemp[medianTempSize/2-1])) / 2
    } else {
        temp = Double(medianTemp[medianTempSize/2])
    }
    
    res += Double(temp)
    
    return res
}

class MaximizeMedianSumTests: XCTestCase {
    
    func test1() {
        
        XCTAssertEqual(
            maximizeMedianSum(packets: [1,2,3,2,1,5], channel: 3),
            9.5
        )
    }
    
}
