//
//  MinSwaps2Tests.swift
//  LeetCodeTests
//
//  Created by Anno Musa on 23/05/21.
//

import Foundation
import XCTest
@testable import AlgorithmExercise

class MinSwaps2 {
    
    func minimumSwaps(arr: [Int]) -> Int {
        var countSwap: Int = 0
        var isVisited: [Bool] = [Bool](repeating: false, count: arr.count + 1)
        var nodeMap: [Int: Int] = [:]
        
        var newArr = arr
        
        for i in 1...arr.count {
            nodeMap[i] = arr[i-1]
        }
        
        for i in 1...arr.count {
            if !isVisited[i] {
                isVisited[i] = true
                
                if i == nodeMap[i] {
                    continue
                } else {
                    var nextNode: Int?
                    var current: Int = nodeMap[i]!
                    while (!isVisited[current]) {
                        isVisited[current] = true
                        nextNode = nodeMap[current]
                        current = nextNode!
                        countSwap += 1
                        
                        newArr.swapAt(current-1, nextNode!-1)
                        print("swap \(newArr)")
                    }
                }
            }
        }
        
        print("swap \(newArr)")
        
        return countSwap
    }
    
}

class MinSwaps2Tests: XCTestCase {
    
    var sut: MinSwaps2!
    
    override func setUp() {
        sut = MinSwaps2()
    }
    
    func testExample1() {
        let arr = [7, 1, 3, 2, 4, 5, 6]
        let res = sut.minimumSwaps(arr: arr)
        
        XCTAssertEqual(res, 5)
    }
    
    func testExample2() {
        let arr = [4,3,1,2]
        let res = sut.minimumSwaps(arr: arr)
        
        XCTAssertEqual(res, 3)
    }
    
    func testExample3() {
        let arr = [2,3,4,1,5]
        let res = sut.minimumSwaps(arr: arr)
        
        XCTAssertEqual(res, 3)
    }
    
    func testExample4() {
        let arr = [1,3,5,2,4,6,7]
        let res = sut.minimumSwaps(arr: arr)
        
        XCTAssertEqual(res, 3)
    }
}
