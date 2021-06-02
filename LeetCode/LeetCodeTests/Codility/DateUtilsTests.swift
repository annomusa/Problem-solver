//
//  DateUtilsTests.swift
//  LeetCodeTests
//
//  Created by Anno Musa on 26/05/21.
//

import Foundation
import XCTest
@testable import LeetCode

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
