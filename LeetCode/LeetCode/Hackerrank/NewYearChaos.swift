//
//  NewYearChaos.swift
//  LeetCode
//
//  Created by Anno Musa on 23/05/21.
//

import Foundation

class NewYearChaos {
    
    func minimumBribes(q: [Int]) {
        print(minimumBribesString(q: q))
    }
    
    func minimumBribesString(q: [Int]) -> String {
        var bribesCount: Int = 0
        var expectedFirst = 1
        var expectedSecond = 2
        var expectedThird = 3
        
        for i in 0..<q.count {
            if q[i] == expectedFirst {
                expectedFirst = expectedSecond
                expectedSecond = expectedThird
                expectedThird += 1
            } else if q[i] == expectedSecond {
                bribesCount += 1
                expectedSecond = expectedThird
                expectedThird += 1
            } else if q[i] == expectedThird {
                bribesCount += 2
                expectedThird += 1
            } else {
                return "Too chaotic"
            }
        }
        return "\(bribesCount)"
    }
    
}
