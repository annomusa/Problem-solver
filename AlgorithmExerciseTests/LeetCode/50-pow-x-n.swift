//
//  50-pow-x-n.swift
//  AlgorithmExerciseTests
//
//  Created by Anno Musa on 08/04/22.
//

import Foundation
import XCTest

private class Solution {
    func myPow(_ x: Double, _ n: Int) -> Double {
        let exp = abs(n)
        
        var result: Double = 1
        
        for i in 0..<exp {
            result = result * x
        }
        
        if n < 0 {
            return 1/result
        }
        
        return result
    }
}

private class Solution2 {
    func myPow(_ x: Double, _ n: Int) -> Double {
        let exp = abs(n)
        var num = x
        if n < 0 {
            num = 1 / x
        }
        return fastPow(num, exp)
    }
    
    private func fastPow(_ x: Double, _ n: Int) -> Double {
        guard n != 0 else { return 1 }
        
        let half = fastPow(x, n/2)
        if n % 2 == 0 {
            return half * half
        } else {
            return half * half * x
        }
    }
}

class PowXNTests: XCTestCase {
    
    func test1() {
        let sut = Solution2()
        
        XCTAssertEqual(sut.myPow(2.0000, 10), 1024)
        XCTAssertEqual(sut.myPow(2.1000, 3), 9.261000000000001)
        XCTAssertEqual(sut.myPow(2.0000, -2), 0.25)
    }
    
}
