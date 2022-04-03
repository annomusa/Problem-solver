//
//  RemoveKthNodeEnd.swift
//  AlgorithmExerciseTests
//
//  Created by Anno Musa on 01/04/22.
//

import Foundation
@testable import AlgorithmExercise
import XCTest

private class Program {
    // This is an input class. Do not edit.
    class LinkedList {
        var value: Int?
        var next: LinkedList?
        
        init(value: Int) {
            self.value = value
            next = nil
        }
    }
    
    func removeKthNodeFromEnd(head: LinkedList, k: Int) {
        
        var current: LinkedList? = head
        var n = 0
        var delete: LinkedList?
        while let curr = current {
            n += 1
            
            if delete != nil {
                delete = delete?.next
            }
            if n - (k + 1) == 0 {
                delete = head
            }
            
            current = curr.next
        }
        
        if n == k {
            head.value = head.next?.value
            head.next = head.next?.next
        } else {
            delete?.next = delete?.next?.next
        }
        
    }
}

class RemoveKthNodeEndTests: XCTestCase {
    
    func test1() {
        let sut = Program()
        let list = Program.LinkedList(arr: [0,1,2,3,4,5,6,7,8,9])
        
        sut.removeKthNodeFromEnd(head: list, k: 4)
    }
    
    func test2() {
        let sut = Program()
        let list = Program.LinkedList(arr: [0,1,2,3,4,5,6,7,8,9])
        
        sut.removeKthNodeFromEnd(head: list, k: 10)
    }
    
}

private extension Program.LinkedList {
    convenience init(arr: [Int]) {
        var arr = arr
        self.init(value: arr.removeFirst())
        
        var curr: Program.LinkedList? = self
        for val in arr {
            let new = Program.LinkedList(value: val)
            curr?.next = new
            curr = new
        }
        
    }
    
    func printVal() {
        var current: Program.LinkedList? = self
        while let curr = current {
            print((value ?? "-"))
            current = curr.next
        }
    }
}
