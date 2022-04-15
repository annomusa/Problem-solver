//
//  739-daily-temperatures.swift
//  AlgorithmExerciseTests
//
//  Created by Anno Musa on 06/04/22.
//

import XCTest

private class Solution {
    func dailyTemperatures(_ temperatures: [Int]) -> [Int] {
        let n = temperatures.count
        var result: [Int] = Array(repeating: 0, count: n)
        
        var stack: [Int] = []
        
        for temperature in temperatures.enumerated() {
            
            while let last = stack.last, temperatures[last] < temperature.element {
                result[last] = temperature.offset - last
                stack.removeLast()
            }
            
            stack.append(temperature.offset)
        }
        
        return result
    }
}

private class Solution2 {
    func dailyTemperatures(_ temperatures: [Int]) -> [Int] {
        let n = temperatures.count
        var result: [Int] = Array(repeating: 0, count: n)
        var hottest: Int = .min
        
        for temperature in temperatures.enumerated().reversed() {
            if temperature.element >= hottest {
                hottest = temperature.element
                continue
            }
            
            var days = 1
            while temperatures[temperature.offset + days] <= temperature.element {
                days += result[temperature.offset + days]
            }
            result[temperature.offset] = days
        }
        
        return result
    }
}

class _739_daily_temperatures: XCTestCase {
    
    func test1() {
        
        let sut = Solution()
        XCTAssertEqual([1,1,4,2,1,1,0,0], sut.dailyTemperatures([73,74,75,71,69,72,76,73]))
        XCTAssertEqual([1,1,1,0], sut.dailyTemperatures([30,40,50,60]))
        XCTAssertEqual([1,1,0], sut.dailyTemperatures([30,60,90]))
    }
    
    func test2() {
        
        let sut = Solution2()
        XCTAssertEqual([1,1,4,2,1,1,0,0], sut.dailyTemperatures([73,74,75,71,69,72,76,73]))
        XCTAssertEqual([1,1,1,0], sut.dailyTemperatures([30,40,50,60]))
        XCTAssertEqual([1,1,0], sut.dailyTemperatures([30,60,90]))
        
        XCTAssertEqual([1,1,4,3,1,1,0], sut.dailyTemperatures([0,1,8,7,3,4,9]))
        
        XCTAssertEqual([1,0,0,2,1,0,0,0,0,0], sut.dailyTemperatures([34,80,80,34,34,80,80,80,80,34]))
    }
}

