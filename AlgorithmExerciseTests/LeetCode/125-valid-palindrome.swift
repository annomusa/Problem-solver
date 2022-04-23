//
//  125-valid-palindrome.swift
//  AlgorithmExerciseTests
//
//  Created by Anno Musa on 19/04/22.
//

import Foundation
import XCTest

private class Solution {
    func isPalindrome(_ s: String) -> Bool {
        var s = Array(String(s.unicodeScalars.filter(CharacterSet.alphanumerics.contains)))
        
        var res = true
        
        var p1 = 0
        var p2 = s.count - 1
        
        while p1 < p2 {
            
            guard s[p1].lowercased() == s[p2].lowercased() else {
                res = false
                break
            }
            
            p1 += 1
            p2 -= 1
        }
        
        return res
    }
}

class ValidPalindromeTests: XCTestCase {
    
    func test1() {
        
        let sut = Solution()
        
        XCTAssertFalse(sut.isPalindrome("0P"))
        
        XCTAssertTrue(sut.isPalindrome("A man, a plan, a canal: Panama"))
        
        XCTAssertFalse(sut.isPalindrome("race a car"))
        
        XCTAssertTrue(sut.isPalindrome(" "))
        
    }
    
    
}
