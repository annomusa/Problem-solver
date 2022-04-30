//
//  347-top-k-frequent-elements.swift
//  AlgorithmExerciseTests
//
//  Created by Anno Musa on 25/04/22.
//

import Foundation
import XCTest
@testable import AlgorithmExercise

private class Item {
    let num: Int
    var counter = 1
    init(num: Int) {
        self.num = num
    }
}

extension Item: Comparable {
    static func < (lhs: Item, rhs: Item) -> Bool {
        return lhs.counter < rhs.counter
    }
    
    static func == (lhs: Item, rhs: Item) -> Bool {
        return lhs.num == rhs.num
    }
}

private class Solution {
    func topKFrequent(_ nums: [Int], _ k: Int) -> [Int] {
        
        var items: [Int: Item] = [:]
        for num in nums {
            if let item = items[num] {
                item.counter += 1
            } else {
                items[num] = Item(num: num)
            }
        }
        
        var array: [Item] = []
        for item in items.values {
            array.append(item)
        }
        
        var heap: Heap<Item> = Heap(array, comparator: { $0 > $1 })
        
        var result: [Int] = []
        for i in 0..<k {
            result.append(heap.remove()!.num)
        }
        
        return result
    }
}

class TopKFrequentElementsTests: XCTestCase {
    
    func test1() {
        
        var sut = Solution()
        
        XCTAssertEqual(sut.topKFrequent([1,1,1,2,2,3], 2), [1,2])
        
        XCTAssertEqual(sut.topKFrequent([1], 1), [1])
        
    }
    
}
