//
//  AddStrings.swift
//  LeetCode
//
//  Created by Anno Musa on 22/05/21.
//

import Foundation

class AddStrings {
    
    func addStrings(_ num1: String, _ num2: String) -> String {
        var result: String = ""
        
        var carry = 0
        var p1 = num1.count - 1
        var p2 = num2.count - 1
        while (p1 >= 0 || p2 >= 0) {
            var x1 = Int("\((p1 >= 0) ? num1[p1] : "0")") ?? 0
            var x2 = Int("\((p2 >= 0) ? num2[p2] : "0")") ?? 0
            var value = (x1 + x2 + carry) % 10
            carry = (x1 + x2 + carry) / 10
            result.append("\(value)")
            p1 -= 1
            p2 -= 1
        }
        
        if carry != 0 {
            result.append("\(carry)")
        }
        
        return String(result.reversed())
    }
    
}
