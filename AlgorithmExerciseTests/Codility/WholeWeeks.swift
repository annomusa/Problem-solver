//
//  WholeWeeksTests.swift
//  LeetCodeTests
//
//  Created by Anno Musa on 22/05/21.
//

import Foundation
import XCTest
@testable import AlgorithmExercise

let calendar = Calendar(identifier: .gregorian)

class WholeWeeks {
    func solution(
        _ Y : Int,
        _ A : inout String,
        _ B : inout String,
        _ W : inout String
    ) -> Int {
        
        let startHoliday = getDay("\(Y)-\(A)-1")
        let endHoliday = getDay("\(Y)-\(B)-1").endOfMonth
        
        let startHolidayIndex = startHoliday.indexDay
        let endHolidayIndex = endHoliday.indexDay
        
        print("whole weeks", startHolidayIndex)
        print("whole weeks", endHolidayIndex)
        
        var componentsStartHawaii = DateComponents()
        if startHolidayIndex != 2 {
            componentsStartHawaii.day = 7 - startHolidayIndex + 2
        }
        let startHawaii = calendar.date(byAdding: componentsStartHawaii, to: startHoliday)!
        print("whole weeks", startHawaii.indexDay)
        
        var componentsEndHawaii = DateComponents()
        if endHolidayIndex != 2 {
            componentsEndHawaii.day = -(endHolidayIndex - 2)
        }
        let endHawaii = calendar.date(byAdding: componentsEndHawaii, to: endHoliday)!
        print("whole weeks", endHawaii.indexDay)
        print("whole weeks", endHawaii)
        
        let diffComponents = calendar.dateComponents([.weekOfYear], from: startHawaii, to: endHawaii)
        return diffComponents.weekOfYear!
    }
    
    private func getDay(_ string: String) -> Date {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MMMM-d"
        formatter.timeZone = TimeZone(secondsFromGMT: 0)
        let date = formatter.date(from: string)!
        print("whole weeks: ", date)
        return date
    }
    
    private func isLeapYear(year: Int) -> Bool {
        if year % 4 == 0 {
            if year % 100 == 0 {
                if year % 400 == 0 {
                    return true
                } else {
                    return false
                }
            } else {
                return true
            }
        } else {
            return false
        }
    }
}

extension Date {
    
    var indexDay: Int {
        calendar.dateComponents([.weekday], from: self).weekday!
    }
    
    var startOfMonth: Date {
        let calendar = Calendar(identifier: .gregorian)
        let components = calendar
            .dateComponents([.year, .month], from: self)
        return  calendar.date(from: components)!
    }
    
    var endOfMonth: Date {
        var components = DateComponents()
        components.month = 1
        components.second = -1
        return Calendar(identifier: .gregorian)
            .date(byAdding: components, to: startOfMonth)!
    }
}

class WholeWeeksTests: XCTestCase {
    
    var sut: WholeWeeks!
    
    override func setUp() {
        sut = WholeWeeks()
    }
    
    func testExample1() {
        let expectation = 7
        var Y = 2014, A = "April", B = "May", W = "Wednesday"
        let result = sut.solution(Y, &A, &B, &W)
        
        XCTAssertEqual(expectation, result)
    }
    
    func testExample2() {
        let expectation = 4
        var Y = 2021, A = "January", B = "January", W = "Wednesday"
        let result = sut.solution(Y, &A, &B, &W)
        
        XCTAssertEqual(expectation, result)
    }
    
    func testExample3() {
        let expectation = 29
        var Y = 2021, A = "January", B = "July", W = "Wednesday"
        let result = sut.solution(Y, &A, &B, &W)
        
        XCTAssertEqual(expectation, result)
    }
    
    func testExample4() {
        let expectation = 8
        var Y = 2020, A = "April", B = "May", W = "Wednesday"
        let result = sut.solution(Y, &A, &B, &W)
        
        XCTAssertEqual(expectation, result)
    }
    
    func testExample5() {
        let expectation = 7
        var Y = 2014, A = "April", B = "May", W = "Wednesday"
        let result = sut.solution(Y, &A, &B, &W)
        
        XCTAssertEqual(expectation, result)
    }
    
    func testExample6() {
        let expectation = 7
        var Y = 2014, A = "April", B = "May", W = "Wednesday"
        let result = sut.solution(Y, &A, &B, &W)
        
        XCTAssertEqual(expectation, result)
    }
    
    func testExample7() {
        let expectation = 7
        var Y = 2014, A = "April", B = "May", W = "Wednesday"
        let result = sut.solution(Y, &A, &B, &W)
        
        XCTAssertEqual(expectation, result)
    }
    
    
}
