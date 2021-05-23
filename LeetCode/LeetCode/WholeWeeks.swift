//
//  WholeWeeks.swift
//  LeetCode
//
//  Created by Anno Musa on 22/05/21.
//

import Foundation

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
