//
//  295-find-median-from-data-stream.swift
//  AlgorithmExerciseTests
//
//  Created by Anno Musa on 12/04/22.
//

import Foundation
import XCTest
@testable import AlgorithmExercise

private class MedianFinder {
    
    private let lowerHeap: Heap<Int>
    private let higherHeap: Heap<Int>
    
    init() {
        lowerHeap = Heap([], comparator: { $0 > $1 })
        higherHeap = Heap([], comparator: { $0 < $1 })
    }
    
    func addNum(_ num: Int) {
        
        if lowerHeap.isEmpty() && higherHeap.isEmpty() {
            
            lowerHeap.insertValue(num)
            
        } else if let lowerPeek = lowerHeap.peek(), num <= lowerPeek {
            
            lowerHeap.insertValue(num)
            
        } else {
            
            higherHeap.insertValue(num)
            
        }
        
        if abs(lowerHeap.count() - higherHeap.count()) > 1 {
            if lowerHeap.count() > higherHeap.count(), let lowerMax = lowerHeap.remove() {
                higherHeap.insertValue(lowerMax)
            } else if let minHigher = higherHeap.remove() {
                lowerHeap.insertValue(minHigher)
            }
        }
    }
    
    func findMedian() -> Double {
        
        if lowerHeap.count() > higherHeap.count() {
            return Double(lowerHeap.peek()!)
        } else if higherHeap.count() > lowerHeap.count() {
            return Double(higherHeap.peek()!)
        } else if lowerHeap.count() == 0 {
            return 0
        } else {
            return (Double(lowerHeap.peek()!) + Double(higherHeap.peek()!)) / Double(2)
        }
        
        return Double(0)
    }
}

class MedianFinderTests: XCTestCase {
    
    func xtest1() {
        
        let sut = MedianFinder()
        sut.addNum(0)
        XCTAssertEqual(0, sut.findMedian())
        sut.addNum(1)
        XCTAssertEqual(0.5, sut.findMedian())
        sut.addNum(2)
        XCTAssertEqual(1, sut.findMedian())
        sut.addNum(-10)
        XCTAssertEqual(0.5, sut.findMedian())
        
    }
    
    func test2() {
        
        let sut = MedianFinder()
        sut.addNum(1)
        XCTAssertEqual(1, sut.findMedian())
        sut.addNum(2)
        XCTAssertEqual(1.5, sut.findMedian())
        sut.addNum(3)
        XCTAssertEqual(2.0, sut.findMedian())
        
    }
    
}
