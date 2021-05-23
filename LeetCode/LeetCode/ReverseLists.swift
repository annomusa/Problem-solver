//
//  ReverseLists.swift
//  LeetCode
//
//  Created by Anno Musa on 22/05/21.
//

import Foundation

class ReverseLists {
    
    func reverseList(_ head: ListNode?) -> ListNode? {
        var prev: ListNode?
        var curr: ListNode? = head
        
        while curr != nil {
            var temp = curr?.next
            curr?.next = prev
            prev = curr
            curr = temp
        }
        
        return prev
    }
}
