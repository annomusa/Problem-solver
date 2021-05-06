//
//  FirstLastPosition.swift
//  LeetCode
//
//  Created by Anno Musa on 03/05/21.
//

import Foundation

class FirstLastPosition {
    func searchRange(_ nums: [Int], _ target: Int) -> [Int] {
        log(nums, target)
        
        guard !nums.isEmpty else { return [-1, -1] }
        
        var startIndex: Int = -1
        var endIndex: Int = -1
        
        for (index, val) in nums.enumerated() {
            if val == target, startIndex == -1 {
                startIndex = index
                endIndex = index
            } else if val == target, startIndex != -1 {
                endIndex = index
            }
        }
        
        return [startIndex, endIndex]
    }
}
