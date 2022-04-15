//
//  784-letter-case-permutation.swift
//  AlgorithmExerciseTests
//
//  Created by Anno Musa on 14/04/22.
//

import Foundation
import XCTest

private class Solution {
    func letterCasePermutation(_ s: String) -> [String] {
        guard s.count > 0 else { return [] }
        
        let s = Array(s)
        
        guard s.count > 1 else {
            
            if let num = Int("\(s[0])") {
                return ["\(num)"]
            } else {
                return [String(s[0]).lowercased(), String(s[0].uppercased())]
            }
            
        }
        
        var curIndex = 0
        var char = String(s[curIndex])
        var nextString = String(s[s.index(s.startIndex, offsetBy: 1)...])
        
        let nextPerms = letterCasePermutation(nextString)
        
        var res: [String] = []
        if let num = Int(char) {
            for nextPerm in nextPerms {
                res.append("\(num)\(nextPerm)")
            }
        } else {
            for nextPerm in nextPerms {
                res.append("\(char.lowercased())\(nextPerm)")
                res.append("\(char.uppercased())\(nextPerm)")
            }
        }
        
        return res
    }
}

class LetterCasePermutationTests: XCTestCase {
    
    func test1() {
        
        let sut = Solution()
        
        let res = sut.letterCasePermutation("a1b2")
        let res2 = sut.letterCasePermutation("C")
    }
    
}
