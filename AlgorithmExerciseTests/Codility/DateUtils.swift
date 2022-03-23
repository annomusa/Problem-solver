//
//  DateUtilsTests.swift
//  LeetCodeTests
//
//  Created by Anno Musa on 26/05/21.
//

import Foundation
import XCTest
@testable import AlgorithmExercise

extension String {
    func toDate() -> Date? {
        
        var segment = components(separatedBy: " ")
        
        switch segment.count {
        case 5:
            let currentFormatter = dateFormatter1()
            let timeZone = segment.removeLast()
            currentFormatter.timeZone = TimeZone(abbreviation: timeZone)
            return currentFormatter.date(from: segment.joined(separator: " "))
        case 2:
            let currentFormatter = dateFormatter2()
            return currentFormatter.date(from: self)
        case 1:
            let currentFormatter = dateFormatter3()
            return currentFormatter.date(from: self)
        default:
            return nil
        }
        
    }
    
    /// "12 Dec 2018 22:15:00 CST"
    /// "03 Feb 2020 12:10:45 CET"
    private func dateFormatter1() -> DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd MMM yyyy HH:mm:ss"
        return formatter
    }
    
    /// "Sunday 26/April/2020"
    /// "Monday 06/April/2020"
    private func dateFormatter2() -> DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = "EEEE dd/MMMM/yyyy"
        formatter.timeZone = TimeZone(secondsFromGMT: 0)
        return formatter
    }
    
    /// "20(Wed).12(Dec).2006"
    /// "6(Mon).01(Jan).2020"
    private func dateFormatter3() -> DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = "d(E).MM(MMM).yyyy"
        formatter.timeZone = TimeZone(secondsFromGMT: 0)
        return formatter
    }
}

extension Date {
    var day: Int? {
        let cal = Calendar(identifier: .gregorian)
        let res = cal.dateComponents([.day], from: self)
        return res.day
    }

    var nameOfDay: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "cccc"
        return dateFormatter.string(from: self)
    }

    var month: Int? {
        let cal = Calendar(identifier: .gregorian)
        let res = cal.dateComponents([.month], from: self)
        return res.month
    }

    var nameOfTheMonth: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMMM"
        return dateFormatter.string(from: self)
    }

    var year: Int? {
        let cal = Calendar(identifier: .gregorian)
        let res = cal.dateComponents([.year], from: self)
        return res.year
    }

    static func numberOfDaysBetween(_ date: Date, and date2: Date) -> Int? {
        let a, b: Date
        if date.compare(date2) == .orderedAscending {
            a = date
            b = date2
        } else {
            a = date2
            b = date
        }
        return Calendar(identifier: .gregorian).dateComponents([.day], from: a, to: b).day
    }
}

class DateUtils: XCTestCase {
    
    func testExample1() {
        print("date utils: ", "12 Dec 2018 22:15:00 CST".toDate())
        print("date utils: ", "03 Feb 2020 12:10:45 CET".toDate())
        
        print("date utils: ", "Sunday 26/April/2020".toDate())
        print("date utils: ", "Monday 06/April/2020".toDate())
        
        print("date utils: ", "20(Wed).12(Dec).2006".toDate())
        print("date utils: ", "6(Mon).1(Jan).2020".toDate())
        
        print("date utils: ", "6(Mon).1(Jan).2020".toDate()?.day)
        print("date utils: ", "6(Mon).1(Jan).2020".toDate()?.nameOfDay)
        print("date utils: ", "6(Mon).1(Jan).2020".toDate()?.month)
        print("date utils: ", "6(Mon).1(Jan).2020".toDate()?.nameOfTheMonth)
        print("date utils: ", "6(Mon).1(Jan).2020".toDate()?.year)
        
    }
    
}
