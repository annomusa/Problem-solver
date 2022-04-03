//
//  ProductSum.swift
//  AlgorithmExerciseTests
//
//  Created by Anno Musa on 02/04/22.
//

import Foundation
import XCTest

private class Program {
    // Tip: You can cast each element with `as? [Any]` to check whether it is
    // an array or an integer.
    func productSum(_ array: [Any]) -> Int {
        
        return productSum(level: 1, array: array)
    }
    
    private func productSum(level: Int, array: [Any]) -> Int {
        
        var res = 0
        
        for i in array {
            
            if let i = i as? Int {
                res += i
            } else if let i = i as? [Any] {
                res += productSum(level: level + 1, array: i)
            }
            
        }
        res *= level
        return res
    }
}

class ProductSumTests: XCTestCase {
    
    func test1() {
        let sut = Program()
        
        let res = sut.productSum(
            [5, 2, [7, -1], 3, [6, [-13, 8], 4]]
        )
        
        XCTAssertEqual(res, 12)
    }
    
}
