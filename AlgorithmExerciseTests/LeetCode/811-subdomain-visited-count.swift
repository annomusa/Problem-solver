//
//  811-subdomain-visited-count.swift
//  AlgorithmExerciseTests
//
//  Created by Anno Musa on 27/04/22.
//

import Foundation
import XCTest

private class Solution {
    func subdomainVisits(_ cpdomains: [String]) -> [String] {
        var res: [String] = []
        
        var counter: [String: Int] = [:]
        
        for cpdomain in cpdomains {
            var info = cpdomain.split(separator: " ")
            var count = Int(info[0]) ?? 0
            var domains = info[1].split(separator: ".")
//            print("domainzz \(count) \(domains)")
            
            var cur = ""
            for i in (0..<domains.count).reversed() {
                
                if cur.isEmpty {
                    cur = String(domains[i])
                    counter[cur] = counter[cur, default: 0] + count
                } else {
                    cur = domains[i] + "." + cur
                    counter[cur] = counter[cur, default: 0] + count
                }
                
            }
        }
        
        for (key, value) in counter {
            res.append("\(value) \(key)")
        }
        
//        print("domainzzz \(res)")
        
        return res
    }
}

class SubdomainVisitedCountTests: XCTestCase {
    
    func xtest1() {
        
        var sut = Solution()
        
        XCTAssertEqual(
            sut.subdomainVisits(["9001 discuss.leetcode.com"]),
            ["9001 com", "9001 discuss.leetcode.com", "9001 leetcode.com"]
        )
        
        XCTAssertEqual(
            sut.subdomainVisits(["900 google.mail.com", "50 yahoo.com", "1 intel.mail.com", "5 wiki.org"]),
            ["901 mail.com","50 yahoo.com","900 google.mail.com","5 wiki.org","5 org","1 intel.mail.com","951 com"]
        )
        
    }
    
}
