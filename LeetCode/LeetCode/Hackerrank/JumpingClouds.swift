//
//  JumpingClouds.swift
//  LeetCode
//
//  Created by Anno Musa on 23/05/21.
//

import Foundation

class JumpingClouds {
    func jumpingOnClouds(c: [Int]) -> Int {
        var totalJumps: Int = 0
        var totalClouds: Int = c.count
        var currentCloudIndex: Int = 0
        
        while currentCloudIndex < (totalClouds - 1) {
            
            // check +2
            if let check2 = c[safe: currentCloudIndex + 2], check2 == 0 {
                totalJumps += 1
                currentCloudIndex += 2
            } else {
                totalJumps += 1
                currentCloudIndex += 1
            }
            
        }
        
        return totalJumps
    }
}

