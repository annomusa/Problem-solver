//
//  NonConstructibleChange.swift
//  AlgorithmExerciseTests
//
//  Created by Anno Musa on 02/04/22.
//

import Foundation
import XCTest

private class Program {
    func nonConstructibleChange(_ coins: inout [Int]) -> Int {
        guard !coins.isEmpty else { return 1 }
        
        coins.sort()
        
        var result = 0
        
        for coin in coins {
            
            if coin > result + 1 {
//                print("result: y-\(result + 1) coin-\(coin)")
                return result + 1
            }
            result += coin
//            print("result: x-\(result)")
        }
        
        return result + 1
    }
}

class NonConstructibleChangeTests: XCTestCase {
    
    func test1() {
        let sut = Program()
        
        var arr = [5,7,1,1,2,3,22]
        let res = sut.nonConstructibleChange(&arr)
        
    }
    
}
