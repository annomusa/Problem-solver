//
//  PlusOperator.swift
//  LeetCode
//
//  Created by Anno Musa on 26/05/21.
//

import Foundation

extension Array {
    public static func plus(_ array1: [Int], _ array2: [Int]) -> [Int] {
        guard !array1.isEmpty else { return array2.map { abs($0) } }
        guard !array2.isEmpty else { return array1.map { abs($0) } }
        
        let isArray1Shorter: Bool = array1.count < array2.count
        let isSameSize: Bool = array1.count == array2.count
        let min = (isArray1Shorter) ? array1.count : array2.count
        
        var res: [Int] = []
        for i in 0..<min {
            res.append(
                abs(array1[i]) + abs(array2[i])
            )
        }
        
        if isSameSize {
            return res
        }
        
        if isArray1Shorter {
            res += Array<Int>(array2.dropFirst(min))
        } else {
            res += Array<Int>(array1.dropFirst(min))
        }
        
        return res
    }
}
