//
//  20-valid-parentheses.swift
//  AlgorithmExerciseTests
//
//  Created by Anno Musa on 19/04/22.
//

import Foundation
import XCTest

private class Solution {
    func isValid(_ s: String) -> Bool {
        
        var stack: [Character] = []
        for c in s {
            
            if c == "(" || c == "{" || c == "[" {
                stack.append(c)
            } else if let last = stack.popLast() {
                if c == ")" && last == "(" {
                    continue
                } else if c == "}" && last == "{" {
                    continue
                } else if c == "]" && last == "[" {
                    continue
                } else {
                    return false
                }
            } else {
                return false
            }
            
        }
        
        return stack.isEmpty
    }
}

class ValidParenthesesTests: XCTestCase {
    
    func test1() {
        
        let sut = Solution()
        
        XCTAssertTrue(sut.isValid("()"))
        
        XCTAssertTrue(sut.isValid("()[]{}"))
        
        XCTAssertFalse(sut.isValid("(]"))
        
    }
    
}
