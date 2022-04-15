//
//  1209-remove-all-adjacent-duplicates-string-2.swift
//  AlgorithmExerciseTests
//
//  Created by Anno Musa on 08/04/22.
//

import Foundation
import XCTest

private class Solution {
    func removeDuplicates(_ s: String, _ k: Int) -> String {
        var stack: [(char: String.Element, count: Int)] = []
        
        for c in s {
            
            if let last = stack.last, c == last.char {
                
                if last.count == k - 1 {
                    
                    var popLast: (char: String.Element, count: Int)? = last
                    while let pop = popLast, pop.char == c, pop.count > 0 {
                        stack.removeLast()
                        popLast = stack.last
                    }
                    
                } else {
                    
                    stack.append((char: c, count: last.count + 1))
                    
                }
                
            } else {
                
                stack.append((char: c, count: 1))
                
            }
            
        }
        
        return String(stack.map { $0.char })
    }
}

class RemoveAllAdjacentDuplicateString2Tests: XCTestCase {
    
    private let sut = Solution()
    
    func test1() {
        XCTAssertEqual(sut.removeDuplicates("abcd", 2), "abcd")
        XCTAssertEqual(sut.removeDuplicates("deeedbbcccbdaa", 3), "aa")
        XCTAssertEqual(sut.removeDuplicates("pbbcggttciiippooaais", 2), "ps")
    }
    
}
