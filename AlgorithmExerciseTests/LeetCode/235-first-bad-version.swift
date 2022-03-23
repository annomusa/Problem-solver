//
//  235-first-bad-version.swift
//  LeetCodeTests
//
//  Created by Anno Musa on 10/02/22.
//

import Foundation

/**
 * The knows API is defined in the parent class VersionControl.
 *     func isBadVersion(_ version: Int) -> Bool{}
 */

let isFirstBadVersion = 7

func isBadVersion(_ v: Int) -> Bool {
    isFirstBadVersion <= v
}

private class Solution {
    func firstBadVersion(_ n: Int) -> Int {
        var left = 1
        var right = n
        
        while left < right {
            let mid = left + (right - left) / 2
            if isBadVersion(mid) {
                right = mid
            } else {
                left = mid + 1
            }
        }
        return left
    }
}

import XCTest

class FirstBadVersionTest: XCTestCase {
    
    private var sut: Solution = Solution()
    
    func test_1() {
        XCTAssertEqual(sut.firstBadVersion(15), isFirstBadVersion)
    }
}
