//
//  ContinuousMedianHandler.swift
//  AlgorithmExerciseTests
//
//  Created by Anno Musa on 10/04/22.
//

import Foundation
import XCTest
@testable import AlgorithmExercise

private class Program {
    /*
     1,2,3,4 = 4 / 2 = 2
     */
    class ContinuousMedianHandler {
        var median: Double {
            var res = Double(array[medianIndex.0])
            if let sec = medianIndex.1 {
                let secDouble = Double(array[sec])
                res = ((res + secDouble) / 2.0)
            }
            return res
        }
        var array: [Int] = []
        var medianIndex: (Int, Int?) = (0, nil)
        
        init() {
            // Write your code here
        }
        
        func getMedian() -> Double {
            
            if let sec = medianIndex.1 {
                
            }
            return median
        }
        
        func insert(number: Int) {
            array.append(number)
            array.sort()
            if array.count % 2 == 0 {
                /*
                 2 = 0,1
                 4 = 1,2
                 6 = 2,3
                 8 = 3,4
                 */
                let first = (array.count / 2) - 1
                medianIndex = (first, first + 1)
            } else {
                /*
                 1 = 0
                 3 = 1
                 5 = 2
                 7 = 3
                 */
                let first = array.count / 2
                medianIndex = (first, nil)
            }
        }
    }
}

private class Program2 {
    /*
     1,2,3,4 = 4 / 2 = 2
     */
    class ContinuousMedianHandler {
        var median: Double {
            if lowers.count() == highers.count() {
                return Double(lowers.peek()! + highers.peek()!) / 2
            } else if lowers.count() > highers.count() {
                return Double(lowers.peek()!)
            } else {
                return Double(highers.peek()!)
            }
        }
        
        var lowers: MaxHeap = MaxHeap([])
        var highers: MinHeap = MinHeap([])
        
        init() { }
        
        func getMedian() -> Double {
            return median
        }
        
        func insert(number: Int) {
            if lowers.count() == 0 || number < lowers.peek()! {
                lowers.insertValue(number)
            } else {
                highers.insertValue(number)
            }
            
            if lowers.count() - highers.count() == 2 {
                highers.insertValue(lowers.remove()!)
            } else if highers.count() - lowers.count() == 2 {
                lowers.insertValue(highers.remove()!)
            }
        }
    }
}

class ContinuousMedianHandlerTests: XCTestCase {
    
    func test1() {
        let sut = Program2.ContinuousMedianHandler()
        sut.insert(number: 5)
        XCTAssertEqual(sut.getMedian(), 5)
        
        sut.insert(number: 10)
        XCTAssertEqual(sut.getMedian(), 7.5)
        
        sut.insert(number: 100)
        XCTAssertEqual(sut.getMedian(), 10)
        
        sut.insert(number: 200)
        sut.insert(number: 6)
    }
    
}
