//
//  Permutations.swift
//  AlgorithmExerciseTests
//
//  Created by Anno Musa on 02/04/22.
//

import Foundation
import XCTest

private class Program {
    func permutations(array: inout [Int]) -> [[Int]] {
        guard !array.isEmpty else { return [] }
        return recurse(array: array)
    }
    
    private func recurse(array: [Int]) -> [[Int]] {
        if array.count <= 1 {
            return [array]
        }
        
        if array.count <= 2 {
            return [
                [array[0], array[1]],
                [array[1], array[0]]
            ]
        }
        
        var res: [[Int]] = []
        
        for i in 0..<array.count {
            
            var newArray = array
            var val = newArray.remove(at: i)
            var perm = recurse(array: newArray)
            
            for j in perm {
                var new = [val]
                new.append(contentsOf: j)
                res.append(new)
            }
            
        }
        
        return res
    }
}

class PermutationsTests: XCTestCase {
    
    func xtest1() {
        let sut = Program()
        
        var arr = [1, 2, 3]
        /*
         1,2,3
         1,3,2
         
         
         */
        let res = sut.permutations(array: &arr)
        
    }
    
    func test2() {
        let sut = Program()
        
        var arr = [1, 2, 3, 4, 5, 6]
        /*  1,2,3,4,5,6
            1,2,3,4,6,5
            1,2,3,6,4,5
         */
        let res = sut.permutations(array: &arr)
        
    }
    
}

