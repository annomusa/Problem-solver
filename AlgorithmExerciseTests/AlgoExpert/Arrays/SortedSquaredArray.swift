//
//  SortedSquaredArray.swift
//  AlgorithmExerciseTests
//
//  Created by Anno Musa on 02/04/22.
//

import Foundation
import XCTest

private class Program {
    func sortedSquaredArray(_ array: [Int]) -> [Int] {
        // Write your code here.
        return array.map { val in
            val * val
        }.sorted()
    }
}

class SortedSquaredArray: XCTestCase {
    
    func test1() {
        let sut = Program()
        
        let res = sut.sortedSquaredArray([1,2,3,5,6,8,9])
        
        
    }
    
}
