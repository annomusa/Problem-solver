//
//  MergeSortedLists.swift
//  LeetCode
//
//  Created by Anno Musa on 22/05/21.
//

import Foundation

class MergeSortedLists {
    func mergeTwoLists(
        _ l1: ListNode?,
        _ l2: ListNode?
    ) -> ListNode? {
        var result: ListNode? = nil
        
        guard let l1 = l1 else { return l2 }
        guard let l2 = l2 else { return l1 }
        
        if l1.val < l2.val {
            result = l1
            result?.next = mergeTwoLists(l1.next, l2)
        } else {
            result = l2
            result?.next = mergeTwoLists(l1, l2.next)
        }
        
        return result
    }
}
