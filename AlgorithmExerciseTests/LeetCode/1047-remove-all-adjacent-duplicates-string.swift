//
//  1047-remove-all-adjacent-duplicates-string.swift
//  AlgorithmExerciseTests
//
//  Created by Anno Musa on 08/04/22.
//

import Foundation
import XCTest

private class Solution {
    func removeDuplicates(_ s: String) -> String {
        var stack: [String.Element] = []
        
        for i in s.enumerated() {
            guard stack.last == i.element else { stack.append(i.element); continue }
            
            stack.popLast()
            while stack.last == i.element {
                stack.popLast()
            }
        }
        
        return String(stack)
    }
}

class RemoveAllAdjacentDuplicateStringTests: XCTestCase {
    private let sut = Solution()
    
    func test1() {
        XCTAssertEqual(sut.removeDuplicates("abbaca"), "ca")
        XCTAssertEqual(sut.removeDuplicates("azxxzy"), "ay")
        XCTAssertEqual(sut.removeDuplicates("aabbaca"), "aca")
    }
}
