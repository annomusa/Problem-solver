//
//  SalesByMatchTests.swift
//  LeetCodeTests
//
//  Created by Anno Musa on 23/05/21.
//

import Foundation
import XCTest
@testable import AlgorithmExercise

class SalesByMatch {
    func sockMerchant(n: Int, ar: [Int]) -> Int {
        
        var pairs: Int = 0
        var sockDictionary: [Int: Bool] = [:]
        for i in 0..<n {
            let current = ar[i]
            if let isExist = sockDictionary[current] {
                pairs += 1
                sockDictionary.removeValue(forKey: current)
            } else {
                sockDictionary[current] = true
            }
        }
        
        return pairs
    }
}


class SalesByMatchTests: XCTestCase {
    
    var sut: SalesByMatch!
    
    override func setUp() {
        sut = SalesByMatch()
    }
    
    func testExample1() {
        let result = sut.sockMerchant(n: 7, ar: [1,2,1,2,1,3,2])
        
        XCTAssertEqual(result, 2)
    }
    
    func testExample2() {
        let result = sut.sockMerchant(
            n: 9,
            ar: [10, 20, 20, 10, 10, 30, 50, 10, 20]
        )
        
        XCTAssertEqual(result, 3)
    }
}
