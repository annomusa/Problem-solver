//
//  765-couples-holding-hands.swift
//  AlgorithmExerciseTests
//
//  Created by Anno Musa on 20/04/22.
//

import Foundation
import XCTest

private class Solution {
    func minSwapsCouples(_ row: [Int]) -> Int {
        var row = row
        var res = 0
        
        for i in stride(from: 0, to: row.count, by: 2) {
            
            let x = row[i]
            let bit = x ^ 1
            
            if row[i+1] == bit {
                continue
            }
            
            for j in i+1 ..< row.count {
                if row[j] == bit {
                    row[j] = row[i + 1]
                    row[i + 1] = bit
                    break
                }
            }
        }
        
        return res
    }
}

class CouplesHoldingHandsTests: XCTestCase {
    
    func xtest1() {
        
        let sut = Solution()
        
        XCTAssertEqual(sut.minSwapsCouples([0,2,1,3]), 1)
        
        XCTAssertEqual(sut.minSwapsCouples([3,2,0,1]), 0)
        
    }
    
}
