//
//  MaxSustainableClusterSize.swift
//  AlgorithmExerciseTests
//
//  Created by Anno Musa on 17/04/22.
//

import Foundation
import XCTest

private func maxSustainableClusterSize(
    bootingPower: [Int],
    processingPower: [Int],
    maxPower: Int
) -> Int {
    let n = bootingPower.count
    var maxCluster: Int = 0
    var arr: [Int] = []
    
    var startIdx: Int = 0
    var currWindowSum = 0
    
    for endIndex in 0..<n {
        
        while !arr.isEmpty, bootingPower[arr.last!] <= bootingPower[endIndex] {
            arr.removeLast()
        }
        
        arr.append(endIndex)
        
        currWindowSum += processingPower[endIndex]
        
        var currWindowMax = bootingPower[arr.first!]
        
        var currWindowSize = endIndex - startIdx + 1
        var currPower = currWindowMax + (currWindowSum * currWindowSize)
        
        if currPower <= maxPower {
            maxCluster = currWindowSize
        } else {
            currWindowSum -= processingPower[startIdx]
            if !arr.isEmpty, arr.first! == startIdx {
                arr.removeFirst()
            }
            startIdx += 1
        }
    }
    
    return maxCluster
}

class MaxSustainableClusterSizeTests: XCTestCase {
    
    func test1() {
        
        XCTAssertEqual(
            maxSustainableClusterSize(
                bootingPower: [3,6,1,3,4],
                processingPower: [2,1,3,4,5],
                maxPower: 25
            ),
            3
        )
        
        XCTAssertEqual(
            maxSustainableClusterSize(
                bootingPower: [8,8,10,9,2],
                processingPower: [4,1,4,5,3],
                maxPower: 33
            ),
            2
        )
        
        XCTAssertEqual(
            maxSustainableClusterSize(
                bootingPower: [11,12,19],
                processingPower: [10,8,7],
                maxPower: 6
            ),
            0
        )
    }
    
}
