//
//  56-merge-intervals.swift
//  AlgorithmExerciseTests
//
//  Created by Anno Musa on 27/04/22.
//

import Foundation
import XCTest
@testable import AlgorithmExercise

private class Solution {
    func merge(_ intervals: [[Int]]) -> [[Int]] {
        
        var intervals = intervals.sorted { first, second in
            first[0] < second[0]
        }
        
        var merged: [[Int]] = [intervals[0]]
        for i in 1..<intervals.count {
            
            let mergedLastIdx = merged.count - 1
            let prev = merged[mergedLastIdx]
            let curr = intervals[i]
            
            if prev[1] >= curr[0] {
                merged[mergedLastIdx][1] = max(curr[1], prev[1])
            } else {
                merged.append(curr)
            }
            
        }
        
        return merged
    }
}

class MergeIntervalsTests: XCTestCase {
    
    func test1() {
        
        var sut = Solution()
        
        XCTAssertEqual(sut.merge([[1,3],[2,6],[8,10],[15,18]]), [[1,6],[8,10],[15,18]])
        
        XCTAssertEqual(sut.merge([[1,4],[4,5]]), [[1,5]])
        
        XCTAssertEqual(sut.merge([[1,3],[2,6],[6,10],[15,18]]), [[1,10],[15,18]])
        
        XCTAssertEqual(sut.merge([[1,4],[2,3]]), [[1,4]])
    }
    
}
