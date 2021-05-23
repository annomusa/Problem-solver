//
//  Date.swift
//  LeetCode
//
//  Created by Anno Musa on 23/05/21.
//

import Foundation

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
