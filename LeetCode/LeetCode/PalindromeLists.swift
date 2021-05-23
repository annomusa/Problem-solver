//
//  PalindromeLists.swift
//  LeetCode
//
//  Created by Anno Musa on 22/05/21.
//

import Foundation

class PalindromeLists {
    func isPalindrome(_ head: ListNode?) -> Bool {
        guard var curr: ListNode? = head else { return true }
        var list: [Int] = []
        while curr != nil {
            list.append(curr!.val)
            curr = curr?.next
        }
        
        var start: Int = 0
        var end: Int = list.count - 1
        while start < end {
            if list[start] != list[end] {
                return false
            }
            start += 1
            end -= 1
        }
        
        return true
    }
}
