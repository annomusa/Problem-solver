//
//  IdealDay.swift
//  AlgorithmExerciseTests
//
//  Created by Anno Musa on 15/04/22.
//

import Foundation
import XCTest

// https://leetcode.com/discuss/interview-question/1482144/Amazon-Online-Assessment-September-2021

private extension Collection {
    subscript(safe idx: Index) -> Element? {
        return indices.contains(idx) ? self[idx] : nil
    }
}

private class Solution {
    func ideal(days: [Int], k: Int) -> [Int] {
        
        var res: [Int] = []
        
        for day in days.enumerated() {
            
            var isIdeal = true
            for i in 1...k {
                guard let left = days[safe: day.offset - i], let right = days[safe: day.offset + i] else {
                    isIdeal = false
                    break
                }
                
                if left < day.element || day.element > right {
                    isIdeal = false
                    break
                }
            }
            if isIdeal {
                res.append(day.offset + 1)
            }
        }
        
        return res
    }
}

class IdealDayTests: XCTestCase {
    
    func test1() {
        
        let sut = Solution()
        
        XCTAssertEqual(sut.ideal(days: [3,2,2,2,3,4], k: 2), [3,4])
        
        XCTAssertEqual(sut.ideal(days: [1,0,1,0,1], k: 1), [2,4])
        
        XCTAssertEqual(sut.ideal(days: [1,0,0,0,1], k: 2), [3])
        
        XCTAssertEqual(sut.ideal(days: [1,1,1,1,1,1,1,1,1,1], k: 3), [4,5,6,7])
        
    }
    
}

private class Solution2 {
    
}

