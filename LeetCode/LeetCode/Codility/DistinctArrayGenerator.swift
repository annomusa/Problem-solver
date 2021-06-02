//
//  DistinctArrayGenerator.swift
//  LeetCode
//
//  Created by Anno Musa on 21/05/21.
//

import Foundation

class DistinctArrayGenerator {
    
    func solution(_ N : Int) -> [Int] {
        guard N != 0, N != 1 else { return [0] }
        
        var res: [Int] = []
        
        if N % 2 == 0 {
            let half = N / 2
            for i in 1...half {
                res.append(-i)
            }
            for i in 1...half {
                res.append(i)
            }
        } else {
            let half = N / 2
            for i in 1...half {
                res.append(-i)
            }
            res.append(0)
            for i in 1...half {
                res.append(i)
            }
        }
        
        return res
    }
    
}
