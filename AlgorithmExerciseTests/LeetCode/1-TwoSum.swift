//
//  TwoSumTests.swift
//  LeetCodeTests
//
//  Created by Anno Musa on 03/05/21.
//

import Foundation
import XCTest

final class TwoSum {
    
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        
        for (index, val) in nums.enumerated() {
            let pair = target - val
            
            if let res = nums.firstIndex(of: pair), res != index {
                return [index, res]
            }
        }
        
        return []
    }
    
}

final class TwoSumTests: XCTestCase {
    
    var sut: TwoSum!
    
    override func setUp() {
        sut = TwoSum()
    }
    
    func test_twoSum() {
        let res = sut.twoSum([2,7,11,15], 9)
        
        XCTAssertEqual(res, [0,1])
    }
    
}
