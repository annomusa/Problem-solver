//
//  SmallestDifference.swift
//  AlgorithmExerciseTests
//
//  Created by Anno Musa on 02/04/22.
//

import Foundation
import XCTest

private class Program {
    func smallestDifference(arrayOne: inout [Int], arrayTwo: inout [Int]) -> [Int] {
        
        arrayOne.sort()
        arrayTwo.sort()
        
        var res: (Int, Int) = (0,0)
        
        var smallestDiff: Int = .max
        for i in arrayOne {
            
            for j in arrayTwo {
                if abs(i-j) < smallestDiff {
                    smallestDiff = abs(i-j)
                    res = (i,j)
                }
                
                if i < j {
                    break
                } else if i > j {
                    continue
                }
                
            }
            
        }
        
        return [res.0, res.1]
    }
}

class SmallestDifference: XCTestCase {
    
    func test1() {
        let sut = Program()
        
        var arr1 = [-1,5,10,20,28,3]
        var arr2 = [26,134,135,15,17]
        
        let res = sut.smallestDifference(arrayOne: &arr1, arrayTwo: &arr2)
        
        
    }
    
}
