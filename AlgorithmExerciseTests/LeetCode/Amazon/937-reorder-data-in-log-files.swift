//
//  937-reorder-data-in-log-files.swift
//  AlgorithmExerciseTests
//
//  Created by Anno Musa on 15/04/22.
//

import Foundation
import XCTest

private class Solution {
    func reorderLogFiles(_ logs: [String]) -> [String] {
        var res: [String] = []
        
        res = logs.sorted { str1, str2 -> Bool in
            let split1 = str1.split(separator: " ", maxSplits: 1)
            let split2 = str2.split(separator: " ", maxSplits: 1)
            
            let afterID1 = split1[1]
            let afterID2 = split2[1]
            
            let isDigit1 = afterID1.first!.isNumber
            let isDigit2 = afterID2.first!.isNumber
            
            if !isDigit1 && !isDigit2 {
                if afterID1.compare(afterID2) == .orderedSame {
                    return split1[0].compare(split2[0]) == .orderedAscending
                } else {
                    return afterID1.compare(afterID2) == .orderedAscending
                }
            } else if isDigit1 && isDigit2 {
                return afterID1.compare(afterID2) == .orderedSame
            } else {
                return afterID1.compare(afterID2) == .orderedDescending
            }
        }
        
        return res
    }
}

class ReorderDataLogFilesTests: XCTestCase {
    
    func test1() {
        
        let sut = Solution()
        
        
        let res1 = sut.reorderLogFiles([
            "dig1 8 1 5 1",
            "let1 art can",
            "dig2 3 6",
            "let2 own kit dig",
            "let3 art zero"
        ])
        
        XCTAssertEqual(res1, [
            "let1 art can",
            "let3 art zero",
            "let2 own kit dig",
            "dig1 8 1 5 1",
            "dig2 3 6"
        ])
        
        let res2 = sut.reorderLogFiles([
            "a1 9 2 3 1",
            "g1 act car",
            "zo4 4 7",
            "ab1 off key dog",
            "a8 act zoo"
        ])
        
        XCTAssertEqual(res2, [
            "g1 act car",
            "a8 act zoo",
            "ab1 off key dog",
            "a1 9 2 3 1",
            "zo4 4 7"
        ])
    }
    
}
