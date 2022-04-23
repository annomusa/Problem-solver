//
//  AmazonTest2.swift
//  AlgorithmExerciseTests
//
//  Created by Anno Musa on 17/04/22.
//
// https://leetcode.com/discuss/interview-question/1741735/Amazon-or-Hackerrank-OA-or-SDE-2-or-February-2022

import Foundation
import XCTest
import AlgorithmExercise

private func findTotalImbalance2(rank: [Int]) -> Int {
    let n = rank.count
    var totalImbalance: Int = 0
    
    var groups: [[Int]] = []
    
    for i in 0..<n {
        
        for j in i..<n {
            
            groups.append(Array(rank[i...j]).sorted())
            
        }
        
    }
    
    for g in groups {
        for x in 1..<g.count {
            
            if g[x] - g[x-1] > 1 {
                totalImbalance += 1
                break
            }
            
        }
    }
    
    return totalImbalance
}

private func findTotalImbalance(rank: [Int]) -> Int {
    let n = rank.count
    
    var totalImbalance: Int = 0
    
    var minDp: [Int] = Array(repeating: -1, count: n)
    var maxDp: [Int] = Array(repeating: n, count: n)
    
    var dict: [Int: Int] = [:]
    
    for i in 0..<n {
        if let val = dict[rank[i]+1] {
            minDp[i] = val
        }
        dict[rank[i]] = i
    }
    
    dict.removeAll()
    for i in (0..<n-1).reversed() {
        if let val = dict[rank[i]+1] {
            maxDp[i] = val
        }
        dict[rank[i]] = i
    }
    
    for i in 0..<n {
        var start = i-minDp[i]
        var end = maxDp[i]-1
        var j = i
        var k = i
        while j>minDp[i], rank[j] <= rank[i] {
            j -= 1
        }
        while k<maxDp[i], rank[k] <= rank[i] {
            k += 1
        }
        var max = start * end
        var min = (i-j)*(k-1)
        totalImbalance += max-min
    }
    
    return totalImbalance
}

class AmazonTest2: XCTestCase {
    
    func test1() {
        
        XCTAssertEqual(
            findTotalImbalance2(rank: [4, 1, 3, 2]),
            3
        )
        
        XCTAssertEqual(
            findTotalImbalance2(rank: [1, 2]),
            0
        )
    }
    
}
