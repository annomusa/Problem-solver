//
//  394-decode-string.swift
//  AlgorithmExerciseTests
//
//  Created by Anno Musa on 14/04/22.
//

import Foundation

private extension StringProtocol {
    subscript(_ offset: Int) -> Element {
        self[index(startIndex, offsetBy: offset)]
    }
    
    var isNumber: Bool {
        return !isEmpty && rangeOfCharacter(from: CharacterSet.decimalDigits.inverted) == nil
    }
}

private class Solution {
    func decodeString(_ s: String) -> String {
        var index = 0
        return decodeString(s, &index)
    }
    
    private func decodeString(_ s: String, _ i: inout Int) -> String {
        var res = ""
        
        while i < (s.count) && s[i] != "]" {
            
            if !s[i].isNumber {
                
                res.append(s[i])
                i += 1
                
            } else {
                
                var k = 0
                
                while i < s.count && s[i].isNumber {
                    let num = Int("\(s[i])") ?? 0
                    k = k * 10 + num
                    i += 1
                }
                
                i += 1
                
                let decodedString = decodeString(s, &i)
                
                i += 1
                
                while k > 0 {
                    res.append(decodedString)
                    k -= 1
                }
            }
        }
        
        return res
    }
}
