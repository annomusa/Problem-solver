//
//  MoveElementToEnd.swift
//  AlgorithmExerciseTests
//
//  Created by Anno Musa on 02/04/22.
//

import Foundation
import XCTest

private class Program {
    func moveElementToEnd(_ array: inout [Int], _ toMove: Int) -> [Int] {
        
        var toMoveArr: [Int] = []
        array.removeAll { val in
            if val == toMove {
                toMoveArr.append(val)
            }
            return val == toMove
        }
        array.append(contentsOf: toMoveArr)
        
        return array
    }
}

class MoveElementToEndTests: XCTestCase {
    
    func test1() {
        let sut = Program()
        var array = [2, 1, 2, 2, 2, 3, 4, 2]
        sut.moveElementToEnd(&array, 2)
    }
    
}
