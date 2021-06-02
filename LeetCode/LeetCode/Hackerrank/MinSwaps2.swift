//
//  MinSwaps2.swift
//  LeetCode
//
//  Created by Anno Musa on 23/05/21.
//

import Foundation

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
