//
//  ReverseString.swift
//  LeetCode
//
//  Created by Anno Musa on 02/05/21.
//

import Foundation

class ReverseStringSolution {
    
    /// Reverse
    /// H e l l o
    /// o l l e H
    ///
    /// H e l l o
    ///
    /// - Parameter s:
    func reverseString(_ s: inout [Character]) {
        swap(s: &s, start: 0, end: s.count - 1)
    }
    
    private func swap(s: inout [Character], start: Int, end: Int) {
        guard start < end else { return }
        
//        log(s, start, end)
        
        let temp: Character = s[start]
        s[start] = s[end]
        s[end] = temp
        
        let newStart = start + 1
        let newEnd = end - 1
        
//        log(newStart, newEnd)
        
        swap(s: &s, start: newStart, end: newEnd)
    }
}
