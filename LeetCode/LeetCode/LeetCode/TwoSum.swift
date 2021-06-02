//
//  TwoSum.swift
//  LeetCode
//
//  Created by Anno Musa on 03/05/21.
//

import Foundation

final class TwoSum {
    
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        
        for (index, val) in nums.enumerated() {
            let pair = target - val
            
            if let res = nums.firstIndex(of: pair), res != index {
                return [index, res]
            }
        }
        
        return []
    }
    
}
