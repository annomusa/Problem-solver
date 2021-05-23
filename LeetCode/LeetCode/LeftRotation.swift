//
//  LeftRotation.swift
//  LeetCode
//
//  Created by Anno Musa on 23/05/21.
//

import Foundation

class LeftRotation {
    
    func rotLeft(a: [Int], d: Int) -> [Int] {
        
        var mod = d % a.count
        
        var res: [Int] = Array(a.dropFirst(mod))
        res += Array(a.dropLast(a.count - d))
        
        return res
    }
    
}
