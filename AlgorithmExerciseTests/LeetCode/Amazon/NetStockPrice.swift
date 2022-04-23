//
//  NetStockPrice.swift
//  AlgorithmExerciseTests
//
//  Created by Anno Musa on 16/04/22.
//
// https://leetcode.com/discuss/interview-question/1858858/amazon-oa
//Given the stock prices of n months, the net price change for the i-th month is defined as the absolute difference between the average of stock prices for the first i months and for the remaining (n−i) months where 1≤i≤n.
//Note that these averages are rounded down to an integer.
//
//The average of a set of integers here is defined as the sum of integers divided by the number of integers, rounded down to the nearest integer.
//For example, the average of [1, 2, 3, 4] is the floor of (1 + 2 + 3 + 4) / 4 = 2.5 and the floor of 2.5 is 2.
//
//Given an array of stock prices, find the month at which the net price change is minimum.
//If there are several such months, return the earliest month.
//
//Constraints:
//
//2 <= n <= 10^5
//
//1 <= stockPrice[i] <= 10^9


import Foundation
import XCTest

private func findMinNetPriceChange(_ nums: [Int]) -> Int {
    guard nums.count > 1 else { return 0 }
    
    let n = nums.count
    
    var minNetChange: Int = .max
    
    var totalSum = nums.reduce(0, +)
    var leftSum = 0
    var minNetChangeIndex = 0
    
    for i in 0..<n {
        
        leftSum += nums[i]
        
        var leftAvg = leftSum / (i+1)
        
        var rightSum = totalSum - leftSum
        var rightAvg = i == n-1 ? 0 : rightSum / (n-i-1)
        
        var currNetChange = abs(leftAvg - rightAvg)
        
        if currNetChange < minNetChange {
            minNetChange = currNetChange
            minNetChangeIndex = i
        }
        
    }
    
    return minNetChangeIndex
}

class FindMinNetPriceChangeTests: XCTestCase {
    
    func test1() {
        
        XCTAssertEqual(
            findMinNetPriceChange([10,14,13,15,16,17]),
            1
        )
        
    }
    
}
