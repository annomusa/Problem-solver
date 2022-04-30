//
//  1249-minimum-remove-to-make-valid-parentheses.swift
//  AlgorithmExerciseTests
//
//  Created by Anno Musa on 26/04/22.
//

import Foundation
import XCTest

private class Solution {
    func minRemoveToMakeValid(_ s: String) -> String {
        var res = ""
        var s = Array(s)
        
        var idxsToRemove = Set<Int>()
        var stack: [Int] = []
        
        for i in 0..<s.count {
            if s[i] == "(" {
                stack.append(i)
            } else if s[i] == ")" {
                if stack.isEmpty {
                    idxsToRemove.insert(i)
                } else {
                    stack.popLast()
                }
            }
        }
        
        while let pop = stack.popLast() {
            idxsToRemove.insert(pop)
        }
        
        for i in 0..<s.count {
            if !idxsToRemove.contains(i) {
                res.append(s[i])
            }
        }
        
        return res
    }
}

class MinimumRemoveToMakeValidParenthesesTests: XCTestCase {
    
    func test1() {
        
        var sut = Solution()
        
        XCTAssertEqual(sut.minRemoveToMakeValid("lee(t(c)o)de)"), "lee(t(c)o)de")
        
        XCTAssertEqual(sut.minRemoveToMakeValid("a)b(c)d"), "ab(c)d")
        
        XCTAssertEqual(sut.minRemoveToMakeValid("))(("), "")
    }
    
}
