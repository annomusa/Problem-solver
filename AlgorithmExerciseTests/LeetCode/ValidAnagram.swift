//
//  ValidAnagram.swift
//  AlgorithmExerciseTests
//
//  Created by Anno Musa on 19/04/22.
//

import Foundation
import XCTest

private class Solution {
    func isAnagram(_ s: String, _ t: String) -> Bool {
        
        var dict: [Character: Int] = [:]
        
        for c in s {
            dict[c, default: 0] += 1
        }
        
        for c in t {
            
            if let count = dict[c] {
                if count - 1 < 1 {
                    dict[c] = nil
                } else {
                    dict[c] = count - 1
                }
            } else {
                return false
            }
        }
        
        return dict.isEmpty
    }
}

class ValidAnagramTests: XCTestCase {
    
    func test1() {
        
        let sut = Solution()
        
        XCTAssertTrue(sut.isAnagram("anagram", "nagaram"))
        
        XCTAssertFalse(sut.isAnagram("rat", "car"))
        
    }
    
}
