//
//  CyclicRotation.swift
//  AlgorithmExerciseTests
//
//  Created by Anno Musa on 03/04/22.
//

import Foundation
import XCTest

private func solution(_ A : inout [Int], _ K : Int) -> [Int] {
    guard !A.isEmpty else { return [] }
    
    A.reverse()
    let n = A.count
    
    let modulo = K % n
    
    var start = reverse(arr: Array(A[0..<modulo]))
    var end = reverse(arr: Array(A[modulo..<n]))
    
    return start + end
}

private func reverse(arr: [Int]) -> [Int] {
    return arr.reversed()
}

class CyclicRotationTests: XCTestCase {
    
    func test1() {
        
        var a1: [Int] = [3, 8, 9, 7, 6]
        XCTAssertEqual([6, 3, 8, 9, 7], solution(&a1, 1))
        
        var a2: [Int] = [3, 8, 9, 7, 6]
        XCTAssertEqual([9, 7, 6, 3, 8], solution(&a2, 3))
        
        var a3: [Int] = [3, 8, 9, 7, 6]
        XCTAssertEqual([6, 3, 8, 9, 7], solution(&a3, 1))
        
        var a4: [Int] = [3, 8, 9, 7, 6]
        XCTAssertEqual([6, 3, 8, 9, 7], solution(&a4, 1))
        
        var a5: [Int] = []
        XCTAssertEqual([], solution(&a5, 1))
        
    }
    
}
