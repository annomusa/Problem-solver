//
//  DoubleListNode.swift
//  AlgorithmExercise
//
//  Created by Anno Musa on 16/04/22.
//

import Foundation

class DoubleListNode {
    var prev: DoubleListNode?
    var next: DoubleListNode?
    var key: Int
    var value: Int
    
    init(key: Int, value: Int) {
        self.key = key
        self.value = value
    }
}
