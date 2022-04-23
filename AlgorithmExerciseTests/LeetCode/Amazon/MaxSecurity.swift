//
//  MaxSecurity.swift
//  AlgorithmExerciseTests
//
//  Created by Anno Musa on 16/04/22.
//
// https://www.chegg.com/homework-help/questions-and-answers/order-ensure-maximum-security-developers-xyz-employ-multiple-encryption-methods-keep-user--q95120166

import Foundation
import XCTest

private func getEncryptedNumber(_ nums: [Int]) -> String {
    
    var nums = nums
    while nums.count > 2 {
        nums = recurse(nums)
    }
    
    var first = String(nums[0]).last!
    var sec = String(nums[1]).last!
    var int = Int("\(first)\(sec)")
    var str = String(int!)
    return str
}

private func recurse(_ nums: [Int]) -> [Int] {
    var res: [Int] = []
    for idx in 1..<nums.count {
        var temp = String(nums[idx-1] + nums[idx]).last!
        res.append(Int("\(temp)")!)
    }
    return res
}

class MaxSecurityTests: XCTestCase {
    
    func test1() {
        
        XCTAssertEqual(
            getEncryptedNumber([1,2,3,4]),
            "82"
        )
        
        XCTAssertEqual(
            getEncryptedNumber([4,5,6,7]),
            "4"
        )
        
    }
    
}
