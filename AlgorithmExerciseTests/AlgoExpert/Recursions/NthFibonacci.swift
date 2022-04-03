//
//  NthFibonacci.swift
//  AlgorithmExerciseTests
//
//  Created by Anno Musa on 02/04/22.
//

import Foundation
import XCTest

private class Program {
    func getNthFib(n: Int) -> Int {
        guard n > 1 else {
            return 0
        }
        
        guard n > 2 else {
            return 1
        }
        
        return getNthFib(n: n - 1) + getNthFib(n: n - 2)
    }
}

class NthFibonacciTests: XCTestCase {
    
    func test1() {
        
        let sut = Program()
        
        let res = sut.getNthFib(n: 6)
        
    }
    
}
