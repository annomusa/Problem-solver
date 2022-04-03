//
//  Powerset.swift
//  AlgorithmExerciseTests
//
//  Created by Anno Musa on 02/04/22.
//

import Foundation
import XCTest

private class Program {
    func powerset(array: [Int], index: Int? = nil) -> [[Int]] {
        var index = index ?? array.count - 1
        
        if index < 0 {
            return [[]]
        }
        
        let element = array[index]
        var subsets = powerset(array: array, index: index - 1)
        
        for subset in subsets {
            subsets.append(subset + [element])
        }
        
        return subsets
    }
}


class PowersetTests: XCTestCase {
    
    func test1() {
        
        let sut = Program()
        
        var res = sut.powerset(array: [1,2,3])
        
    }
    
}
