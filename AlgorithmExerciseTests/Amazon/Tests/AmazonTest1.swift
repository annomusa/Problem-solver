//
//  AmazonTest1.swift
//  AlgorithmExerciseTests
//
//  Created by Anno Musa on 17/04/22.
//

import Foundation
import XCTest

private func maximumQuality(packets: [Int], channels: Int) -> Int {
    var maxQuality = 0
    
    let sortedPackets: [Int] = packets.sorted(by: >)
    
    let singlePacketCount = channels - 1
    
    for i in 0..<singlePacketCount {
        maxQuality += sortedPackets[i]
    }
    
    let multiplePackets = Array(sortedPackets[(channels-1)...])
    
    var medianMultiplePackets = multiplePackets[multiplePackets.count/2]
    if multiplePackets.count % 2 == 0 {
        var medIdx1 = multiplePackets.count / 2
        var medIdx2 = medIdx1 - 1
        var sum = Double(multiplePackets[medIdx1])
            + Double(multiplePackets[medIdx2])
        medianMultiplePackets = Int((sum / 2).rounded(.up))
    }
    
    maxQuality += medianMultiplePackets
    
    return maxQuality
}

class AmazonTest1: XCTestCase {
    
    func xtest1() {
        
        XCTAssertEqual(
            maximumQuality(packets: [1,2,3,4,5], channels: 2),
            8
        )
        
        XCTAssertEqual(
            maximumQuality(packets: [2, 2, 1, 5, 3], channels: 2),
            7
        )
        
        XCTAssertEqual(
            maximumQuality(packets: [89, 48, 14], channels: 3),
            151
        )
        
        XCTAssertEqual(
            maximumQuality(packets: [1], channels: 1),
            1
        )
    }
    
}
