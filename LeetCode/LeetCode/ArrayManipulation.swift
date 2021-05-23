//
//  ArrayManipulation.swift
//  LeetCode
//
//  Created by Anno Musa on 23/05/21.
//

import Foundation

class ArrayManipulation {
    func arrayManipulation(n: Int, queries: [[Int]]) -> Int {
        var slopes: [Int] = [Int](repeating: 0, count: n+1)
        
        for i in 0..<queries.count {
            let row = queries[i]
            let a = row[0]
            let b = row[1]
            let k = row[2]
            slopes[a] += k
            if b+1 <= n {
                slopes[b+1] -= k
            }
        }
//        print("manipulation \(slopes)")
        
        var max = 0
        var current = 0
        
        for i in 1...n {
            current += slopes[i]
            max = (max < current) ? current : max
//            print("manipulation current \(curr ent)")
        }
        
        return max//slopes.scan(initial: 0, +).max()!
    }
}
